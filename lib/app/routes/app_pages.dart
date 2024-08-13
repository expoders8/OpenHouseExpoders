import 'package:get/get.dart';

import '../ui/Auth/ChangePassword/change_password.dart';
import '../ui/Auth/ForgotPassword/forgot_password.dart';
import '../ui/Notification/notification.dart';
import '../ui/Profile/edit_profile.dart';
import '../ui/Property Details/property_details.dart';
import '../ui/TabPage/tab_page.dart';
import '../ui/Auth/Login/login.dart';
import '../ui/Auth/SignUp/signup.dart';
import '../ui/Total Amount/total_amount_detail.dart';
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
    GetPage(
      name: _Paths.forgotPasswordPage,
      page: () => const ForgotPasswordPage(),
    ),
    GetPage(
      name: _Paths.propertyDetailPage,
      page: () => const PropertyDetailPage(),
    ),
    GetPage(
      name: _Paths.editProfilePage,
      page: () => const EditProfilePage(),
    ),
    GetPage(
      name: _Paths.notificationPage,
      page: () => const NotificationPage(),
    ),
    GetPage(
      name: _Paths.changePasswordPage,
      page: () => const ChangePasswordPage(),
    ),
    GetPage(
      name: _Paths.totalAmountDetailPage,
      page: () => const TotalAmountDetailPage(),
    ),
  ];
}
