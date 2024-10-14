import 'package:get/get.dart';

import '../ui/Add Housekeeper/add_housekeeper.dart';
import '../ui/Add NearBy/add_nearby.dart';
import '../ui/Checkout Requests/checkout_request_get.dart';
import '../ui/Checkout Requests/checkout_request_tenant.dart';
import '../ui/Checkout Requests/send_checkout_request.dart';
import '../ui/Invite Tenant/get_invitation_tenant.dart';
import '../ui/My Host/my_hosts_detail.dart';
import '../ui/My Tenants/my_tenants_detail.dart';
import '../ui/Payment/pay_rent.dart';
import '../ui/Profile/profile.dart';
import '../ui/Property Details/Tenant/tenant_lease_property.dart';
import '../ui/Splash/splash_screen.dart';
import '../ui/TabPage/tab_page.dart';
import '../ui/Auth/Login/login.dart';
import '../ui/Auth/SignUp/signup.dart';
import '../ui/My Tenants/my_tenant.dart';
import '../ui/Profile/edit_profile.dart';
import '../ui/Add Expense/add_expense.dart';
import '../ui/Home/create_my_requests.dart';
import '../ui/Select Roll/select_roll.dart';
import '../ui/Notification/notification.dart';
import '../ui/Invite Tenant/invite_tenant.dart';
import '../ui/Tenant Requests/tenant_request.dart';
import '../ui/Total Amount/total_amount_detail.dart';
import '../ui/Invite Tenant/invite_tenant_detail.dart';
import '../ui/Auth/ChangePassword/change_password.dart';
import '../ui/Auth/ForgotPassword/forgot_password.dart';
import '../ui/Property Details/Host/lease_property_details.dart';
import '../ui/Property Details/Host/not_lease_property_details.dart';
import '../ui/Track lease expenses/track_lease_expenses.dart';
import '../ui/Track lease extensions/track_lease_extension.dart';
import '../ui/Track property income/track_property_income.dart';
import '../ui/message/message_page.dart';
import '../ui/widgets/inapp_webview_widget.dart';
import '../view/my_request_view_all.dart';
import '../view/tenant_request_all_view.dart';

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
      name: _Paths.selectRollPage,
      page: () => const SelectRollPage(),
    ),
    GetPage(
      name: _Paths.forgotPasswordPage,
      page: () => const ForgotPasswordPage(),
    ),
    GetPage(
      name: _Paths.leasePropertyDetailPage,
      page: () => const LeasePropertyDetailPage(),
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
    GetPage(
      name: _Paths.notLeasePropertyDetailPage,
      page: () => const NotLeasePropertyDetailPage(),
    ),
    GetPage(
      name: _Paths.inviteTenantPage,
      page: () => const InviteTenantPage(),
    ),
    GetPage(
      name: _Paths.inviteTenantDetailPage,
      page: () => const InviteTenantDetailPage(),
    ),
    GetPage(
      name: _Paths.tenantRequestPage,
      page: () => const TenantRequestPage(),
    ),
    GetPage(
      name: _Paths.createMyRequestsPage,
      page: () => const CreateMyRequestsPage(),
    ),
    GetPage(
      name: _Paths.myTenantsPage,
      page: () => const MyTenantsPage(),
    ),
    GetPage(
      name: _Paths.profilePage,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: _Paths.addExpensePage,
      page: () => const AddExpensePage(),
    ),
    GetPage(
      name: _Paths.tenantLeasePropertyDetailPage,
      page: () => const TenantLeasePropertyDetailPage(),
    ),
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.tenantRequestAllView,
      page: () => const TenantRequestAllView(),
    ),
    GetPage(
      name: _Paths.myRequestViewAllView,
      page: () => const MyRequestViewAllView(),
    ),
    GetPage(
      name: _Paths.myTenantsDetailsPage,
      page: () => const MyTenantsDetailsPage(),
    ),
    GetPage(
      name: _Paths.myHostsDetailsPage,
      page: () => const MyHostsDetailsPage(),
    ),
    GetPage(
      name: _Paths.checkoutRequestsPage,
      page: () => const CheckoutRequestsPage(),
    ),
    GetPage(
      name: _Paths.addNearByPage,
      page: () => const AddNearByPage(),
    ),
    GetPage(
      name: _Paths.addHousekeeperPage,
      page: () => const AddHousekeeperPage(),
    ),
    GetPage(
      name: _Paths.sendCheckoutRequest,
      page: () => const SendCheckoutRequest(),
    ),
    GetPage(
      name: _Paths.invitationshowPage,
      page: () => const InvitationshowPage(),
    ),
    GetPage(
      name: _Paths.trackLeaseExtensionPage,
      page: () => const TrackLeaseExtensionPage(),
    ),
    GetPage(
      name: _Paths.trackLeaseExpensesPage,
      page: () => const TrackLeaseExpensesPage(),
    ),
    GetPage(
      name: _Paths.trackPropertyIncomePage,
      page: () => const TrackPropertyIncomePage(),
    ),
    GetPage(
      name: _Paths.messagePage,
      page: () => const MessagePage(),
    ),
    GetPage(
      name: _Paths.payRentPage,
      page: () => const PayRentPage(),
    ),
    GetPage(
      name: _Paths.inAppWebViewWidget,
      page: () => const InAppWebViewWidget(),
    ),
    GetPage(
      name: _Paths.checkoutRequestsTenantPage,
      page: () => const CheckoutRequestsTenantPage(),
    ),
    // GetPage(
    //   name: _Paths.leaseExtendPropertyPage,
    //   page: () => const LeaseExtendPropertyPage(),
    // ),
  ];
}
