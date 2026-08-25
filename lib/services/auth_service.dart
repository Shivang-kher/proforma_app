import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

class AuthService extends ChangeNotifier {
  static final instance = AuthService._();
  AuthService._();

  static const _storage = FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
  static const _pinKey        = 'proforma_pin';
  static const _failKey       = 'proforma_fail_count';
  static const _lockoutKey    = 'proforma_lockout_until';
  static const _bgKey         = 'proforma_background_at';
  static const _relockSeconds = 60;
  static const _maxFails      = 3;

  final _localAuth = LocalAuthentication();

  bool _locked  = true;
  bool _pinSet  = false;
  DateTime? _backgroundAt;

  bool get isLocked => _locked;
  bool get isPinSet => _pinSet;

  // SHA-256 with a static app-level salt. Prevents raw PIN exposure from a
  // Keychain dump while keeping storage simple (no per-device salt needed for
  // a 6-digit numeric space that's already protected by lockout).
  static String _hashPin(String pin) {
    final bytes = utf8.encode('${pin}proforma_pin_v1');
    return sha256.convert(bytes).toString();
  }

  Future<void> init() async {
    final stored = await _storage.read(key: _pinKey);
    if (stored == null || stored.isEmpty) {
      _pinSet = false;
      _locked = false;
    } else {
      _pinSet = true;
      _locked = true;
      // One-time migration: if stored value is a raw 6-digit PIN, hash it.
      if (stored.length == 6 && stored.runes.every((c) => c >= 48 && c <= 57)) {
        await _storage.write(key: _pinKey, value: _hashPin(stored));
      }
    }
    notifyListeners();
  }

  Future<bool> get canUseBiometrics async {
    try {
      if (!await _localAuth.canCheckBiometrics) return false;
      return (await _localAuth.getAvailableBiometrics()).isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  Future<bool> authenticateWithBiometrics() async {
    // Biometric must respect the same lockout as PIN — an attacker could
    // otherwise bypass progressive lockout by force-quitting and relaunching.
    if (await lockoutRemaining() != null) return false;
    try {
      final ok = await _localAuth.authenticate(
        localizedReason: 'Unlock Proforma to access patient data',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
      if (ok) {
        _locked = false;
        notifyListeners();
      }
      return ok;
    } catch (_) {
      return false;
    }
  }

  // Returns remaining lockout duration, or null if not locked out.
  Future<Duration?> lockoutRemaining() async {
    final str = await _storage.read(key: _lockoutKey);
    if (str == null) return null;
    final until = DateTime.tryParse(str);
    if (until == null) return null;
    final remaining = until.difference(DateTime.now());
    return remaining.isNegative ? null : remaining;
  }

  Future<int> failCount() async {
    final str = await _storage.read(key: _failKey);
    return int.tryParse(str ?? '0') ?? 0;
  }

  // Progressive lockout: fails accumulate across lockout periods, never resetting
  // until a correct PIN is entered. Each group of _maxFails triggers a longer lockout.
  int _lockoutSeconds(int totalFails) {
    final round = (totalFails / _maxFails).ceil();
    if (round <= 1) return 60;      // 1 min after 3 fails
    if (round == 2) return 300;     // 5 min after 6 fails
    return 1800;                    // 30 min after 9+ fails
  }

  Future<bool> validatePin(String pin) async {
    if (await lockoutRemaining() != null) return false;

    final stored = await _storage.read(key: _pinKey);
    if (stored == _hashPin(pin)) {
      await _storage.delete(key: _failKey);
      await _storage.delete(key: _lockoutKey);
      _locked = false;
      notifyListeners();
      return true;
    }

    final fails = await failCount() + 1;
    await _storage.write(key: _failKey, value: fails.toString());
    if (fails % _maxFails == 0) {
      final until = DateTime.now().add(Duration(seconds: _lockoutSeconds(fails)));
      await _storage.write(key: _lockoutKey, value: until.toIso8601String());
    }
    return false;
  }

  Future<void> setPin(String pin) async {
    await _storage.write(key: _pinKey, value: _hashPin(pin));
    _pinSet = true;
    _locked = false;
    notifyListeners();
  }

  void onBackground() {
    // Store in-memory first so onForeground() can relock even if the process
    // is suspended before the Keychain write completes (iOS may defer it).
    _backgroundAt = DateTime.now();
    unawaited(_storage.write(key: _bgKey, value: _backgroundAt!.toIso8601String()));
  }

  Future<void> onForeground() async {
    if (!_pinSet) return;
    // Prefer the in-memory value (reliable on warm resume); fall back to
    // Keychain (needed after a cold start where onBackground ran in a prior process).
    final bgTime = _backgroundAt ??
        DateTime.tryParse(await _storage.read(key: _bgKey) ?? '');
    _backgroundAt = null;
    if (bgTime == null) return;
    if (DateTime.now().difference(bgTime).inSeconds >= _relockSeconds) {
      _locked = true;
      notifyListeners();
    }
  }

  void lock() {
    _locked = true;
    notifyListeners();
  }
}
