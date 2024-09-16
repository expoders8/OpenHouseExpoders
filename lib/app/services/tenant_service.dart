import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controller/tab_controller.dart';
import '../models/getall_tenant_model.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class TenantService {
  final tabController = Get.put(TabCountController());
  getallTenant(String searchText) async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/tenant/getall'),
          body: json.encode({"searchText": searchText}),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        var data = json.decode(response.body);
        return GetAllTenantModel.fromJson(data);
      } else if (response.statusCode == 401) {
        LoaderX.hide();
        return Future.error("Authentication Error");
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while fetch Tenants, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  RxString tenantId = "".obs;
  RxString email = "".obs;
  RxString phoneno = "".obs;
  RxString propertyid = "".obs;
  inviteTenant(
    String startdate,
    enddate,
    rentamount,
  ) async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/tenant/invite'),
          body: json.encode({
            "email": email,
            "phone_number": phoneno,
            "status": "",
            "host_user_id": "",
            "property_id": propertyid,
            "rent_amount": rentamount,
            "rent_amount_unit": "4",
            "created_by_id": null,
            "updated_by_id": null,
            "is_active": true,
            "start_date": startdate,
            "end_date": enddate,
            "tenant_id": tenantId
          }),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        var data = json.decode(response.body);
        tabController.changeTabIndex(2);
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
