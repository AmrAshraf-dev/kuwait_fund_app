import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecuredStorageData {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const String _usernameKey = "username";
  static const String _passwordKey = "password";

  Future<void> saveCredentials(String username, String password) async {
    await _secureStorage.write(key: _usernameKey, value: username);
    await _secureStorage.write(key: _passwordKey, value: password);
  }

  Future<String?> getUsername() async {
    return await _secureStorage.read(key: _usernameKey);
  }

  Future<String?> getPassword() async {
    return await _secureStorage.read(key: _passwordKey);
  }

  Future<void> clearCredentials() async {
    await _secureStorage.delete(key: _usernameKey);
    await _secureStorage.delete(key: _passwordKey);
  }
}
