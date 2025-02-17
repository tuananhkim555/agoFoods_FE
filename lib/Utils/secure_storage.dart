import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // ignore: prefer_const_constructors
  static final _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'accessToken', value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: 'accessToken');
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: 'accessToken');
  }
}