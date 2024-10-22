import 'package:get/get.dart';

import '../services/house_keeper_service.dart';
import '../models/get_all_housekeeper_model.dart';

class GetAllHouseKeeperController extends GetxController {
  var isLoading = true.obs;
  RxString propertyId = "".obs;
  var requestList = <GetAllHousekeeperModel>[].obs;
  HouseKeeperService houseKeeperService = HouseKeeperService();

  void getAllHousekeepers() async {
    try {
      isLoading(true);
      var requests =
          await houseKeeperService.getAll(propertyId.value.toString());
      if (requests.data != null) {
        requestList.assign(requests);
      }
    } finally {
      isLoading(false);
    }
  }
}
