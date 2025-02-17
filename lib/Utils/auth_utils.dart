// File: lib/utils/auth_utils.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:agofoods/constants/constants.dart'; // Import the constants file


Future<Map<String, String>> refreshToken(String refreshToken) async {
  final url = Uri.parse('$appBaseUrl/api/auth/refresh-token');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'refreshToken': refreshToken}),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final newAccessToken = data['metaData']['accessToken'];
    final newRefreshToken = data['metaData']['refreshToken'];

    // Lưu tokens mới vào storage
    // await saveTokens(newAccessToken, newRefreshToken);

    return {'accessToken': newAccessToken, 'refreshToken': newRefreshToken};
  } else {
    throw Exception('Failed to refresh token: ${response.statusCode}');
  }
}

Future<void> saveTokens(String accessToken, String refreshToken) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('accessToken', accessToken);
  await prefs.setString('refreshToken', refreshToken);
}

Future<String?> getAccessToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('accessToken');
}

Future<String?> getRefreshToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('refreshToken');
}