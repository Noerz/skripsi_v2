import 'package:get/get.dart';

import 'package:skripsi_v2/app/modules/add_pegawai/bindings/add_pegawai_binding.dart';
import 'package:skripsi_v2/app/modules/add_pegawai/views/add_pegawai_view.dart';
import 'package:skripsi_v2/app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:skripsi_v2/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:skripsi_v2/app/modules/home/bindings/home_binding.dart';
import 'package:skripsi_v2/app/modules/home/views/home_view.dart';
import 'package:skripsi_v2/app/modules/login/bindings/login_binding.dart';
import 'package:skripsi_v2/app/modules/login/views/login_view.dart';
import 'package:skripsi_v2/app/modules/login/views/register_view.dart';
import 'package:skripsi_v2/app/modules/new_password/bindings/new_password_binding.dart';
import 'package:skripsi_v2/app/modules/new_password/views/new_password_view.dart';
import 'package:skripsi_v2/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:skripsi_v2/app/modules/onboarding/views/onboarding_view.dart';
import 'package:skripsi_v2/app/modules/profile/bindings/profile_binding.dart';
import 'package:skripsi_v2/app/modules/profile/views/lihat_profile.dart';
import 'package:skripsi_v2/app/modules/profile/views/profile_view.dart';
import 'package:skripsi_v2/features/user/presentation/screens/user_list_screen.dart';

 class AppRoutes {
   static const onboarding = '/onboarding';
  static const home = '/home';
  static const login = '/login';

  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: '/add_user',
      page: () => AddPegawaiView(),
      binding: AddPegawaiBinding(),
      transition: Transition.fade,
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
      name: '/new_password',
      page: () => NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: '/forget_password',
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
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
     GetPage(
      name: '/lihat_profile',
      page: () => LihatProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/struktur',
      page: () => UserListScreen(),
      transition: Transition.fade,
    ),
  ];
}


