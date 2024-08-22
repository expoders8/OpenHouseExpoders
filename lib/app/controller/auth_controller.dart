import 'package:get/get.dart';

import '../services/auth_service.dart';

class LoginController extends GetxController {
  AuthService authService = AuthService();
  final organizationId = ''.obs;
  var email = ''.obs;
  final password = ''.obs;
  final fcmToken = ''.obs;

  final isSigningIn = false.obs;

  Future<void> login() async {
    isSigningIn(true);
    try {
      await authService.login(email.value, password.value);
    } finally {
      isSigningIn(false);
    }
  }
}

class SignUpController extends GetxController {
  AuthService authService = AuthService();
  final firstname = ''.obs;
  final lastname = ''.obs;
  var email = ''.obs;
  var mobileNo = ''.obs;
  final password = ''.obs;
  final fcmToken = ''.obs;
  final roll = ''.obs;

  final isSigningIn = false.obs;

  Future<void> signUp() async {
    isSigningIn(true);
    try {
      await authService.signup(firstname.value, lastname.value, email.value,
          password.value, mobileNo.value, roll.value);
    } finally {
      isSigningIn(false);
    }
  }
}
