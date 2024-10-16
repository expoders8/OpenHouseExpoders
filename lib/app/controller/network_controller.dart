// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';

// import '../../config/constant/constant.dart';
// import '../routes/app_pages.dart';
// import '../ui/Auth/Login/login.dart';
// import '../ui/TabPage/tab_page.dart';

// class NetworkController extends GetxController {
//   final Connectivity _connectivity = Connectivity();
//   RxBool isConnected = true.obs;
//   int? appflow = 0;
//   RxBool isNavigatedToNoInternet = false.obs;

//   @override
//   void onInit() {
//     appflow = getStorage.read("appFlow") ?? 0;
//     super.onInit();
//     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//     checkInitialConnectivity();
//   }

//   void _updateConnectionStatus(ConnectivityResult connectivityResult) {
//     if (connectivityResult == ConnectivityResult.none) {
//       if (!isNavigatedToNoInternet.value) {
//         Get.toNamed(Routes.noInternetScreen);
//         isConnected.value = false;
//         isNavigatedToNoInternet.value = true;
//       }
//     } else {
//       if (isNavigatedToNoInternet.value) {
//         Future.delayed(const Duration(seconds: 2), () {
//           if (appflow == 1) {
//             Get.offAll(() => const TabPage());
//           } else {
//             Get.offAll(() => const LoginPage());
//           }
//         });
//         isConnected.value = true;
//         isNavigatedToNoInternet.value = false;
//       }
//     }
//   }

//   void checkInitialConnectivity() async {
//     final connectivityResult = await _connectivity.checkConnectivity();
//     _updateConnectionStatus(connectivityResult);
//   }
// }
