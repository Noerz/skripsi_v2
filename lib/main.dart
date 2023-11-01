import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skripsi_v2/app/routes/app_routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:skripsi_v2/di.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  await GetStorage.init();
  await FlutterDownloader.initialize(
    debug:
        true, // optional: set to false to disable printing logs to console (default: true)
    ignoreSsl:
        true, // option: set to false to disable working with http links (default: false)
  );
  
  final isFirstTime = await GetStorage().read('isFirstTime') ?? true;
  
  runApp(
    StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        print(snapshot.data);
        
        if (isFirstTime) {
          GetStorage().write('isFirstTime', false);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: AppRoutes.onboarding,
            getPages: AppRoutes.routes,
          );
        } else {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: AppRoutes.login, // Ganti dengan halaman login yang sesuai
            getPages: AppRoutes.routes,
          );
        }
      },
    ),
  );
}