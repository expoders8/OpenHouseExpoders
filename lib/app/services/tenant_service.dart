import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controller/tab_controller.dart';
import '../models/getall_tenant_model.dart';
import '../models/get_invitation_model.dart';
import '../../config/constant/constant.dart';
import '../models/previous_tenant_model.dart';
import '../controller/tenants_controller.dart';
import '../controller/invitation_controller.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class TenantService {
  static Future<List<GetAllTenantDataModel>> getallTenant(
    bool? mobileno,
    String? searchText,
  ) async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/tenant/getall'),
          body: json.encode({"searchText": searchText, "type": mobileno}),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (mobileno!) {
          LoaderX.hide();
          var data = json.decode(response.body);
          final List<dynamic> fetchCountry = data['data'];
          return fetchCountry
              .map((e) => GetAllTenantDataModel.fromJson(e))
              .where((value) {
            final phoneLower = value.email!.toLowerCase();
            final searchLower = searchText!.toLowerCase();
            return phoneLower.contains(searchLower);
          }).toList();
        } else {
          LoaderX.hide();
          var data = json.decode(response.body);
          final List<dynamic> fetchCountry = data['data'];
          return fetchCountry
              .map((e) => GetAllTenantDataModel.fromJson(e))
              .where((value) {
            final phoneLower = value.phoneNumber!.toLowerCase();
            final searchLower = searchText!.toLowerCase();
            return phoneLower.contains(searchLower);
          }).toList();
        }
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

  inviteTenant() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    final tabController = Get.put(TabCountController());
    final GetAllTenantController getAllTenantController =
        Get.put(GetAllTenantController());
    String formattedRentAmount =
        getAllTenantController.rentAmount.value.toString();

// Remove .0 only if it's a whole number
    if (formattedRentAmount.endsWith('.0')) {
      formattedRentAmount =
          formattedRentAmount.substring(0, formattedRentAmount.length - 2);
    }
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/tenant/invite'),
          body: json.encode({
            "email": getAllTenantController.email.value,
            "phone_number": getAllTenantController.phoneNo.value,
            "status": "",
            "host_user_id": userid["id"],
            "property_id": getAllTenantController.propertyId.value,
            "rent_amount": formattedRentAmount,
            "rent_amount_unit": null,
            "created_by_id": null,
            "updated_by_id": null,
            "is_active": true,
            "start_date": getAllTenantController.startDate.value,
            "end_date": getAllTenantController.endDate.value,
            "tenant_id": getAllTenantController.tenantId.value,
            "propertyAddress": getAllTenantController.propertyAddress.value,
            "propertyName": getAllTenantController.propertyName.value,
            "hostName": "${userid["first_name"]} ${userid["last_name"]}",
          }),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        Get.back();
        Get.back();
        Get.back();
        tabController.changeTabIndex(0);
      } else if (response.statusCode == 202) {
        LoaderX.hide();
        Get.back();
        SnackbarUtils.showSnackbar("allready invitation sent.", "");
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

  getAllInvitations() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.post(
          Uri.parse('$baseUrl/api/tenant/getinvitation'),
          body: json.encode({"userid": userid["id"], "status": "Pending"}),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          LoaderX.hide();
          var data = json.decode(response.body);
          return GetAllInvitationModel.fromJson(data);
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Invitations", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Invitations", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  deleteInvitations(String id) async {
    final GetAllInvitationController getAllInvitationController =
        Get.put(GetAllInvitationController());
    try {
      var response = await http.delete(
          Uri.parse('$baseUrl/api/tenant/delete-invitation?id=$id'),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          Get.back();
          getAllInvitationController.getAllInvitations();
          LoaderX.hide();
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Invitations", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Invitations", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getAllPreviousTenant(String? id) async {
    try {
      var response = await http.post(
          Uri.parse('$baseUrl/api/host/getall_previous_tenant'),
          body: json.encode({"propertyid": id}),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          LoaderX.hide();
          var data = json.decode(response.body);
          return GetAllPreviousTenantModel.fromJson(data);
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Previous tenant", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to Previous tenant", decodedUser['error']);
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
