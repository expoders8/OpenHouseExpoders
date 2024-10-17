import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/getall_property_peyment_model.dart';
import '../models/getpayment_model.dart';
import '../../config/constant/constant.dart';
import '../controller/payment_controller.dart';
import '../ui/widgets/inapp_webview_widget.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class PaymentService {
  getAllPaymentHost() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/payment/getall'),
          body: json.encode({"userid": userid["id"], "type": "host"}),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        var data = json.decode(response.body);
        return GetAllPaymentModel.fromJson(data);
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while fetch Payment, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllPaymentTenant() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/payment/getall'),
          body: json.encode({"userid": userid["id"], "type": "tenant"}),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        var data = json.decode(response.body);
        return GetAllPaymentModel.fromJson(data);
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while fetch Payment, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllPropertyPayment(String propertyId) async {
    try {
      var response = await http.get(
          Uri.parse(
              '$baseUrl/api/property/getall_property_payment?propertyid=$propertyId'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        var data = json.decode(response.body);
        return GetAllProeprtyPaymentModel.fromJson(data);
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while fetch Payment, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getPaymentlink() async {
    try {
      final GetAllPaymentDataController getAllPaymentDataController =
          Get.put(GetAllPaymentDataController());
      var userdata = getStorage.read('user');
      var userid = jsonDecode(userdata);
      var response =
          await http.post(Uri.parse('$baseUrl/api/payment/payment_link'),
              body: json.encode({
                "amount":
                    int.parse(getAllPaymentDataController.rentAmount.value) *
                        100,
                "rental_id": getAllPaymentDataController.propertyId.value,
                "email": userid["email"]
              }),
              headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        var data = json.decode(response.body);
        Get.to(() => InAppWebViewWidget(
              url: data["data"],
            ));
        return data["data"];
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Server Error", "Error while Payment, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
