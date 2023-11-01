import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_pegawai_controller.dart';

class AddPegawaiView extends GetView<AddPegawaiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        width: 360,
        height: 800,
        padding: const EdgeInsets.only(
          top: 70,
          left: 20,
          right: 20,
          
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.24,
                ),
              ),
              const SizedBox(height: 35),
              Text(
                'Full Name',
                style: TextStyle(
                  color: Color(0xFF323232),
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.nameC,
                decoration: InputDecoration(
                  labelText: "Type something here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text(
                'NIK',
                style: TextStyle(
                  color: Color(0xFF323232),
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.nikC,
                decoration: InputDecoration(
                  labelText: "Type something here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Job Status',
                style: TextStyle(
                  color: Color(0xFF323232),
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.jobC,
                decoration: InputDecoration(
                  labelText: "Type something here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Email',
                style: TextStyle(
                  color: Color(0xFF323232),
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.emailC,
                decoration: InputDecoration(
                  labelText: "Type something here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Password',
                style: TextStyle(
                  color: Color(0xFF323232),
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.passwordC,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Type something here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 30),
                    backgroundColor: Color(0xFF9BDF46),
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    if (controller.isLoading.isFalse) {
                      await controller.addPegawai();
                    }
                  },
                  child: Text(
                      controller.isLoading.isFalse ? "Daftar" : "LOADING..."),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () => Get.toNamed('/forget_password'),
                      child: Text(
                        "Lupa Password ?",
                        style: TextStyle(
                          color: Color(0xFF104EEF),
                          fontSize: 14,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                   
                    Text(
                      'Apakah Kamu Punya Akun?',
                      style: TextStyle(
                        color: Color(0xFF323232),
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed('/login'),
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          color: Color(0xFF104EEF),
                          fontSize: 14,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),);
  }
}
