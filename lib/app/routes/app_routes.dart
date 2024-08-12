part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const tabPage = _Paths.tabPage;
  static const loginPage = _Paths.loginPage;
  static const signUpPage = _Paths.signUpPage;
  static const welcomePage = _Paths.welcomePage;
  static const forgotPasswordPage = _Paths.forgotPasswordPage;
  static const propertyDetailPage = _Paths.propertyDetailPage;
}

abstract class _Paths {
  static const tabPage = '/tabPage';
  static const loginPage = '/loginPage';
  static const signUpPage = '/signUpPage';
  static const welcomePage = '/welcomePage';
  static const forgotPasswordPage = '/forgotPasswordPage';
  static const propertyDetailPage = '/propertyDetailPage';
}
