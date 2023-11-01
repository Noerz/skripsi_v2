import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPegawaiController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController nikC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addPegawai() async {
    if (nameC.text.isNotEmpty &&
        nikC.text.isNotEmpty &&
        emailC.text.isNotEmpty) {
      isLoading.value=false;
      try {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
                email: emailC.text, password: passwordC.text);
        print(userCredential);

        if (userCredential.user != null) {
          String uid = userCredential.user!.uid;
          await firestore.collection("pegawai").doc(uid).set({
            "nip": nikC.text,
            "name": nameC.text,
            "Job": jobC.text,
            "email": emailC.text,
            "uid": uid,
            "createdAt": DateTime.now().toIso8601String(),
          });
          await userCredential.user!.sendEmailVerification();
          await auth.signOut();
        }
      } on FirebaseAuthException catch (e) {
        print(e);
        if (e.code == 'weak-password') {
          Get.snackbar("Terjadi Kesalahan", "Password terlalu singkat");
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar("Terjadi Kesalahan", "Pegawai telah ada");
        }
      } catch (e) {
        Get.snackbar("Terjadi Kesalahan", "Tidak dapat menambah Pegawai");
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Silahkan Iisi data yang tersedia");
    }
  }
}
