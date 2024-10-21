import 'package:get/get.dart';

import '../models/host_lending_model.dart';
import '../models/tenant_lending_model.dart';
import '../services/host_homepage_service.dart';

class GetAllHostHomeDataController extends GetxController {
  var isLoading = true.obs;
  HostHomePageService hostHomePageService = HostHomePageService();
  var dataList = <HostLendingModel>[].obs;

  // @override
  // void onInit() {
  //   getAllHostHomePageData();
  //   super.onInit();
  // }

  void getAllHostHomePageData() async {
    try {
      isLoading(true);
      var checkoutData = await hostHomePageService.getHostHomeData();
      if (checkoutData != null) {
        dataList.assign(checkoutData);
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetAllTenantHomeDataController extends GetxController {
  var isLoading = true.obs;
  HostHomePageService hostHomePageService = HostHomePageService();
  var dataList = <TenantLendingModel>[].obs;

  // @override
  // void onInit() {
  //   getAllTenantHomePageData();
  //   super.onInit();
  // }

  void getAllTenantHomePageData() async {
    try {
      isLoading(true);
      var checkoutData = await hostHomePageService.getTenantHomeData();
      if (checkoutData != null) {
        dataList.assign(checkoutData);
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
