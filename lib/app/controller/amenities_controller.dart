import 'package:get/get.dart';

import '../services/lookup_service.dart';
import '../models/get_amenities_model.dart';

class GetAllAmenitiesController extends GetxController {
  var isLoading = true.obs;
  var amenitisList = <List<GetAllAmenitiesDataModel>>[].obs;
  LookupService lookupService = LookupService();
  RxString categoryId = "".obs;
  // var selectedAmenitis = <String>[].obs;
  RxList selectedImages = [].obs;
  RxList selectedAmenitis1 = [].obs;
  // RxList selectedAmenitis = [].obs;
  var selectedAmenitis = ''.obs;

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
