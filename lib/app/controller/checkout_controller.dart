import 'package:get/get.dart';

import '../models/get_all_checkout.dart';
import '../models/get_checkout_tenant_model.dart';
import '../services/checkout_service.dart';

class GetAllCheckoutController extends GetxController {
  var isLoading = true.obs;
  CheckoutService checkoutService = CheckoutService();
  var checkoutList = <GetAllCheckoutModel>[].obs;

  @override
  void onInit() {
    getAllCheckoutInvitation();
    super.onInit();
  }

  void getAllCheckoutInvitation() async {
    try {
      isLoading(true);
      var checkoutData = await checkoutService.getCheckoutInvitation();
      if (checkoutData != null) {
        checkoutList.assign(checkoutData);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetAllCheckoutTenantController extends GetxController {
  var isLoading = true.obs;
  CheckoutService checkoutService = CheckoutService();
  var checkoutList = <GetAllCheckoutRequestTenantModel>[].obs;

  @override
  void onInit() {
    getAllCheckoutInvitation();
    super.onInit();
  }

  void getAllCheckoutInvitation() async {
    try {
      isLoading(true);
      var checkoutData = await checkoutService.getAllCheckoutRequests();
      if (checkoutData != null) {
        checkoutList.assign(checkoutData);
      }
    } finally {
      isLoading(false);
    }
  }
}
