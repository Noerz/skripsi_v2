import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(); // Membuat instance Dio

  Future<String> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'http://192.168.1.7:3000/api/v1/login-user', // Ganti dengan URL login API Anda
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

  // Tambahkan method lain untuk fitur lainnya
}