import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 340,
                  height: 188,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("asset/images/Logo HIMTIF.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 168),
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 320,
                              child: Text(
                                'Hima Informatika Universitas Pamulang',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF323232),
                                  fontSize: 24,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.24,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 320,
                              child: Text(
                                'Selamat datang di aplikasi manajemen kegiatan Himpunan Mahasiswa Teknik Informatika',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF9D9898),
                                  fontSize: 16,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 80),
                      Container(
                        width: 200,
                        height: 45,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF9BDF46),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed('/login');
                          },
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
