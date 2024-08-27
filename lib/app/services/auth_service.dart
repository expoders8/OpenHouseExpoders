import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../ui/TabPage/tab_page.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class AuthService {
  login(
    String email,
    String password,
  ) async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/login'),
          body: json.encode({
            "email": email,
            "password": password,
          }),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (decodedUser['success']) {
          getStorage.write('user', jsonEncode(decodedUser["data"]));
          getStorage.write('authToken', decodedUser["data"]['authToken']);
          getStorage.write('roll', decodedUser["data"]['type']);
          LoaderX.hide();
          Get.offAll(() => const TabPage());
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to login", decodedUser['message']);
          return Future.error("Server Error");
        }
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  signup(
    String firstName,
    String lastName,
    String email,
    String password,
    String phoneNumber,
    String roll,
  ) async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/register'),
          body: json.encode({
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "phone_number": phoneNumber,
            "password": password,
            "google_token": null,
            "profile_picture": null,
            "type": roll,
            "rating": 5,
            "created_by_id": null,
            "updated_by_id": null,
          }),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        var decodedUser = jsonDecode(response.body);
        if (decodedUser['success']) {
          getStorage.write('user', jsonEncode(decodedUser["data"]));
          getStorage.write('authToken', decodedUser["data"]['authToken']);
          getStorage.write('roll', decodedUser["data"]['type']);
          LoaderX.hide();
          Get.offAll(() => const TabPage());
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to signup", decodedUser['message']);
          return Future.error("Server Error");
        }
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  socialLogin(
    String firstName,
    String lastName,
    String email,
    String profilePicture,
    String googleToken,
    String provider,
  ) async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/social-login'),
          body: json.encode({
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "profilePicture": profilePicture,
            "googleToken": googleToken,
            "provider": provider,
            "currency": "",
            "fcmToken": "",
          }),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var decodedUser = jsonDecode(response.body);
        if (decodedUser['success']) {
          getStorage.write('user', jsonEncode(decodedUser["data"]));
          getStorage.write('authToken', decodedUser["data"]['authToken']);
          return decodedUser['success'];
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to Login", decodedUser['message']);
          return Future.error("Server Error");
        }
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  changePassowrd(String userId, String currentPass, String newPass) async {
    var token = getStorage.read('authToken');
    try {
      var response = await http.post(
          Uri.parse('$baseUrl/api/User/UpdateUserPassword'),
          body: json.encode({
            "currentPassword": currentPass,
            "newPassword": newPass,
            "id": userId
          }),
          headers: {
            "Authorization": "Bearer $token",
            'Content-type': 'application/json'
          });
      if (response.statusCode == 200) {
        LoaderX.hide();
        var decodedUser = jsonDecode(response.body);
        return decodedUser;
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while sending the mail, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Failed to send email", e.toString());
      throw e.toString();
    }
  }

  forgotPassword(
    String email,
  ) async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/forgot-password'),
          body: json.encode({
            "email": email,
          }),
          headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200) {
        LoaderX.hide();
        return decodedUser;
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while sending the mail, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
