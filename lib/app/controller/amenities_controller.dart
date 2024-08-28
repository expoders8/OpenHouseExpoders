import 'package:get/get.dart';

import '../models/get_amenities_model.dart';
import '../services/lookup_service.dart';

class GetAllAmenitiesController extends GetxController {
  var isLoading = true.obs;
  var amenitisList = <List<GetAllAmenitiesDataModel>>[].obs;
  LookupService lookupService = LookupService();
  RxString categoryId = "".obs;
  RxList selectedAmenitis = [].obs;
  RxList selectedImages = [].obs;

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
