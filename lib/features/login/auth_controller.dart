import 'package:get/get.dart';
import 'package:skripsi_v2/common/network/api_config.dart';

import 'api_service.dart';

class AuthController extends GetxController {
  final ApiService _apiService = ApiService();

  final RxBool _isLoggedIn = false.obs;
  bool get isLoggedIn => _isLoggedIn.value;

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    final token = ApiConfig.box.read('accessToken');
    _isLoggedIn.value = token != null;
  }

  Future<void> login(String email, String password) async {
    try {
      final token = await _apiService.login(email, password);
      await ApiConfig.saveToken(token); // Menyimpan token ke Get Storage
      _isLoggedIn.value = true;
      // Navigasi ke halaman lain setelah login sukses
      Get.offAllNamed('/home'); // Ganti dengan halaman yang sesuai
    } catch (error) {
      print(error);
      Get.snackbar('Error', 'Login failed');
    }
  }

  void logout() {
    ApiConfig.deleteToken(); // Menghapus token dari Get Storage
    _isLoggedIn.value = false;
    // Navigasi ke halaman login setelah logout
    Get.offAllNamed('/login'); // Ganti dengan halaman login yang sesuai
  }
}