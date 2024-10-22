import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/constant/constant.dart';
import '../models/getbyid_property_model.dart';
import '../../config/provider/snackbar_provider.dart';

class GetDetailsPropertiesController extends GetxController {
  var isLoading = true.obs;
  String selectedRoll = "";
  RxString propertyId = "".obs;
  PropertyDetailModel? detailModel;

  void feachconferanceId(String newValue) {
    propertyId.value = newValue;
    fetchPropertyDetail();
  }

  fetchPropertyDetail() async {
    try {
      isLoading(true);
      var response = await http.get(
          Uri.parse(
              "$baseUrl/api/property/getbyid?id=${propertyId.toString()}"),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        detailModel = PropertyDetailModel.fromJson(jsonDecode(response.body));
        return detailModel;
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
  RxString propertyId = "".obs;
  PropertyDetailModel? detailModel;

  void feachconferanceId(String newValue) {
    propertyId.value = newValue;
    fetchPropertyDetail();
  }

  fetchPropertyDetail() async {
    try {
      isLoading(true);
      var response = await http.get(
          Uri.parse(
              "$baseUrl/api/property/getbyid?id=${propertyId.toString()}"),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        detailModel = PropertyDetailModel.fromJson(jsonDecode(response.body));
        return detailModel;
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

class GetCurrentDetailsPropertiesController extends GetxController {
  var isLoading = true.obs;
  RxString propertyId = "".obs;
  PropertyDetailModel? detailModel;

  void feachconferanceId(String newValue) {
    propertyId.value = newValue;
    fetchPropertyDetail();
  }

  fetchPropertyDetail() async {
    try {
      isLoading(true);
      var response = await http.get(
          Uri.parse(
              "$baseUrl/api/property/getbyid?id=${propertyId.toString()}"),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        detailModel = PropertyDetailModel.fromJson(jsonDecode(response.body));
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

class GetPreviousDetailsPropertiesController extends GetxController {
  var isLoading = true.obs;
  RxString propertyId = "".obs;
  PropertyDetailModel? detailModel;

  void feachconferanceId(String newValue) {
    propertyId.value = newValue;
    fetchPropertyDetail();
  }

  fetchPropertyDetail() async {
    try {
      isLoading(true);
      var response = await http.get(
          Uri.parse(
              "$baseUrl/api/property/getbyid?id=${propertyId.toString()}"),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        detailModel = PropertyDetailModel.fromJson(jsonDecode(response.body));
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
