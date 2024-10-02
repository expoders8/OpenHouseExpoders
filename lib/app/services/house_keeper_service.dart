import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/constant/constant.dart';
import '../models/get_all_housekeeper_model.dart';
import '../controller/housekeeeper_controller.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class HouseKeeperService {
  add(
    String firstName,
    String lastName,
    String email,
    String phoneNo,
    String propertyId,
  ) async {
    final GetAllHouseKeeperController getAllHouseKeeperController =
        Get.put(GetAllHouseKeeperController());
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response =
          await http.post(Uri.parse('$baseUrl/api/host/housekeeper_add'),
              body: json.encode({
                "id": propertyId,
                "first_name": firstName,
                "last_name": lastName,
                "email": email,
                "phone_number": phoneNo,
                "created_by": userid["id"]
              }),
              headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (decodedUser['success']) {
          LoaderX.hide();
          getAllHouseKeeperController.getAllHousekeepers();
          Get.back();
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Housekeeper Add", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Housekeeper Add", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAll(String? id) async {
    try {
      var response = await http.get(
          Uri.parse('$baseUrl/api/host/housekeeper_getall?propertyid=$id'),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          LoaderX.hide();
          var data = json.decode(response.body);
          return GetAllHousekeeperModel.fromJson(data);
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Housekeeper", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Housekeeper", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  assignDelete(
    String assignId,
  ) async {
    try {
      var response = await http.post(
          Uri.parse('$baseUrl/api/host/housekeeper_assign_delete'),
          body: json.encode({"housekeeper_assignment_id": assignId}),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (decodedUser['success']) {
          LoaderX.hide();
          Get.back();
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Housekeeper Delete", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Housekeeper Delete", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  assignAdd(
    String assignId,
    String propertyId,
  ) async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response =
          await http.post(Uri.parse('$baseUrl/api/host/housekeeper_assign_add'),
              body: json.encode({
                "property_id": propertyId,
                "housekeeper_id": assignId,
                "created_by": userid["id"]
              }),
              headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (decodedUser['success']) {
          LoaderX.hide();
          Get.back();
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Housekeeper Add", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Housekeeper Add", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
