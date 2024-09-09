// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../models/getpropretyes_model.dart';
// import '../../config/constant/constant.dart';
// import '../../config/provider/loader_provider.dart';
// import '../../config/provider/snackbar_provider.dart';

// class MyTenantService {
//   currentTenants(Model getRequest) async {
//     try {
//       var response = await http.post(Uri.parse('$baseUrl/api/api'),
//           body: json.encode({
//           }),
//           headers: {'Content-type': 'application/json'});
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         LoaderX.hide();
//         var data = json.decode(response.body);
//         return Model.fromJson(data);
//       } else if (response.statusCode == 401) {
//         LoaderX.hide();
//         return Future.error("Authentication Error");
//       } else {
//         LoaderX.hide();
//         SnackbarUtils.showErrorSnackbar("Server Error",
//             "Error while fetch Properties, Please try after some time.");
//         return Future.error("Server Error");
//       }
//     } catch (e) {
//       LoaderX.hide();
//       SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
//       throw e.toString();
//     }
//   }

//   previousTenants(Model getRequest) async {
//     try {
//       var response = await http.post(Uri.parse('$baseUrl/api/api'),
//           body: json.encode({
//           }),
//           headers: {'Content-type': 'application/json'});
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         LoaderX.hide();
//         var data = json.decode(response.body);
//         return Model.fromJson(data);
//       } else if (response.statusCode == 401) {
//         LoaderX.hide();
//         return Future.error("Authentication Error");
//       } else {
//         LoaderX.hide();
//         SnackbarUtils.showErrorSnackbar("Server Error",
//             "Error while fetch Properties, Please try after some time.");
//         return Future.error("Server Error");
//       }
//     } catch (e) {
//       LoaderX.hide();
//       SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
//       throw e.toString();
//     }
//   }
// }
