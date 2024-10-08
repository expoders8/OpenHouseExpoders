import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:openhome/app/services/firebase_auth_service.dart';

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
      var response = await http.post(Uri.parse('$baseUrl/api/auth/login'),
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
          var userObj = decodedUser["data"];
          var fullName =
              "${decodedUser["data"]['last_name']}, ${decodedUser["data"]['first_name']}";
          await FirebaseAuthServices().signUp(fullName, email, password,
              userObj['id'].toString(), userObj['profile_picture'].toString());
          getStorage.write('appFlow', 1);
          LoaderX.hide();
          Get.offAll(() => const TabPage());
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to login", decodedUser['error']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Failed to login", decodedUser['error']);
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
      var response = await http.post(Uri.parse('$baseUrl/api/auth/register'),
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
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedUser['success']) {
          getStorage.write('user', jsonEncode(decodedUser["data"]));
          getStorage.write('userid', decodedUser["data"]["id"]);
          getStorage.write('authToken', decodedUser["data"]['auth_token']);
          getStorage.write('roll', decodedUser["data"]['type']);
          getStorage.write('appFlow', 1);
          LoaderX.hide();
          Get.offAll(() => const TabPage());
        } else {
          LoaderX.hide();
          SnackbarUtils.showErrorSnackbar(
              "Failed to signup", decodedUser['message']);
          return Future.error("Server Error");
        }
      } else {
        LoaderX.hide();
        Get.back();
        SnackbarUtils.showErrorSnackbar(
            "Failed to signup", decodedUser['message']);
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
      var response =
          await http.post(Uri.parse('$baseUrl/api/auth/social-login'),
              body: json.encode({
                "firstName": firstName,
                "lastName": lastName,
                "email": email,
                "profilePicture": profilePicture,
                "googleToken": googleToken,
                "provider": provider,
                "fcmToken": "",
              }),
              headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var decodedUser = jsonDecode(response.body);
        if (decodedUser['success']) {
          getStorage.write('user', jsonEncode(decodedUser["data"]));
          getStorage.write('authToken', decodedUser["data"]['authToken']);
          getStorage.write('roll', decodedUser["data"]['type']);
          getStorage.write('appFlow', 1);
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
    var userdata = getStorage.read('user');
    var userid = jsonDecode(userdata);

    try {
      var response = await http.post(
          Uri.parse('$baseUrl/api/auth/change-password'),
          body: json.encode({
            "id": userid["id"],
            "currentPassword": currentPass,
            "newPassword": newPass
          }),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var decodedUser = jsonDecode(response.body);
        LoaderX.hide();
        Get.back();
        SnackbarUtils.showSnackbar(decodedUser["message"], "");
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
      var response =
          await http.post(Uri.parse('$baseUrl/api/auth/forgot-password'),
              body: json.encode({
                "email": email,
              }),
              headers: {'Content-type': 'application/json'});
      var decodedUser = jsonDecode(response.body);
      if (response.statusCode == 200) {
        LoaderX.hide();
        Get.back();
        SnackbarUtils.showSnackbar(decodedUser["message"], "");
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
