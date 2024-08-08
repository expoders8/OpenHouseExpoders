import 'package:get/get.dart';

import '../ui/TabPage/tab_page.dart';
import '../ui/Auth/Login/login.dart';
import '../ui/Auth/SignUp/signup.dart';
import '../ui/welcome/welcome.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.tabPage;

  static final routes = [
    GetPage(
      name: _Paths.loginPage,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: _Paths.signUpPage,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: _Paths.tabPage,
      page: () => const TabPage(),
    ),
    GetPage(
      name: _Paths.welcomePage,
      page: () => const WelcomePage(),
    ),
  ];
}
