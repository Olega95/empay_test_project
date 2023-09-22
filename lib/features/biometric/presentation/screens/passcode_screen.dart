import 'dart:io';

import 'package:empay_test_project/core/router.dart';
import 'package:empay_test_project/features/biometric/domain/repositories/passcode_repository_impl.dart';
import 'package:empay_test_project/features/biometric/presentation/bloc/passcode_bloc.dart';
import 'package:empay_test_project/features/biometric/presentation/bloc/passcode_event.dart';
import 'package:empay_test_project/features/biometric/presentation/bloc/passcode_state.dart';
import 'package:empay_test_project/features/biometric/presentation/widgets/virtual_pin_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final repo = PasscodeRepositoryImpl();
    final pin = await repo.getPasscode();
    _controller.addListener(() {
      setState(() {
        _passcode = _controller.text;
      });
      if (context.mounted) {
        if (_passcode.length == 4) {
          if (pin == null) {
            context.read<PasscodeBloc>().add(SavePasscode(passcode: _passcode));
          } else {
            context
                .read<PasscodeBloc>()
                .add(CheckPasscode(passcode: _passcode));
          }
        }
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
      body: BlocConsumer<PasscodeBloc, PasscodeState>(
        builder: (context, state) {
          return Stack(
            children: [
              Align(
                alignment: const Alignment(0, -0.1),
                child: VirtualPinKeyboard(
                  controller: _controller,
                  isFailure: state is Failure,
                  biometricType: Platform.isAndroid
                      ? BiometricType.fingerprint
                      : BiometricType.face,
                  onTapBiometric: () async {
                    if (context.mounted) {
                      context
                          .read<PasscodeBloc>()
                          .add(AuthenticateWithBiometric());
                    }
                  },
                ),
              ),
            ],
          );
        },
        listener: (BuildContext context, PasscodeState state) {
          if (state is Success) {
            context.pushReplacementNamed(AppRouter.root);
          } else if (state is Failure) {
            _controller.clear();
          }
        },
      ),
    );
  }
}
