import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../config/constant/constant.dart';
import '../controller/amenities_controller.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';
import 'package:openhome/app/models/getpropretyes_model.dart';

class PropertiesService {
  late TabController _tabController;
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
    try {
      http.Response response;
      var request =
          http.MultipartRequest("POST", Uri.parse('$baseUrl/api/propertyadd'))
            ..fields['property_name'] = propertyname
            ..fields['description'] = description
            ..fields['property_price'] = propertyprice
            ..fields['facilities'] = facilities
            ..fields['person'] = person
            ..fields['addresh'] = address
            ..fields['country_id'] = countryid
            ..fields['state_id'] = stateid
            ..fields['city_name'] = cityname
            ..fields['profile_picture'] = ""
            ..fields['created_by_id'] = ""
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
          _tabController.animateTo(1);
          return decodedUser;
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to login", decodedUser['message']);
          return Future.error("Server Error");
        }
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllProperties(
    int pagesize,
    int pagenumber,
    String searchtext,
    String sortby,
    String propertyid,
    String userid,
    String type,
    bool onlease,
    String countryid,
    String stateid,
    String cityname,
  ) async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/getpropretyes'),
          body: json.encode({
            "pagesize": pagesize,
            "pagenumber": pagenumber,
            "searchtext": searchtext,
            "sortby": sortby,
            "propertyid": propertyid,
            "userid": userid,
            "type": type,
            "onlease": onlease,
            "country_id": countryid,
            "state_id": stateid,
            "city_name": cityname
          }),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = json.decode(response.body);
        LoaderX.hide();
        final List<dynamic> fetchCategory = data['data'];
        return fetchCategory
            .map((json) => GetAllPropertiesDataModel.fromJson(json))
            .toList();
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getByIdProperties(
    String firstName,
    String lastName,
    String email,
    String profilePicture,
    String googleToken,
    String provider,
  ) async {
    try {
      var response = await http.post(
          Uri.parse(
              '$baseUrl/api/Auth/propretyesgetbyid?id=1b580369-5380-4439-83e2-0d4f05570a4d'),
          body: json.encode({
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "profilePicture": profilePicture,
            "googleToken": googleToken,
            "provider": provider,
            "currency": "",
            "fcmToken": "",
          }),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var decodedUser = jsonDecode(response.body);
        if (decodedUser['success']) {
          getStorage.write('user', jsonEncode(decodedUser["data"]));
          getStorage.write('authToken', decodedUser["data"]['authToken']);
          return decodedUser['success'];
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Login", decodedUser['message']);
          return Future.error("Server Error");
        }
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
