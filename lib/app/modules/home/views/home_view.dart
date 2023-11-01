import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_v2/app/modules/home/views/menu.dart';
import 'package:skripsi_v2/app/modules/login/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final LoginController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          children: [
            Container(
              width: 360,
              height: 128,
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
                bottom: 28,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.40,
                                  color: Color(0xFF9D9898),
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 3.57,
                          top: 3.57,
                          child: Container(
                            width: 52.86,
                            height: 52.86,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/53x53"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26.43),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 49,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "user",
                                          style: TextStyle(
                                            color: Color(0xFF323232),
                                            fontSize: 24,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'andrewjust@gmail.com',
                                          style: TextStyle(
                                            color: Color(0xFF9D9898),
                                            fontSize: 12,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(),
                            child: IconButton(
                              onPressed: () {
                                Get.snackbar('Belum Ada Notif',
                                    "Silahkan Cek Kembali Nanti");
                              },
                              icon: Icon(Icons.notifications),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    MenuCard(
                      title: 'Kegiatanku',
                      icon: Icons.event,
                      onTap: () {
                        // Aksi ketika menu "Kegiatanku" diklik
                        Get.toNamed('/kegiatan');
                      },
                    ),
                    MenuCard(
                      title: 'Artikelku',
                      icon: Icons.article,
                      onTap: () {
                        // Aksi ketika menu "Artikelku" diklik
                      },
                    ),
                    MenuCard(
                      title: 'Struktur',
                      icon: Icons.business,
                      onTap: () {
                        Get.toNamed('/struktur');
                        // Aksi ketika menu "Struktur" diklik
                      },
                    ),
                    MenuCard(
                      title: 'Profil',
                      icon: Icons.person,
                      onTap: () {
Get.toNamed('/profile');
                        // Aksi ketika menu "Profil" diklik
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(),
                    child: IconButton(
                      onPressed: () {
                        _authController.logout();
                      },
                      icon: Icon(Icons.logout),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}