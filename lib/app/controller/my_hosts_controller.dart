import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/my_host_get_model.dart';
import '../services/my_hosts_service.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/snackbar_provider.dart';

class GetAllPreviousHostsController extends GetxController {
  var isLoading = true.obs;
  RxString searchText = "".obs;
  var hostsList = <GetAllMyHostsModel>[].obs;
  MyHostService myHostService = MyHostService();

  @override
  void onInit() {
    fetchAllTenants();
    super.onInit();
  }

  void fetchAllTenants() async {
    try {
      isLoading(true);
      var tenants = await myHostService.previousHosts();
      if (tenants.data != null) {
        hostsList.assign(tenants);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetAllCurrentHostsController extends GetxController {
  var isLoading = true.obs;
  var hostsList = <GetAllMyHostsModel>[].obs;
  RxString searchText = "".obs;
  MyHostService myHostService = MyHostService();

  @override
  void onInit() {
    fetchAllTenants();
    super.onInit();
  }

  void fetchAllTenants() async {
    try {
      isLoading(true);
      var tenants = await myHostService.currentHosts();
      if (tenants.data != null) {
        hostsList.assign(tenants);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetDetailHostsController extends GetxController {
  var isLoading = true.obs;
  RxString hostId = "".obs;
  GetAllMyHostDetailModel? detailModel;
  String selectedRoll = "";

  void feachconferanceId(String newValue) {
    hostId.value = newValue;
    fetchHostDetail();
  }

  fetchHostDetail() async {
    try {
      isLoading(true);
      var response = await http.post(
          Uri.parse("$baseUrl/api/tenant/get_host_details"),
          body: json.encode({"hostId": hostId.value}),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        detailModel =
            GetAllMyHostDetailModel.fromJson(jsonDecode(response.body));
        return detailModel;
      } else {
        return Future.error("Server Error");
      }
    } catch (error) {
      SnackbarUtils.showErrorSnackbar(error.toString(),
          "Error while Hostdetails, Please try after some time.");
      return Future.error(error);
    } finally {
      isLoading(false);
    }
  }
}
