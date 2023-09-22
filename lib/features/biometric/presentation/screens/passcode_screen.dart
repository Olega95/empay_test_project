import 'dart:io';

import 'package:empay_test_project/core/router.dart';
import 'package:empay_test_project/features/biometric/presentation/widgets/virtual_pin_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

class PasscodeScreen extends StatefulWidget {
  const PasscodeScreen({super.key});

  @override
  State<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  late TextEditingController _controller;
  String _passcode = '';

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.addListener(() {
      setState(() {
        _passcode = _controller.text;
      });

      if (_controller.text.length == 4) {
        print(_passcode);
        context.pushReplacementNamed(AppRouter.root);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passcode'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 146,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: _passcode.isNotEmpty
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: _passcode.length > 1
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: _passcode.length > 2
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: _passcode.length > 3
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 58),
                VirtualPinKeyboard(
                  controller: _controller,
                  biometricType: Platform.isAndroid
                      ? BiometricType.fingerprint
                      : BiometricType.face,
                  onTapBiometric: () async {
                    final LocalAuthentication auth = LocalAuthentication();
                    await auth.authenticate(
                      localizedReason: 'Reason',
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
