import 'package:get/get.dart';

import '../models/getall_property_peyment_model.dart';
import '../models/getpayment_model.dart';
import '../services/payment_service.dart';

class GetPaymentTenantController extends GetxController {
  var isLoading = true.obs;
  PaymentService paymentService = PaymentService();
  var paymentList = <GetAllPaymentModel>[].obs;

  @override
  void onInit() {
    fetchAllPayments();
    super.onInit();
  }

  void fetchAllPayments() async {
    try {
      isLoading(true);
      var properties = await paymentService.getAllPaymentTenant();
      if (properties.data != null) {
        paymentList.assign(properties);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetPaymentHostController extends GetxController {
  var isLoading = true.obs;
  PaymentService paymentService = PaymentService();
  var paymentList = <GetAllPaymentModel>[].obs;

  @override
  void onInit() {
    fetchAllPayments();
    super.onInit();
  }

  void fetchAllPayments() async {
    try {
      isLoading(true);
      var properties = await paymentService.getAllPaymentHost();
      if (properties.data != null) {
        paymentList.assign(properties);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetPropertyPaymentController extends GetxController {
  var isLoading = true.obs;
  PaymentService paymentService = PaymentService();
  var paymentList = <GetAllProeprtyPaymentModel>[].obs;
  RxString propertyId = "".obs;

  void fetchAllPayments() async {
    try {
      isLoading(true);
      var properties =
          await paymentService.getAllPropertyPayment(propertyId.value);
      if (properties.data != null) {
        paymentList.assign(properties);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetAllPaymentDataController extends GetxController {
  var isLoading = true.obs;
  PaymentService paymentService = PaymentService();
  RxString rentAmount = "".obs;
  RxString propertyId = "".obs;

  // fetchAllPayments() async {
  //   try {
  //     isLoading(true);
  //     var tenants = await paymentService.getPaymentlink(
  //         rentAmount.value, propertyId.value);
  //     // if (tenants.data != null) {
  //     //   tenantssList.assign(tenants);
  //     // }
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
