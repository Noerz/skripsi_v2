import 'package:get/get.dart';


import 'package:skripsi_v2/app/modules/home/bindings/home_binding.dart';
import 'package:skripsi_v2/app/modules/home/views/home_view.dart';
import 'package:skripsi_v2/app/modules/auth/bindings/login_binding.dart';
import 'package:skripsi_v2/app/modules/auth/views/login_view.dart';
import 'package:skripsi_v2/app/modules/auth/views/register_view.dart';
import 'package:skripsi_v2/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:skripsi_v2/app/modules/onboarding/views/onboarding_view.dart';
import 'package:skripsi_v2/app/modules/profile/bindings/profile_binding.dart';
import 'package:skripsi_v2/app/modules/profile/views/lihat_profile.dart';
import 'package:skripsi_v2/app/modules/profile/views/profile_view.dart';
import 'package:skripsi_v2/app/modules/struktur/bindings/admin_binding.dart';
import 'package:skripsi_v2/app/modules/struktur/views/admin_view.dart';
import 'package:skripsi_v2/features/user/presentation/screens/user_list_screen.dart';

 class AppRoutes {
   static const onboarding = '/onboarding';
  static const home = '/home';
  static const login = '/login';

  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomeView(),
      binding: ProfileBinding(),
      transition: Transition.downToUp,
    ),
   
    GetPage(
      name: '/register',
      page: () => RegisterView(),
      binding: LoginBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/login',
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.fade,
    ),
    
    GetPage(
      name: '/onboarding',
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: '/kegiatan',
      page: () => UserListScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name:'/profile',
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fade,
    ),
    //  GetPage(
    //   name: '/lihat_profile',
    //   page: () => LihatProfileView(),
    //   binding: ProfileBinding(),
    //   transition: Transition.fade,
    // ),
    GetPage(
      name: '/struktur',
      page: () => AdminView(),
      binding: AdminBinding(),
      transition: Transition.fade,
    ),
  ];
}


