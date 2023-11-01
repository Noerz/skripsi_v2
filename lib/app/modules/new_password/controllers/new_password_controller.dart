import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NewPasswordController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController newPassC = TextEditingController();
  void newPassword() async {
    if (newPassC.text.isNotEmpty) {
      if (newPassC.text != "password") {
        try {
          await auth.currentUser!.updatePassword(newPassC.text);
          await auth.signOut();
          Get.offAllNamed('/login');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            Get.snackbar("Terjadi Kesalahan",
                "Password terlalu lemah, setidaknya 6 karakter");
          }
        } catch (e) {
          Get.snackbar("Terjadi Kesalahan",
              "Tidak dapat membuat password baru, Silahkan hubungi admin");
        }
      } else {
        Get.snackbar("Terjadi Kesalahan", "Silahkan Isi Password Yang Berbeda");
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Silahkan Isi Password Baru Anda");
    }
  }
}
