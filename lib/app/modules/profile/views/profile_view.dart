import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_v2/app/modules/profile/controllers/profile_controller.dart';
import 'package:skripsi_v2/app/modules/profile/views/lihat_profile.dart';
import 'package:skripsi_v2/app/modules/profile/views/profile_card.dart';
import 'package:skripsi_v2/utils/app_color.dart';

class ProfileView extends StatelessWidget {
  final ProfileController _profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles'),
      ),
      body: Obx(
        () => _profileController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _profileController.profiles.length,
                itemBuilder: (context, index) {
                  var profile = _profileController.profiles[index];
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          margin: EdgeInsets.all(16.0),
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
                                          "https://ui-avatars.com/api/?name${profile.name}",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${profile.name}",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          "${profile.email}",
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
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(350, 30),
                                  backgroundColor: AppColors.Button,
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  // Aksi ketika tombol 'Lihat Profil' ditekan
                                  Get.to(LihatProfileView());
                                },
                                child: Text('Lihat Profil'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        ProfileCard(
                            title: "Ubah Data Diri",
                            icon: Icons.edit,
                            iconL: Icons.arrow_forward_ios,
                            onTap: () {}),
                        ProfileCard(
                            title: "Ubah Password",
                            icon: Icons.vpn_key,
                            iconL: Icons.arrow_forward_ios,
                            onTap: () {}),
                        ProfileCard(
                            title: "Pusat Bantuan",
                            icon: Icons.help_outline,
                            iconL: Icons.arrow_forward_ios,
                            onTap: () {}),
                        ProfileCard(
                            title: "Keluar",
                            icon: Icons.logout_rounded,
                            iconL: Icons.arrow_forward_ios,
                            onTap: () {
                              _profileController.logout();
                            }),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
