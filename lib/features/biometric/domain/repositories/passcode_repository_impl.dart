import 'package:empay_test_project/features/biometric/data/repositories/passcode_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PasscodeRepositoryImpl extends PasscodeRepository {
  final _storage = const FlutterSecureStorage();
  @override
  Future<String?> getPasscode() async {
    final pin = await _storage.read(
      key: 'pin',
    );
    return pin;
  }

  @override
  Future<void> savePasscode(String passcode) async {
    return await _storage.write(key: 'pin', value: passcode);
  }

}