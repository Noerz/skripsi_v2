import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_v2/app/modules/home/views/menu.dart';
import 'package:skripsi_v2/app/modules/auth/controllers/auth_controller.dart';
import 'package:skripsi_v2/app/modules/profile/controllers/profile_controller.dart';
import 'package:skripsi_v2/features/post/presentation/screens/post_list_screen.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final AuthController _authController = Get.find();
  final ProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _profileController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _profileController.profiles.length,
                itemBuilder: (context, index) {
                  var profile = _profileController.profiles[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://ui-avatars.com/api/?name${profile.name}"),
                        ),
                        title: Text(
                          "Selamat Datang, ${profile.name}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(profile.email),
                        trailing: IconButton(
                          onPressed: () {
                            Get.snackbar('Belum Ada Notif',
                                "Silahkan Cek Kembali Nanti");
                          },
                          icon: Icon(Icons.notifications),
                        ),
                      ),
                      SizedBox(
                        height: 75,
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[
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
                      )
                    ],
                  );
                },
              ),
      ),
    );
  }
}
