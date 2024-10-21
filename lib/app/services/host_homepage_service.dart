import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/host_lending_model.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../models/tenant_lending_model.dart';

class HostHomePageService {
  getHostHomeData() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.get(
          Uri.parse('$baseUrl/api/host/host_lending?userid=${userid["id"]}'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return HostLendingModel.fromJson(data);
      }
    } catch (e) {
      LoaderX.hide();
      // SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  getTenantHomeData() async {
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);
    try {
      var response = await http.get(
          Uri.parse(
              '$baseUrl/api/tenant/tenant_lending?userid=${userid["id"]}'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return TenantLendingModel.fromJson(data);
      }
    } catch (e) {
      LoaderX.hide();
      // SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
