import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/state_model.dart';
import '../models/country_model.dart';
import '../models/serchproperty_model.dart';
import '../models/get_amenities_model.dart';
import '../../config/constant/constant.dart';
import '../models/lookup_get_checkout_request.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class LookupService {
  Future<List<GetAllAmenitiesDataModel>> getamenities() async {
    try {
      var response = await http.get(
          Uri.parse('$baseUrl/api/lookup/getamenities'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        final List<dynamic> fetchAmenities = data['data'];
        return fetchAmenities
            .map((json) => GetAllAmenitiesDataModel.fromJson(json))
            .toList();
      } else if (response.statusCode == 401) {
        return Future.error("Authentication Error");
      } else {
        throw Exception('Failed to fetch Category');
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  Future<List<GetAllSearchPropertyDataModel>> getSearchProperties(
      String searchText) async {
    try {
      var response = await http.post(
          Uri.parse('$baseUrl/api/property/search_property'),
          body: json.encode({"searchText": searchText}),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        final List<dynamic> fetchAmenities = data['data'];
        return fetchAmenities
            .map((json) => GetAllSearchPropertyDataModel.fromJson(json))
            .toList();
      } else if (response.statusCode == 401) {
        return Future.error("Authentication Error");
      } else {
        throw Exception('Failed to fetch Category');
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  Future<List<GetAllCountryDataModel>> getcountries() async {
    try {
      var response = await http.get(
          Uri.parse('$baseUrl/api/lookup/getcountries'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        final List<dynamic> fetchCountrys = data['data'];
        return fetchCountrys
            .map((json) => GetAllCountryDataModel.fromJson(json))
            .toList();
      } else if (response.statusCode == 401) {
        return Future.error("Authentication Error");
      } else {
        throw Exception('Failed to fetch Category');
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  Future<List<GetAllStateDataModel>> getState(String contryid) async {
    try {
      var response = await http.get(
          Uri.parse('$baseUrl/api/lookup/getstates?country_id=$contryid'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        final List<dynamic> fetchStates = data['data'];
        return fetchStates
            .map((json) => GetAllStateDataModel.fromJson(json))
            .toList();
      } else if (response.statusCode == 401) {
        return Future.error("Authentication Error");
      } else {
        throw Exception('Failed to fetch Category');
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }

  Future<List<GetAllCheckoutRequestLookupDataModel>> getCheckoutLookup() async {
    try {
      var response = await http.get(
          Uri.parse('$baseUrl/api/lookup/get_checkout_request'),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        final List<dynamic> fetchStates = data['data'];
        return fetchStates
            .map((json) => GetAllCheckoutRequestLookupDataModel.fromJson(json))
            .toList();
      } else if (response.statusCode == 401) {
        return Future.error("Authentication Error");
      } else {
        throw Exception('Failed to fetch Category');
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Server Error", e.toString());
      throw e.toString();
    }
  }
}
