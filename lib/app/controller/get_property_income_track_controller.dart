import 'package:get/get.dart';

import '../models/income_track_model.dart';
import '../services/income_track_service.dart';

class GetAllIncomeTrackController extends GetxController {
  var isLoading = true.obs;
  IncomeTrackService incomeTrackService = IncomeTrackService();
  var propertyList = <GetAllTrackPropertyIncomeModel>[].obs;

  @override
  void onInit() {
    getAllProperties();
    super.onInit();
  }

  void getAllProperties() async {
    try {
      isLoading(true);
      var requests = await incomeTrackService.getAllPropertyincomes();
      if (requests.data != null) {
        propertyList.assign(requests);
      }
    } finally {
      isLoading(false);
    }
  }
}
