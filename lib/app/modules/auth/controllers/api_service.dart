import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(); // Membuat instance Dio

  Future<Response> register(String name, String email, String password,
      String role, String gender) async {
    try {
      final response = await _dio.post(
        'https://noerz.my.id/api/v1/register', // Ganti dengan URL register API Anda
        data: {
          'name': name,
          'email': email,
          'password': password,
          'role': role,
          'gender': gender,
        },
      );

      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<String> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'https://noerz.my.id/api/v1/login', // Ganti dengan URL login API Anda
        data: {'email': email, 'password': password},
      );

      // Periksa status response
      if (response.statusCode == 200) {
        // Mengembalikan token jika login berhasil
        print(response);
        return response.data['accessToken'];
      } else {
        // Jika login gagal, lemparkan exception dengan pesan dari response API
        throw Exception(response.data['message']);
      }
    } catch (error) {
      throw Exception('Login failed');
    }
  }

  Future<void> forgotPassword(String email) async {
  try {
    final response = await _dio.patch(
      'https://noerz.my.id/api/v1/reset', // Ganti dengan URL forgot password API Anda
      data: {'email': email},
    );

    // Periksa status response
    if (response.statusCode == 200) {
      // Kirim password baru ke email
      print('New password sent to email');
    } else {
      // Jika gagal, lemparkan exception dengan pesan dari response API
      throw Exception(response.data['message']);
    }
  } catch (error) {
    throw Exception('Forgot password failed');
  }
}

  // Tambahkan method lain untuk fitur lainnya
}
