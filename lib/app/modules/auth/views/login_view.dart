import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skripsi_v2/app/modules/auth/views/register_view.dart';
import 'package:skripsi_v2/app/modules/auth/views/reset_password.dart';
import 'package:skripsi_v2/common/widget/custom_button.dart';
import 'package:skripsi_v2/common/widget/custom_formfield.dart';
import 'package:skripsi_v2/common/widget/custom_header.dart';
import 'package:skripsi_v2/common/widget/custom_richtext.dart';
import 'package:skripsi_v2/utils/app_color.dart';
import 'package:skripsi_v2/utils/text_styles.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  final AuthController _authController = Get.find();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.blue,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Log In",
              style: KTextStyle.headerTextStyle,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: AppColors.whiteshade,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.09),
                    child: Image.asset("asset/images/Logo HIMTIF.png"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomFormField(
                    headingText: "Email",
                    hintText: "Email",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _emailController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(() => CustomFormField(
                        headingText: "Password",
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.text,
                        hintText: "At least 8 Character",
                        obsecureText: !_authController.isPasswordVisible.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _authController.isPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: _authController.togglePasswordVisibility,
                        ),
                        controller: _passwordController,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordPage()));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: AppColors.blue.withOpacity(0.7),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AuthButton(
                    onTap: () {
                      _authController.login(email, password);
                    },
                    text: 'Sign In',
                  ),
                  CustomRichText(
                    discription: "Don't already have an account? ",
                    text: "Sign Up",
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterView()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
