part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const tabPage = _Paths.tabPage;
  static const loginPage = _Paths.loginPage;
  static const signUpPage = _Paths.signUpPage;
  static const selectRollPage = _Paths.selectRollPage;
  static const forgotPasswordPage = _Paths.forgotPasswordPage;
  static const leasePropertyDetailPage = _Paths.leasePropertyDetailPage;
  static const editProfilePage = _Paths.editProfilePage;
  static const notificationPage = _Paths.notificationPage;
  static const changePasswordPage = _Paths.changePasswordPage;
  static const totalAmountDetailPage = _Paths.totalAmountDetailPage;
  static const notLeasePropertyDetailPage = _Paths.notLeasePropertyDetailPage;
  static const inviteTenantPage = _Paths.inviteTenantPage;
  static const inviteTenantDetailPage = _Paths.inviteTenantDetailPage;
  static const tenantRequestPage = _Paths.tenantRequestPage;
}

abstract class _Paths {
  static const tabPage = '/tabPage';
  static const loginPage = '/loginPage';
  static const signUpPage = '/signUpPage';
  static const selectRollPage = '/selectRollPage';
  static const forgotPasswordPage = '/forgotPasswordPage';
  static const leasePropertyDetailPage = '/leasePropertyDetailPage';
  static const editProfilePage = '/editProfilePage';
  static const notificationPage = '/notificationPage';
  static const changePasswordPage = '/changePasswordPage';
  static const totalAmountDetailPage = '/totalAmountDetailPage';
  static const notLeasePropertyDetailPage = '/notLeasePropertyDetailPage';
  static const inviteTenantPage = '/inviteTenantPage';
  static const inviteTenantDetailPage = '/inviteTenantDetailPage';
  static const tenantRequestPage = '/tenantRequestPage';
}
