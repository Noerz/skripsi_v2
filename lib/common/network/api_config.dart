import 'package:get_storage/get_storage.dart';

class ApiConfig {
  ApiConfig._();

  static final box = GetStorage();

  static const String tokenKey = 'accessToken';
  static const String baseUrl = "http://192.168.1.7:3000/api/v1";
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
  static const String login = '/login';
  static const String reset = '/reset';
  static const String users = '/admin';
  static const String posts = '/posts';
  static const String comments = '/comments';
  static const String todos = '/todos';

  static Map<String, dynamic> get header {
    final token = box.read(tokenKey) as String;
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  static Future<void> saveToken(String token) async {
    await box.write(tokenKey, token);
  }

  static void deleteToken() {
    box.remove(tokenKey);
  }
}