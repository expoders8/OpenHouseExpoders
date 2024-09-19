import 'package:get/get.dart';

import '../models/getpropretyes_model.dart';
import '../services/properties_service.dart';

class GetLeasePropertyController extends GetxController {
  var isLoading = true.obs;
  PropertiesService propertiesService = PropertiesService();
  var propertiesList = <GetAllPropertiesModel>[].obs;
  RxString searchText = "".obs;

  @override
  void onInit() {
    fetchAllProperties();
    super.onInit();
  }

  void fetchAllProperties() async {
    try {
      isLoading(true);
      var properties =
          await propertiesService.getAllProperties(createRequest());
      if (properties.data != null) {
        propertiesList.assign(properties);
      }
    } finally {
      isLoading(false);
    }
  }

  createRequest() {
    PropertiesRequestModel propertiesRequestModel = PropertiesRequestModel();
    propertiesRequestModel.pageSize = 100;
    propertiesRequestModel.pageNumber = 1;
    propertiesRequestModel.searchText =
        searchText.value.isEmpty ? null : searchText.value;
    propertiesRequestModel.sortBy = null;
    propertiesRequestModel.propertyid = null;
    propertiesRequestModel.userId = null;
    propertiesRequestModel.type = null;
    propertiesRequestModel.onlease = true;
    propertiesRequestModel.countryId = null;
    propertiesRequestModel.stateId = null;
    propertiesRequestModel.cityName = null;
    return propertiesRequestModel;
  }
}

class GetAvailablePropertyController extends GetxController {
  var isLoading = true.obs;
  var propertiesList = <GetAllPropertiesModel>[].obs;
  PropertiesService propertiesService = PropertiesService();
  RxString searchText = "".obs;

  @override
  void onInit() {
    fetchAllProperties();
    super.onInit();
  }

  void fetchAllProperties() async {
    try {
      isLoading(true);
      var properties =
          await propertiesService.getAllProperties(createRequest());
      if (properties.data != null) {
        propertiesList.assign(properties);
      }
    } finally {
      isLoading(false);
    }
  }

  createRequest() {
    PropertiesRequestModel propertiesRequestModel = PropertiesRequestModel();
    propertiesRequestModel.pageSize = 100;
    propertiesRequestModel.pageNumber = 1;
    propertiesRequestModel.searchText =
        searchText.value.isEmpty ? null : searchText.value;
    propertiesRequestModel.sortBy = null;
    propertiesRequestModel.propertyid = null;
    propertiesRequestModel.userId = null;
    propertiesRequestModel.type = null;
    propertiesRequestModel.onlease = false;
    propertiesRequestModel.countryId = null;
    propertiesRequestModel.stateId = null;
    propertiesRequestModel.cityName = null;
    return propertiesRequestModel;
  }
}

class GetCurrentPropertyController extends GetxController {
  var isLoading = true.obs;
  PropertiesService propertiesService = PropertiesService();
  var propertiesList = <GetAllPropertiesModel>[].obs;
  RxString searchText = "".obs;

  @override
  void onInit() {
    fetchAllProperties();
    super.onInit();
  }

  void fetchAllProperties() async {
    try {
      isLoading(true);
      var properties =
          await propertiesService.getAllProperties(createRequest());
      if (properties.data != null) {
        propertiesList.assign(properties);
      }
    } finally {
      isLoading(false);
    }
  }

  createRequest() {
    PropertiesRequestModel propertiesRequestModel = PropertiesRequestModel();
    propertiesRequestModel.pageSize = 100;
    propertiesRequestModel.pageNumber = 1;
    propertiesRequestModel.searchText =
        searchText.value.isEmpty ? null : searchText.value;
    propertiesRequestModel.sortBy = null;
    propertiesRequestModel.propertyid = null;
    propertiesRequestModel.userId = null;
    propertiesRequestModel.type = null;
    propertiesRequestModel.onlease = true;
    propertiesRequestModel.countryId = null;
    propertiesRequestModel.stateId = null;
    propertiesRequestModel.cityName = null;
    return propertiesRequestModel;
  }
}

class GetMyLeasePropertyController extends GetxController {
  var isLoading = true.obs;
  PropertiesService propertiesService = PropertiesService();
  var propertiesList = <GetAllPropertiesModel>[].obs;
  RxString searchText = "".obs;

  @override
  void onInit() {
    fetchAllProperties();
    super.onInit();
  }

  void fetchAllProperties() async {
    try {
      isLoading(true);
      var properties =
          await propertiesService.getMyLeaseProperties(createRequest());
      if (properties.data != null) {
        propertiesList.assign(properties);
      }
    } finally {
      isLoading(false);
    }
  }

  createRequest() {
    PropertiesRequestModel propertiesRequestModel = PropertiesRequestModel();
    propertiesRequestModel.pageSize = 100;
    propertiesRequestModel.pageNumber = 1;
    propertiesRequestModel.searchText =
        searchText.value.isEmpty ? null : searchText.value;
    propertiesRequestModel.sortBy = null;
    propertiesRequestModel.propertyid = null;
    propertiesRequestModel.userId = null;
    propertiesRequestModel.type = null;
    propertiesRequestModel.onlease = true;
    propertiesRequestModel.countryId = null;
    propertiesRequestModel.stateId = null;
    propertiesRequestModel.cityName = null;
    return propertiesRequestModel;
  }
}
