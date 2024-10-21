import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/constant/constant.dart';
import '../controller/host_homepage_controller.dart';
import '../controller/request_controller.dart';
import '../models/get_all_request_model.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';
import '../models/tenant_request_model.dart';

class RequestsService {
  addRequest(String amenityId, description, type, date, propertyId, hostId,
      propertyName, proeprtyAddress, rentAmount, amenityName) async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    final GetAllTenantHomeDataController getAllTenantHomeDataController =
        Get.put(GetAllTenantHomeDataController());
    try {
      var response =
          await http.post(Uri.parse('$baseUrl/api/property/addrequest'),
              body: json.encode({
                "user_id": userid["id"],
                "amenity_id": amenityId,
                "description": description,
                "type": type,
                "start_date": date,
                "created_by_id": null,
                "updated_by_id": null,
                "is_active": true,
                "property_id": propertyId,
                "host_userid": hostId,
                "propertyName": propertyName,
                "proeprtyAddress": proeprtyAddress,
                "rentAmount": rentAmount,
                "amenityName": amenityName
              }),
              headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          getAllTenantHomeDataController.getAllTenantHomePageData();
          return true;
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to AddRequest", decodedUser['error']);
          return false;
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to AddRequest", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  resolveRequest(
    String requestId,
  ) async {
    final GetAllHostRequestsController getAllHostRequestsController =
        Get.put(GetAllHostRequestsController());
    try {
      var response =
          await http.post(Uri.parse('$baseUrl/api/host/request_resolve'),
              body: json.encode({
                "requestid": requestId,
              }),
              headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          getAllHostRequestsController.getAllRequests();
          return true;
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Resolve request", decodedUser['error']);
          return false;
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Resolve request", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllRequests() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.get(
          Uri.parse(
              '$baseUrl/api/property/getallrequest?userid=${userid["id"]}'),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          LoaderX.hide();
          var data = json.decode(response.body);
          return GetAllRequestsModel.fromJson(data);
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Request", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Request", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllHostRequests() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.get(
          Uri.parse('$baseUrl/api/host/getall_request?userid=${userid["id"]}'),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          LoaderX.hide();
          var data = json.decode(response.body);
          return GetAllHostRequestsModel.fromJson(data);
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Request", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Request", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
