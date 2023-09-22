abstract class PasscodeRepository {
  Future<String?> getPasscode();

  Future<void> savePasscode(String title);

}