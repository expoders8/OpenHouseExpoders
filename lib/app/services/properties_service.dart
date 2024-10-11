import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:openhome/app/models/get_expense_model.dart';

import '../controller/tab_controller.dart';
import '../models/extensions_model.dart';
import '../models/getall_property_expenses_model.dart';
import '../models/getpropretyes_model.dart';
import '../../config/constant/constant.dart';
import '../controller/property_controller.dart';
import '../controller/amenities_controller.dart';
import '../controller/invitation_controller.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';
import '../ui/Property Details/Host/lease_property_details.dart';

class PropertiesService {
  final tabController = Get.put(TabCountController());
  final GetAllAmenitiesController getAllAmenitiesController =
      Get.put(GetAllAmenitiesController());

  createProperties(
      String propertyname,
      String description,
      String propertyprice,
      String facilities,
      String address,
      String countryid,
      String stateid,
      String cityname,
      String profilepicture,
      String amenityid,
      String capacity,
      String bedrooms,
      String bathrooms,
      String billtype,
      String id,
      List<File> fileList) async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    final GetAvailablePropertyController getAvailablePropertyController =
        Get.put(GetAvailablePropertyController());
    try {
      http.Response response;
      var request = http.MultipartRequest(
          "POST", Uri.parse('$baseUrl/api/property/addedit'))
        ..fields['property_name'] = propertyname
        ..fields['description'] = description
        ..fields['property_price'] = propertyprice
        ..fields['facilities'] = facilities
        ..fields['person'] = capacity
        ..fields['address'] = address
        ..fields['country_id'] = countryid
        ..fields['city_name'] = cityname
        ..fields['profile_picture'] = ""
        ..fields['created_by_id'] = userid["id"]
        ..fields['updated_by_id'] = ""
        ..fields['amenity_id'] =
            getAllAmenitiesController.selectedAmenitis.value
        ..fields['id'] = id;
      for (File file in fileList) {
        if (file != null) {
          request.files
              .add(await http.MultipartFile.fromPath('file', file.path));
        }
      }
      request.headers.addAll({
        'Content-Type': 'application/json',
      });
      response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200 || response.statusCode == 201) {
        var decodedUser = jsonDecode(response.body);
        if (decodedUser['success']) {
          LoaderX.hide();
          getAvailablePropertyController.fetchAllProperties();
          tabController.changeTabIndex(1);
          return true;
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

  editProperties(
      String propertyname,
      String description,
      String propertyprice,
      String facilities,
      String address,
      String countryid,
      String stateid,
      String cityname,
      String profilepicture,
      String amenityid,
      String capacity,
      String bedrooms,
      String bathrooms,
      String billtype,
      String id,
      String isActive,
      List<File> fileList) async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    final GetAvailablePropertyController getAvailablePropertyController =
        Get.put(GetAvailablePropertyController());
    final GetLeasePropertyController getLeasePropertyController =
        Get.put(GetLeasePropertyController());
    try {
      http.Response response;
      var request = http.MultipartRequest(
          "POST", Uri.parse('$baseUrl/api/property/addedit'))
        ..fields['property_name'] = propertyname
        ..fields['description'] = description
        ..fields['property_price'] = propertyprice
        ..fields['facilities'] = facilities
        ..fields['person'] = capacity
        ..fields['address'] = address
        ..fields['country_id'] = countryid
        ..fields['city_name'] = cityname
        ..fields['profile_picture'] = ""
        ..fields['created_by_id'] = userid["id"]
        ..fields['updated_by_id'] = ""
        ..fields['is_active'] = isActive
        ..fields['amenity_id'] =
            getAllAmenitiesController.selectedAmenitis1.toString()
        ..fields['id'] = id;
      for (File file in fileList) {
        if (file != null) {
          request.files
              .add(await http.MultipartFile.fromPath('file', file.path));
        }
      }
      request.headers.addAll({
        'Content-Type': 'application/json',
      });
      response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200 || response.statusCode == 201) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          getAvailablePropertyController.fetchAllProperties();
        });
        getLeasePropertyController.fetchAllProperties();
        var decodedUser = jsonDecode(response.body);
        if (decodedUser['success']) {
          // getLeasePropertyController.fetchAllProperties();
          LoaderX.hide();
          Get.back();
          Get.back();
          // tabController.changeTabIndex(1);
          // return true;
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
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/property/getall'),
          body: json.encode({
            "pagesize": getRequest.pageSize,
            "pagenumber": getRequest.pageNumber,
            "searchtext": getRequest.searchText,
            "sortby": getRequest.sortBy,
            "propertyid": getRequest.propertyid,
            "userid": userid["id"],
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

  bookProperties(String propertyId, invitationId) async {
    final GetAllInvitationController getAllInvitationController =
        Get.put(GetAllInvitationController());
    final GetCurrentPropertyController getCurrentPropertyController =
        Get.put(GetCurrentPropertyController());
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/property/book'),
          body: json.encode({"userid": userid["id"], "propertyid": propertyId}),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        var data = json.decode(response.body);
        getAllInvitationController.getAllInvitations();
        getCurrentPropertyController.fetchAllProperties();
        Get.back();
        tabController.changeTabIndex(1);
        return GetAllPropertiesModel.fromJson(data);
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while Book Properties, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllCurrentProperties() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.post(
          Uri.parse('$baseUrl/api/tenant/getall_currentproperty'),
          body: json.encode({
            "userid": userid["id"],
            "status": "Booked",
            "request": "current"
          }),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        var data = json.decode(response.body);
        return GetAllCurrentPropertyModel.fromJson(data);
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        // LoaderX.hide();
        // SnackbarUtils.showErrorSnackbar("Server Error",
        //     "Error while fetch Properties, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      // SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllPreviousProperties() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.post(
          Uri.parse('$baseUrl/api/tenant/getall_currentproperty'),
          body: json.encode({
            "userid": userid["id"],
            "status": "Completed",
            "request": "previous"
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
        // LoaderX.hide();
        // SnackbarUtils.showErrorSnackbar("Server Error",
        //     "Error while fetch Properties, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  addExpense(String amenitiId, price, propertyId) async {
    final GetAllExpenseController getAllExpenseController =
        Get.put(GetAllExpenseController());
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response =
          await http.post(Uri.parse('$baseUrl/api/property/addexpenses'),
              body: json.encode({
                "amenity_id": amenitiId,
                "price": int.parse(price),
                "property_id": propertyId,
                "created_by_id": null,
                "updated_by_id": null,
                "is_active": true,
                "userid": userid["id"]
              }),
              headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          LoaderX.hide();
          getAllExpenseController.getAllExpenses();
          Get.back();
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Add expenses", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Add expenses", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllExpense(String propertyId) async {
    try {
      var response = await http.get(
          Uri.parse(
              '$baseUrl/api/property/getallexpenses?propertyid=$propertyId'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        var data = json.decode(response.body);
        return GetAllExpenseModel.fromJson(data);
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while Get Expenses, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllPropertyExpenses() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.get(
          Uri.parse(
              '$baseUrl/api/host/getall_property_expenses?userid=${userid["id"]}'),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          LoaderX.hide();
          var data = json.decode(response.body);
          return GetallPropertyExpensesModel.fromJson(data);
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Expenses Get", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Expenses Get", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  deleteExpense(String id) async {
    final GetAllExpenseController getAllExpenseController =
        Get.put(GetAllExpenseController());
    try {
      var response = await http.delete(
          Uri.parse('$baseUrl/api/property/deleteexpenses?id=$id'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        getAllExpenseController.getAllExpenses();
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while Delete Expenses, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  sendCheckoutProperties(
    String propertyId,
    rentalid,
    List<Map<String, dynamic>> checkoutData,
  ) async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);

    final PropertyCheckoutController propertyCheckoutController =
        Get.put(PropertyCheckoutController());
    try {
      var response =
          await http.post(Uri.parse('$baseUrl/api/tenant/checkout_request'),
              body: json.encode({
                "rentalid": propertyCheckoutController.rentalId.value,
                "proeprtyAddress":
                    propertyCheckoutController.proeprtyAddress.value,
                "propertyName": propertyCheckoutController.propertyName.value,
                "email": userid["email"],
                "rentAmount": propertyCheckoutController.rentAmount.value,
                "checkoutJson": checkoutData,
              }),
              headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        SnackbarUtils.showSnackbar("Service request", decodedUser["message"]);
        Get.back();
        Get.back();
        tabController.changeTabIndex(0);
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while Checkout request send, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllPropertyExtensions() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.post(
          Uri.parse(
              '$baseUrl/api/host/getall_extensions?userid=${userid['id']}'),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        return GetAllExtensionModel.fromJson(decodedUser);
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while Property Extensions, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
