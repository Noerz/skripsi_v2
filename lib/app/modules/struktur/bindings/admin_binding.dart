import 'package:get/get.dart';
import 'package:skripsi_v2/app/modules/struktur/controller/admin_controller.dart';


class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminController>(
      () => AdminController(),
    );
  }
}
