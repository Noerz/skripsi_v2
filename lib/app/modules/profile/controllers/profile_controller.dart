import 'package:get/get.dart';
import 'package:skripsi_v2/app/modules/profile/controllers/profile_service.dart';
import 'package:skripsi_v2/app/modules/profile/model/profile.dart';
import 'package:skripsi_v2/common/network/api_config.dart';

class ProfileController extends GetxController {
  var profiles = <Profile>[].obs;
  var isLoading = false.obs;
  
  final RxBool _isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfiles();
  }

  void fetchProfiles() async {
    try {
      isLoading.value = true;
      var response = await ProfileService.getProfiles();
      profiles.value = response;
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    ApiConfig.deleteToken(); // Menghapus token dari Get Storage
    _isLoggedIn.value = false;
    // Navigasi ke halaman login setelah logout
    Get.offAllNamed('/login'); // Ganti dengan halaman login yang sesuai
  }
}
