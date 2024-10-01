import 'package:get/get.dart';

import '../models/get_nearby_model.dart';
import '../services/nearby_service.dart';

class GetAllNearByAmenitiesController extends GetxController {
  var isLoading = true.obs;
  NearByService nearByService = NearByService();
  RxString propertyId = "".obs;
  var requestList = <GetAllNearByModel>[].obs;

  void getAllNearBys() async {
    try {
      isLoading(true);
      var requests = await nearByService.getAll(propertyId.value.toString());
      if (requests.data != null) {
        requestList.assign(requests);
      }
    } finally {
      isLoading(false);
    }
  }
}
