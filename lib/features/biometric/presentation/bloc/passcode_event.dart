abstract class PasscodeEvent {}

class SavePasscode extends PasscodeEvent {
  final String passcode;

  SavePasscode({required this.passcode});
}

class CheckPasscode extends PasscodeEvent {
  final String passcode;

  CheckPasscode({required this.passcode});
}

class AuthenticateWithBiometric extends PasscodeEvent {}
