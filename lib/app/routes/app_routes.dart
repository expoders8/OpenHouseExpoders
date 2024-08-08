part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const tabPage = _Paths.tabPage;
  static const loginPage = _Paths.loginPage;
  static const signUpPage = _Paths.signUpPage;
}

abstract class _Paths {
  static const tabPage = '/tabPage';
  static const loginPage = '/loginPage';
  static const signUpPage = '/signUpPage';
}
