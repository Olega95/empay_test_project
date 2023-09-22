import 'dart:developer';

import 'package:empay_test_project/features/biometric/domain/repositories/passcode_repository_impl.dart';
import 'package:empay_test_project/features/biometric/presentation/bloc/passcode_event.dart';
import 'package:empay_test_project/features/biometric/presentation/bloc/passcode_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class PasscodeBloc extends Bloc<PasscodeEvent, PasscodeState> {
  late PasscodeRepositoryImpl _passcodeRepositoryImpl;
  PasscodeBloc() : super(Initial()) {
    on(_onSavePasscode);
    on(_onCheckPasscode);
    on(_onAuthenticateWithBiometric);

    _passcodeRepositoryImpl = PasscodeRepositoryImpl();
  }

  _onSavePasscode(SavePasscode event, Emitter<PasscodeState> emit) async {
    try {
      await _passcodeRepositoryImpl.savePasscode(event.passcode);
      emit(Success());
    } catch (exception, stackTrace) {
    
        await Sentry.captureException(exception, stackTrace: stackTrace);
      
      log(exception.toString());
    }
  }

  _onCheckPasscode(CheckPasscode event, Emitter<PasscodeState> emit) async {
    try {
      final pin = await _passcodeRepositoryImpl.getPasscode();
      if (pin == event.passcode) {
        emit(Success());
      } else {
        emit(Failure());
        await Future.delayed(const Duration(seconds: 2));
        emit(Initial());
      }
    } catch (exception, stackTrace) {
     
        await Sentry.captureException(exception, stackTrace: stackTrace);
      
      log(exception.toString());
    }
  }

  _onAuthenticateWithBiometric(
      AuthenticateWithBiometric event, Emitter<PasscodeState> emit) async {
    final LocalAuthentication auth = LocalAuthentication();
    final isAuth = await auth.authenticate(
        localizedReason: 'Reason',);
    if (isAuth) {
      emit(Success());
    } else {
      emit(Failure());
    }
  }
}
