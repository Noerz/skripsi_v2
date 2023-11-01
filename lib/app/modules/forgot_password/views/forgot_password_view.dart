import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9BDF46),
        title: Text('Ubah Passowrd'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.emailC,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 30),
                  backgroundColor: Color(0xFF9BDF46),
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    controller.sendEmail();
                  }
                },
                child: Text(controller.isLoading.isFalse
                    ? "SEND RESET PASSWORD"
                    : "LOADING..."),
              )),
        ],
      ),
    );
  }
}
