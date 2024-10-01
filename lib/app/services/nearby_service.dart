import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';
import '../controller/nearby_controller.dart';
import '../models/get_nearby_model.dart';

class NearByService {
  add(
    String name,
    String type,
    String address,
    String propertyId,
  ) async {
    final GetAllNearByAmenitiesController getAllNearByAmenitiesController =
        Get.put(GetAllNearByAmenitiesController());
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response =
          await http.post(Uri.parse('$baseUrl/api/property/addnearby'),
              body: json.encode({
                "title": name,
                "description": type,
                "address": address,
                "is_active": true,
                "created_by_id": userid["id"],
                "property_id": propertyId
              }),
              headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          LoaderX.hide();
          getAllNearByAmenitiesController.getAllNearBys();
          Get.back();
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Add NearBy", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Add NearBy", decodedUser['error']);
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
          Uri.parse(
              '$baseUrl/api/property/getall_property_nearby?property_id=$id'),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          LoaderX.hide();
          var data = json.decode(response.body);
          return GetAllNearByModel.fromJson(data);
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to NearBy", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to NearBy", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
