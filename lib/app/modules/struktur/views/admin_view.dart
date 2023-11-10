import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_v2/app/modules/struktur/controller/admin_controller.dart';



class AdminView extends StatelessWidget {
  final AdminController adminController = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pengurus'),
      ),
      body: Obx(
        () => adminController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: adminController.adminList.length,
                itemBuilder: (context, index) {
                  final admin = adminController.adminList[index];
                  final gender = admin['gender'];
                  final avatar = gender == 'male'
                      ? 'asset/images/male.png'
                      : 'asset/images/female.png';

                  return ListTile(
                    leading: CircleAvatar(
                     
                      child: Image.asset(
                        avatar,
                        width: 75,
                        height: 75,
                        
                      ),
                    ),
                    title: Text(admin['name']),
                    subtitle: Text(admin['email']),
                    trailing: Text(admin['division']),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Fetch admin data
          adminController.fetchAdmins();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}