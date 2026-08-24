import 'dart:async';
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
  static const _lockoutSecs   = 30;

  final _localAuth = LocalAuthentication();

  bool _locked  = true;
  bool _pinSet  = false;

  bool get isLocked => _locked;
  bool get isPinSet => _pinSet;

  Future<void> init() async {
    final pin = await _storage.read(key: _pinKey);
    _pinSet  = pin != null && pin.isNotEmpty;
    _locked  = _pinSet;
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

  Future<bool> validatePin(String pin) async {
    if (await lockoutRemaining() != null) return false;

    final stored = await _storage.read(key: _pinKey);
    if (stored == pin) {
      await _storage.delete(key: _failKey);
      await _storage.delete(key: _lockoutKey);
      _locked = false;
      notifyListeners();
      return true;
    }

    final fails = await failCount() + 1;
    if (fails >= _maxFails) {
      final until = DateTime.now().add(const Duration(seconds: _lockoutSecs));
      await _storage.write(key: _lockoutKey, value: until.toIso8601String());
      await _storage.delete(key: _failKey);
    } else {
      await _storage.write(key: _failKey, value: fails.toString());
    }
    return false;
  }

  Future<void> setPin(String pin) async {
    await _storage.write(key: _pinKey, value: pin);
    _pinSet = true;
    _locked = false;
    notifyListeners();
  }

  void onBackground() {
    _storage.write(key: _bgKey, value: DateTime.now().toIso8601String());
  }

  Future<void> onForeground() async {
    if (!_pinSet) return;
    final str = await _storage.read(key: _bgKey);
    if (str == null) return;
    final bgTime = DateTime.tryParse(str);
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
