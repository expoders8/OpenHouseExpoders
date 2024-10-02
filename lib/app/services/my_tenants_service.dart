import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/my_tenant_get_model.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class MyTenantService {
  previousTenants() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.post(
          Uri.parse('$baseUrl/api/host/getalltenant'),
          body: json.encode({"status": "previous", "userid": userid["id"]}),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        var data = json.decode(response.body);
        return GetAllMyTenantsModel.fromJson(data);
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

  currentTenants() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.post(
          Uri.parse('$baseUrl/api/host/getalltenant'),
          body: json.encode({"status": "current", "userid": userid["id"]}),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoaderX.hide();
        var data = json.decode(response.body);
        return GetAllMyTenantsModel.fromJson(data);
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
}
