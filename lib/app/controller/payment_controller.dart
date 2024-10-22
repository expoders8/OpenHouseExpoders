import 'package:get/get.dart';

import '../models/getpayment_model.dart';
import '../services/payment_service.dart';
import '../models/getall_property_peyment_model.dart';

class GetPaymentTenantController extends GetxController {
  var isLoading = true.obs;
  var paymentList = <GetAllPaymentModel>[].obs;
  PaymentService paymentService = PaymentService();

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
  var paymentList = <GetAllPaymentModel>[].obs;
  PaymentService paymentService = PaymentService();

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
  RxString propertyId = "".obs;
  PaymentService paymentService = PaymentService();
  var paymentList = <GetAllProeprtyPaymentModel>[].obs;

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
  RxString rentAmount = "".obs;
  RxString propertyId = "".obs;
  PaymentService paymentService = PaymentService();

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
