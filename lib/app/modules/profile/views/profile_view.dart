import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:skripsi_v2/app/modules/profile/views/profile_card.dart';
import 'package:skripsi_v2/utils/app_color.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.streamUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              Map<String, dynamic> user = snapshot.data!.data()!;
              return ListView(
                padding: EdgeInsets.only(top: 60,left: 20,right: 20),
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://ui-avatars.com/api/?name${user["name"]}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${user["name"]}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    "${user["Admin"]}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(350, 30),
                            backgroundColor: AppColors.Button,
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            // Aksi ketika tombol 'Lihat Profil' ditekan
                            Get.toNamed('lihat_profile');
                          },
                          child: Text('Lihat Profil'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  
                  ProfileCard(
                    title: 'Perbaharui Profile',
                    icon: Icons.edit,
                    iconL: Icons.arrow_forward_ios_rounded,
                    onTap: () {},
                  ),
                  ProfileCard(
                    title: 'Ubah Password',
                    icon: Icons.vpn_key,
                    iconL: Icons.arrow_forward_ios_rounded,
                    onTap: () => Get.toNamed('forget_password'),
                  ),
                  ProfileCard(
                      title: 'Pusat Bantuan',
                      icon: Icons.help_outline,
                      iconL: Icons.arrow_forward_ios_rounded,
                      onTap: () {}),
                  ProfileCard(
                      title: 'Keluar',
                      icon: Icons.logout_rounded,
                      iconL: Icons.arrow_forward_ios_rounded,
                      onTap: () => controller.Logout()),
                ],
              );
            } else {
              return Center(
                child: Text("Data tidak ditemukan"),
              );
            }
          }),
    );
  }
}

Widget _buildProfileImage() {
  return Container(
    width: 80.0,
    height: 80.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage('assets/profile_image.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _buildProfileInfo() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'John Doe',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8.0),
      Text(
        'Gold Member',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[600],
        ),
      ),
    ],
  );
}

Widget _buildViewProfileButton() {
  return ElevatedButton(
    onPressed: () {
      // Aksi ketika tombol 'Lihat Profil' ditekan
      Get.snackbar('Profil', 'Lihat Profil');
    },
    child: Text('Lihat Profil'),
  );
}
