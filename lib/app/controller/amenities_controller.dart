import 'package:get/get.dart';

import '../services/lookup_service.dart';
import '../models/get_amenities_model.dart';

class GetAllAmenitiesController extends GetxController {
  var isLoading = true.obs;
  RxString categoryId = "".obs;
  var selectedAmenitis = ''.obs;
  RxList selectedImages = [].obs;
  RxList selectedAmenitis1 = [].obs;
  LookupService lookupService = LookupService();
  var amenitisList = <List<GetAllAmenitiesDataModel>>[].obs;

  void fetchAllAmenites() async {
    try {
      isLoading(true);
      var data = await lookupService.getamenities();
      amenitisList.assign(data);
    } finally {
      isLoading(false);
    }
  }
}
