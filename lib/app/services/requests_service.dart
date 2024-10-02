import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/constant/constant.dart';
import '../models/get_all_request_model.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';
import '../models/tenant_request_model.dart';

class RequestsService {
  addRequest(
      String amenityId, description, type, date, propertyId, hostId) async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
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
              }),
              headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
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
