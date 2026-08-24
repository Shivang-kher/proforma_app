import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'pin_dots.dart';
import 'pin_pad.dart';

enum _Step { enter, confirm }

class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key});

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen>
    with SingleTickerProviderStateMixin {
  _Step _step = _Step.enter;
  String _pin = '';
  String _firstPin = '';
  late AnimationController _shake;

  @override
  void initState() {
    super.initState();
    _shake = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
  }

  @override
  void dispose() {
    _shake.dispose();
    super.dispose();
  }

  void _onKey(String digit) {
    if (_pin.length >= 6) return;
    setState(() => _pin += digit);
    if (_pin.length == 6) _advance();
  }

  void _onDelete() {
    if (_pin.isEmpty) return;
    setState(() => _pin = _pin.substring(0, _pin.length - 1));
  }

  Future<void> _advance() async {
    if (_step == _Step.enter) {
      setState(() {
        _firstPin = _pin;
        _pin = '';
        _step = _Step.confirm;
      });
    } else {
      if (_pin == _firstPin) {
        await AuthService.instance.setPin(_pin);
        if (mounted && await AuthService.instance.canUseBiometrics) {
          await AuthService.instance.authenticateWithBiometrics();
        }
      } else {
        await _shake.forward(from: 0);
        setState(() {
          _pin = '';
          _firstPin = '';
          _step = _Step.enter;
        });
      }
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
          child: Column(
            children: [
              const Spacer(flex: 2),
              Icon(Icons.local_hospital_rounded, size: 48, color: cs.primary),
              const SizedBox(height: 10),
              Text(
                'Proforma',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: cs.onSurface,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                _step == _Step.enter ? 'Set up your PIN' : 'Confirm your PIN',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: cs.onSurface,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                _step == _Step.enter
                    ? 'This PIN protects patient data on this device.'
                    : 'Enter the same PIN again to confirm.',
                style:
                    TextStyle(fontSize: 13, color: cs.outline),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              AnimatedBuilder(
                animation: _shake,
                builder: (_, child) => Transform.translate(
                  offset: Offset(sin(_shake.value * pi * 5) * 10, 0),
                  child: child,
                ),
                child: PinDots(filled: _pin.length),
              ),
              const Spacer(flex: 2),
              PinPad(onKey: _onKey, onDelete: _onDelete),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
