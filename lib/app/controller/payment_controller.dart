// import 'package:get/get.dart';

// import '../models/getpayment_model.dart';
// import '../services/payment_service.dart';

// class GetPaymentController extends GetxController {
//   var isLoading = true.obs;
//   PaymentService paymentService = PaymentService();
//   var paymentList = <GetAllPaymentModel>[].obs;

//   @override
//   void onInit() {
//     fetchAllPayments();
//     super.onInit();
//   }

//   void fetchAllPayments() async {
//     try {
//       isLoading(true);
//       var properties = await paymentService.getAllPayment();
//       if (properties.data != null) {
//         paymentList.assign(properties);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }

import 'package:get/get.dart';

import '../services/payment_service.dart';

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
