import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  void sendEmail() async {
    if (emailC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await auth.sendPasswordResetEmail(email: emailC.text);
        Get.snackbar("Berhasik", "Email perubahan password telah di kirim,Silahkan Periksa Email");
      } catch (e) {
        Get.snackbar(
            "Terjadi Kesalahan", "Tidak Dapat mengirim email reset password");
      } finally {
        isLoading.value = false;
      }
    }
  }
}
