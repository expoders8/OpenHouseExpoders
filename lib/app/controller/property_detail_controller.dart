import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/constant/constant.dart';
import '../models/getbyid_property_model.dart';
import '../../config/provider/snackbar_provider.dart';
import '../ui/Property Details/lease_property_details.dart';
import '../ui/Property Details/not_lease_property_details.dart';

class GetDetailsPropertiesController extends GetxController {
  var isLoading = true.obs;
  RxString conferanceId = "".obs;
  PropertyDetailModel? detailModel;

  void feachconferanceId(String newValue) {
    conferanceId.value = newValue;
    fetchPropertyDetail();
  }

  // @override
  // void onInit() {
  //   fetchPropertyDetail();
  //   super.onInit();
  // }

  fetchPropertyDetail() async {
    try {
      isLoading(true);
      var response = await http.get(
          Uri.parse(
              "$baseUrl/api/property/getbyid?id=${conferanceId.toString()}"),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        detailModel = PropertyDetailModel.fromJson(jsonDecode(response.body));
        Get.to(() => const LeasePropertyDetailPage());
      } else {
        return Future.error("Server Error");
      }
    } catch (error) {
      SnackbarUtils.showErrorSnackbar(error.toString(),
          "Error while Properties, Please try after some time.");
      return Future.error(error);
    } finally {
      isLoading(false);
    }
  }
}

class GetnotleaseDetailsPropertiesController extends GetxController {
  var isLoading = true.obs;
  RxString conferanceId = "".obs;
  PropertyDetailModel? detailModel;

  void feachconferanceId(String newValue) {
    conferanceId.value = newValue;
    fetchPropertyDetail();
  }

  // @override
  // void onInit() {
  //   fetchPropertyDetail();
  //   super.onInit();
  // }

  fetchPropertyDetail() async {
    try {
      isLoading(true);
      var response = await http.get(
          Uri.parse(
              "$baseUrl/api/property/getbyid?id=${conferanceId.toString()}"),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var decodedUser = jsonDecode(response.body);
        getStorage.write('NotLeaseProperty', jsonEncode(decodedUser["data"]));

        detailModel = PropertyDetailModel.fromJson(jsonDecode(response.body));
        Get.to(() => const NotLeasePropertyDetailPage());
      } else {
        return Future.error("Server Error");
      }
    } catch (error) {
      SnackbarUtils.showErrorSnackbar(error.toString(),
          "Error while Properties, Please try after some time.");
      return Future.error(error);
    } finally {
      isLoading(false);
    }
  }
}
