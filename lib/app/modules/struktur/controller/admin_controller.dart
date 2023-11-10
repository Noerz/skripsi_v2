import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:skripsi_v2/common/network/api_config.dart';

class AdminController extends GetxController {
  final Dio _dio = Dio();

  final adminList = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchAdmins();
  }

  Future<void> fetchAdmins({String? id}) async {
    try {
      isLoading.value = true;

      final response = await _dio.get('https://noerz.my.id/api/v1/admin',
          queryParameters: {'id': id},
          options: Options(headers: ApiConfig.header));

      final data = response.data as List<dynamic>;
      adminList.assignAll(data.cast<Map<String, dynamic>>());
    } catch (error) {
      // Handle error
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
