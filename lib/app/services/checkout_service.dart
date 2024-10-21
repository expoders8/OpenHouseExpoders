import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controller/host_homepage_controller.dart';
import '../controller/my_tenants_controller.dart';
import '../models/get_all_checkout.dart';
import '../../config/constant/constant.dart';
import '../controller/property_controller.dart';
import '../controller/checkout_controller.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';
import '../models/get_checkout_tenant_model.dart';

class CheckoutService {
  getCheckoutInvitation() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.get(
          Uri.parse('$baseUrl/api/host/getall_chekout?userid=${userid["id"]}'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return GetAllCheckoutModel.fromJson(data);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  notAcceptCheckoutInvitation(
      String rentalId, propertyName, proeprtyAddress) async {
    final GetAllCheckoutController getAllCheckoutController =
        Get.put(GetAllCheckoutController());
    final GetAvailablePropertyController getAvailablePropertyController =
        Get.put(GetAvailablePropertyController());
    final GetLeasePropertyController getLeasePropertyController =
        Get.put(GetLeasePropertyController());
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http
          .post(Uri.parse('$baseUrl/api/tenant/checkout_request_delete'),
              body: json.encode({
                "rentalid": rentalId,
                "propertyName": propertyName,
                "proeprtyAddress": proeprtyAddress,
                "tenantEmail": userid["email"],
              }),
              headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          getAvailablePropertyController.fetchAllProperties();
        });
        getLeasePropertyController.fetchAllProperties();
        LoaderX.hide();
        Get.back();
        Get.back();
        getAllCheckoutController.getAllCheckoutInvitation();
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  acceptCheckoutInvitation(
    String rentalId,
    propertyName,
    proeprtyAddress,
    proeprtyId,
    tenantId,
    hostId,
    comment,
    double? rating,
  ) async {
    final GetAllCheckoutController getAllCheckoutController =
        Get.put(GetAllCheckoutController());
    final GetAvailablePropertyController getAvailablePropertyController =
        Get.put(GetAvailablePropertyController());
    final GetLeasePropertyController getLeasePropertyController =
        Get.put(GetLeasePropertyController());
    final GetAllCurrentTenantsController getAllCurrentTenantsController =
        Get.put(GetAllCurrentTenantsController());
    final GetAllPreviousTenantsController getAllPreviousTenantsController =
        Get.put(GetAllPreviousTenantsController());
    final GetAllHostHomeDataController getAllHostHomeDataController =
        Get.put(GetAllHostHomeDataController());
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/tenant/checkout'),
          body: json.encode({
            "rentalid": rentalId,
            "propertyName": propertyName,
            "proeprtyAddress": proeprtyAddress,
            "tenantEmail": userid["email"],
            "propertyId": proeprtyId,
            "tenantid": tenantId,
            "hostid": hostId,
            "rating": rating,
            "commant": comment,
          }),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          getAvailablePropertyController.fetchAllProperties();
        });
        getLeasePropertyController.fetchAllProperties();
        getAllHostHomeDataController.getAllHostHomePageData();
        LoaderX.hide();
        Get.back();
        getAllCheckoutController.getAllCheckoutInvitation();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          getAllCurrentTenantsController.fetchAllTenants();
        });
        getAllPreviousTenantsController.fetchAllTenants();
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllCheckoutRequests() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.get(
          Uri.parse(
              '$baseUrl/api/tenant/getall_checkout_request?userid=${userid["id"]}'),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          LoaderX.hide();
          var data = json.decode(response.body);
          return GetAllCheckoutRequestTenantModel.fromJson(data);
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Checkout Request", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Checkout Request", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
