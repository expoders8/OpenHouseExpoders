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
