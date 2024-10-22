import 'package:get/get.dart';
import '../services/auth_service.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  final password = ''.obs;
  final fcmToken = ''.obs;
  final organizationId = ''.obs;
  final isSigningIn = false.obs;
  AuthService authService = AuthService();

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
  var email = ''.obs;
  final roll = ''.obs;
  var mobileNo = ''.obs;
  final lastname = ''.obs;
  final password = ''.obs;
  final fcmToken = ''.obs;
  final firstname = ''.obs;
  final isSigningIn = false.obs;
  AuthService authService = AuthService();

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
