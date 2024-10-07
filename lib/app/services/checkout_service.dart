import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/get_all_checkout.dart';
import '../../config/constant/constant.dart';
import '../controller/property_controller.dart';
import '../controller/checkout_controller.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

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
      String rentalId, propertyName, proeprtyAddress, proeprtyId) async {
    final GetAllCheckoutController getAllCheckoutController =
        Get.put(GetAllCheckoutController());
    final GetAvailablePropertyController getAvailablePropertyController =
        Get.put(GetAvailablePropertyController());
    final GetLeasePropertyController getLeasePropertyController =
        Get.put(GetLeasePropertyController());
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/tenant/checkout'),
          body: json.encode({
            "rentalid": rentalId,
            "propertyName": propertyName,
            "proeprtyAddress": proeprtyAddress,
            "tenantEmail": userid["email"],
            "propertyId": proeprtyId
          }),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          getAvailablePropertyController.fetchAllProperties();
        });
        getAvailablePropertyController.fetchAllProperties();
        getLeasePropertyController.fetchAllProperties();
        LoaderX.hide();
        Get.back();
        getAllCheckoutController.getAllCheckoutInvitation();
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
