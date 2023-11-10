import 'package:skripsi_v2/app/modules/home/views/menu.dart';
import 'package:skripsi_v2/app/modules/profile/controllers/profile_controller.dart';
import 'package:skripsi_v2/features/post/presentation/screens/post_list_screen.dart';
import 'package:skripsi_v2/features/user/presentation/controller/user_controller.dart';
import 'package:skripsi_v2/common/widget/spinkit_indicator.dart';
import 'package:skripsi_v2/features/user/data/models/user.dart';

import 'package:skripsi_v2/common/dialog/retry_dialog.dart';
import 'package:skripsi_v2/common/widget/empty_widget.dart';

import 'package:skripsi_v2/di.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum UserOperation { edit, delete, post, todo }

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final UserController _controller = getIt<UserController>();
  final ProfileController _profileController = Get.find();

  void navigateTo(Widget screen) {
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  void initState() {
    _controller.getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(150), child:Obx(
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
                        ],
                      );
                    },
                  ),
          ),),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _controller.obx(
              (state) => ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (_, index) {
                  User user = state![index];
                  return GridView.count(
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
                          Get.to(PostListScreen(user: user));
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
                  );
                },
              ),
              onLoading: const SpinKitIndicator(type: SpinKitType.circle),
              onError: (error) => RetryDialog(
                title: "$error",
                onRetryPressed: () => _controller.getUserList(),
              ),
              onEmpty: const EmptyWidget(message: "No user!"),
            ),
          ],
        ),
      ),
    );
  }
}
