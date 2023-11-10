import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_v2/app/modules/profile/controllers/profile_controller.dart';
import 'package:skripsi_v2/app/modules/profile/views/profile_card.dart';
import 'package:skripsi_v2/utils/app_color.dart';

class LihatProfileView extends StatelessWidget {
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
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
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
                              ),
                              SizedBox(width: 32.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 32,),
                                    Text(
                                      "Nama : ${profile.name}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      "Email : ${profile.email}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      "Gender : ${profile.gender}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      "Status : ${profile.status}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
