import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controller/tab_controller.dart';
import '../models/getpropretyes_model.dart';
import '../../config/constant/constant.dart';
import '../controller/amenities_controller.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';
import '../ui/Property Details/lease_property_details.dart';

class PropertiesService {
  final tabController = Get.put(TabCountController());
  final GetAllAmenitiesController getAllAmenitiesController =
      Get.put(GetAllAmenitiesController());
  createProperties(
      String propertyname,
      String description,
      String propertyprice,
      String facilities,
      String person,
      String address,
      String countryid,
      String stateid,
      String cityname,
      String profilepicture,
      String amenityid,
      File? file) async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      http.Response response;
      var request =
          http.MultipartRequest("POST", Uri.parse('$baseUrl/api/property/add'))
            ..fields['property_name'] = propertyname
            ..fields['description'] = description
            ..fields['property_price'] = propertyprice
            ..fields['facilities'] = facilities
            ..fields['person'] = person
            ..fields['address'] = address
            ..fields['country_id'] = countryid
            ..fields['state_id'] = stateid
            ..fields['city_name'] = cityname
            ..fields['profile_picture'] = ""
            ..fields['created_by_id'] = userid["id"]
            ..fields['updated_by_id'] = ""
            ..fields['amenity_id'] =
                getAllAmenitiesController.selectedAmenitis.string;
      if (file != null) {
        request.files.add(await http.MultipartFile.fromPath('file', file.path));
      }
      request.headers.addAll({
        'Content-Type': 'application/json',
      });
      response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200 || response.statusCode == 201) {
        var decodedUser = jsonDecode(response.body);
        if (decodedUser['success']) {
          LoaderX.hide();
          tabController.changeTabIndex(1);
          return decodedUser;
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Create Properties", decodedUser['message']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllProperties(PropertiesRequestModel getRequest) async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/property/getall'),
          body: json.encode({
            "pagesize": getRequest.pageSize,
            "pagenumber": getRequest.pageNumber,
            "searchtext": getRequest.searchText,
            "sortby": getRequest.sortBy,
            "propertyid": getRequest.propertyid,
            "userid": getRequest.userId,
            "type": getRequest.type,
            "onlease": getRequest.onlease,
            "country_id": getRequest.countryId,
            "state_id": getRequest.stateId,
            "city_name": getRequest.cityName
          }),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        var data = json.decode(response.body);
        return GetAllPropertiesModel.fromJson(data);
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while fetch Properties, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getByIdProperties(String id) async {
    try {
      var response = await http.get(
          Uri.parse('$baseUrl/api/property/getbyid?id=$id'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var decodedUser = jsonDecode(response.body);
        if (decodedUser['success']) {
          Get.to(() => const LeasePropertyDetailPage());
          getStorage.write('authToken', decodedUser["data"]['authToken']);
          return decodedUser['success'];
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Login", decodedUser['message']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getMyLeaseProperties(PropertiesRequestModel getRequest) async {
    try {
      var response =
          await http.post(Uri.parse('$baseUrl/api/property/getpropretyes'),
              body: json.encode({
                "pagesize": getRequest.pageSize,
                "pagenumber": getRequest.pageNumber,
                "searchtext": getRequest.searchText,
                "sortby": getRequest.sortBy,
                "propertyid": getRequest.propertyid,
                "userid": getRequest.userId,
                "type": getRequest.type,
                "onlease": getRequest.onlease,
                "country_id": getRequest.countryId,
                "state_id": getRequest.stateId,
                "city_name": getRequest.cityName,
                "mylease": ""
              }),
              headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        // LoaderX.hide();
        // var data = json.decode(response.body);
        // return GetAllPropertiesModel.fromJson(data);
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while fetch Properties, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
