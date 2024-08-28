import 'package:get/get.dart';

import '../models/getpropretyes_model.dart';
import '../services/properties_service.dart';

class GetPropertyController extends GetxController {
  var isLoading = true.obs;
  var propertiesList = <List<GetAllPropertiesModel>>[].obs;
  PropertiesService propertiesService = PropertiesService();

  void fetchAllProperties() async {
    try {
      isLoading(true);
      // var data = await propertiesService.getAllProperties();
      // propertiesList.assign(data);
    } finally {
      isLoading(false);
    }
  }
}
