import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/my_tenant_get_model.dart';
import '../services/my_tenants_service.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/snackbar_provider.dart';

class GetAllPreviousTenantsController extends GetxController {
  var isLoading = true.obs;
  var tenantsList = <GetAllMyTenantsModel>[].obs;
  RxString searchText = "".obs;
  MyTenantService myTenantService = MyTenantService();

  @override
  void onInit() {
    fetchAllTenants();
    super.onInit();
  }

  void fetchAllTenants() async {
    try {
      isLoading(true);
      var tenants = await myTenantService.previousTenants();
      if (tenants.data != null) {
        tenantsList.assign(tenants);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetAllCurrentTenantsController extends GetxController {
  var isLoading = true.obs;
  var tenantsList = <GetAllMyTenantsModel>[].obs;
  RxString searchText = "".obs;
  MyTenantService myTenantService = MyTenantService();

  @override
  void onInit() {
    fetchAllTenants();
    super.onInit();
  }

  void fetchAllTenants() async {
    try {
      isLoading(true);
      var tenants = await myTenantService.currentTenants();
      if (tenants.data != null) {
        tenantsList.assign(tenants);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetDetailTenantsController extends GetxController {
  var isLoading = true.obs;
  RxString tenantId = "".obs;
  GetAllMyTenantDetailModel? detailModel;
  String selectedRoll = "";

  void feachconferanceId(String newValue) {
    tenantId.value = newValue;
    fetchTenantDetail();
  }

  fetchTenantDetail() async {
    try {
      isLoading(true);
      var response = await http.post(
          Uri.parse("$baseUrl/api/host/get_tenant_details"),
          body: json.encode({"tenantId": tenantId.value}),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        detailModel =
            GetAllMyTenantDetailModel.fromJson(jsonDecode(response.body));
        return detailModel;
      } else {
        return Future.error("Server Error");
      }
    } catch (error) {
      SnackbarUtils.showErrorSnackbar(error.toString(),
          "Error while Tenantdetails, Please try after some time.");
      return Future.error(error);
    } finally {
      isLoading(false);
    }
  }
}
