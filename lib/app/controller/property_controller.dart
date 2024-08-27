import 'package:get/get.dart';

import '../services/properties_service.dart';

class GetPropertyController extends GetxController {
  PropertiesService propertiesService = PropertiesService();

  Future<void> getAllProperties() async {
    try {
      await propertiesService.getAllProperties(
          0, 100, "", "", "", "", "", true, "", "", "");
    } finally {}
  }
}
