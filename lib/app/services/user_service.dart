import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class UserService {
  var user = getStorage.read('userid');
  updateProfile(
      String firstName, String lastName, String email, File? file) async {
    try {
      http.Response response;
      var request =
          http.MultipartRequest("POST", Uri.parse('$baseUrl/api/edit-profile'))
            ..fields['first_name'] = firstName
            ..fields['last_name'] = lastName
            ..fields['email'] = email
            ..fields['profile_picture'] = null.toString()
            ..fields['user_id'] = user;
      if (file != null) {
        request.files.add(await http.MultipartFile.fromPath('file', file.path));
      }
      request.headers.addAll({
        'Content-Type': 'application/json',
      });

      response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200 || response.statusCode == 201) {
        var decodedUser = jsonDecode(response.body);
        if (decodedUser['success']) {
          LoaderX.hide();
          if (decodedUser != null) {
            getStorage.write('user', jsonEncode(decodedUser["data"]));
          }
          Get.back();
          return decodedUser;
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to login", decodedUser['message']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
