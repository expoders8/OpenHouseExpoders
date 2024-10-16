import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  RxBool isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen((dynamic result) {
      _updateConnectionStatus(result as ConnectivityResult);
    });
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.toNamed(Routes.noInternetScreen);
      isConnected.value = false;
    } else {
      isConnected.value = true;
      Get.back();
    }
  }

  void checkInitialConnectivity() async {
    // final VideoOfTheDayController videoOfTheDayController =
    //     Get.put(VideoOfTheDayController());
    // final GetAllVideoLandingController videoController =
    //     Get.put(GetAllVideoLandingController());
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult[0] == ConnectivityResult.none) {
      Get.toNamed(Routes.noInternetScreen);
      isConnected.value = false;
    } else {
      isConnected.value = true;
      // videoOfTheDayController.fetchVideoOfTheDay();
      // videoController.fetchAllLandingVideos();
      Get.back();
    }
  }
}
