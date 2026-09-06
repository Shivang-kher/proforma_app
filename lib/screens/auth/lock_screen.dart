import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'pin_dots.dart';
import 'pin_pad.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen>
    with SingleTickerProviderStateMixin {
  bool _showPin = false;
  String _pin = '';
  bool _checking = false;
  bool _biometricChecking = false;
  Duration? _lockout;
  Timer? _lockoutTimer;
  late AnimationController _shake;

  @override
  void initState() {
    super.initState();
    _shake = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _refreshLockout();
    _tryBiometric();
  }

  @override
  void dispose() {
    _shake.dispose();
    _lockoutTimer?.cancel();
    super.dispose();
  }

  Future<void> _refreshLockout() async {
    final remaining = await AuthService.instance.lockoutRemaining();
    if (!mounted) return;
    setState(() => _lockout = remaining);
    _lockoutTimer?.cancel();
    if (remaining != null) {
      _lockoutTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
        final r = await AuthService.instance.lockoutRemaining();
        if (!mounted) return;
        setState(() => _lockout = r);
        if (r == null) _lockoutTimer?.cancel();
      });
    }
  }

  Future<void> _tryBiometric() async {
    if (_biometricChecking) return;
    if (!await AuthService.instance.canUseBiometrics) return;
    if (!mounted) return;
    setState(() => _biometricChecking = true);
    try {
      await AuthService.instance.authenticateWithBiometrics();
    } finally {
      if (mounted) setState(() => _biometricChecking = false);
    }
  }

  void _onKey(String digit) {
    if (_checking || _lockout != null || _pin.length >= 6) return;
    setState(() => _pin += digit);
    if (_pin.length == 6) _verify();
  }

  void _onDelete() {
    if (_pin.isEmpty) return;
    setState(() => _pin = _pin.substring(0, _pin.length - 1));
  }

  Future<void> _verify() async {
    setState(() => _checking = true);
    final ok = await AuthService.instance.validatePin(_pin);
    if (!ok && mounted) {
      await _shake.forward(from: 0);
      setState(() {
        _pin = '';
        _checking = false;
      });
      await _refreshLockout();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: _showPin ? _pinView(cs) : _biometricView(cs),
          ),
        ),
      ),
    );
  }

  Widget _biometricView(ColorScheme cs) {
    return Column(
      key: const ValueKey('biometric'),
      children: [
        const Spacer(flex: 2),
        Icon(Icons.local_hospital_rounded, size: 52, color: cs.primary),
        const SizedBox(height: 10),
        Text(
          'Proforma',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: cs.onSurface,
          ),
        ),
        Text(
          'Clinical Data System',
          style: TextStyle(fontSize: 13, color: cs.outline),
        ),
        const Spacer(flex: 2),
        GestureDetector(
          onTap: _biometricChecking ? null : _tryBiometric,
          child: Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _biometricChecking ? cs.outline : cs.primary,
                width: 2,
              ),
              color: (_biometricChecking ? cs.outline : cs.primary)
                  .withValues(alpha: 0.08),
            ),
            child: _biometricChecking
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: CircularProgressIndicator(strokeWidth: 2, color: cs.outline),
                  )
                : Icon(Icons.face_rounded, size: 46, color: cs.primary),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Tap to unlock with Face ID',
          style: TextStyle(fontSize: 14, color: cs.outline),
        ),
        const Spacer(),
        Row(children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text('or', style: TextStyle(color: cs.outline)),
          ),
          const Expanded(child: Divider()),
        ]),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => setState(() => _showPin = true),
          child: const Text('Enter PIN instead →'),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _pinView(ColorScheme cs) {
    return Column(
      key: const ValueKey('pin'),
      children: [
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () => setState(() {
              _showPin = false;
              _pin = '';
            }),
            icon: const Icon(Icons.arrow_back_ios_rounded, size: 16),
            label: const Text('Face ID'),
          ),
        ),
        const Spacer(flex: 2),
        Icon(Icons.local_hospital_rounded, size: 40, color: cs.primary),
        const SizedBox(height: 10),
        Text(
          'Enter your PIN',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: cs.onSurface,
          ),
        ),
        const SizedBox(height: 28),
        if (_lockout != null)
          Text(
            'Too many attempts. Try again in ${_lockout!.inSeconds}s',
            style: TextStyle(color: cs.error, fontSize: 13),
            textAlign: TextAlign.center,
          )
        else
          AnimatedBuilder(
            animation: _shake,
            builder: (_, child) => Transform.translate(
              offset: Offset(sin(_shake.value * pi * 5) * 10, 0),
              child: child,
            ),
            child: PinDots(filled: _pin.length),
          ),
        const Spacer(flex: 2),
        PinPad(
          onKey: _onKey,
          onDelete: _onDelete,
          disabled: _lockout != null || _checking,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
