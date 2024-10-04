import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controller/checkout_controller.dart';
import '../models/get_all_checkout.dart';
import '../../config/constant/constant.dart';
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

  notAcceptCheckoutInvitation(String rentalId) async {
    final GetAllCheckoutController getAllCheckoutController =
        Get.put(GetAllCheckoutController());
    try {
      var response = await http.get(
          Uri.parse(
              '$baseUrl/api/tenant/checkout_request_delete?rentalid=$rentalId'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
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

  acceptCheckoutInvitation(String rentalId) async {
    final GetAllCheckoutController getAllCheckoutController =
        Get.put(GetAllCheckoutController());
    try {
      var response = await http.get(
          Uri.parse(
              '$baseUrl/api/tenant/checkout_request_delete?rentalid=$rentalId'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
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
