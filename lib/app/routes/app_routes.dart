part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const tabPage = _Paths.tabPage;
  static const loginPage = _Paths.loginPage;
  static const signUpPage = _Paths.signUpPage;
  static const welcomePage = _Paths.welcomePage;
  static const forgotPasswordPage = _Paths.forgotPasswordPage;
  static const propertyDetailPage = _Paths.propertyDetailPage;
  static const editProfilePage = _Paths.editProfilePage;
  static const notificationPage = _Paths.notificationPage;
  static const changePasswordPage = _Paths.changePasswordPage;
  static const totalAmountDetailPage = _Paths.totalAmountDetailPage;
}

abstract class _Paths {
  static const tabPage = '/tabPage';
  static const loginPage = '/loginPage';
  static const signUpPage = '/signUpPage';
  static const welcomePage = '/welcomePage';
  static const forgotPasswordPage = '/forgotPasswordPage';
  static const propertyDetailPage = '/propertyDetailPage';
  static const editProfilePage = '/editProfilePage';
  static const notificationPage = '/notificationPage';
  static const changePasswordPage = '/changePasswordPage';
  static const totalAmountDetailPage = '/totalAmountDetailPage';
}
