import 'package:get/get.dart';

import '../models/get_expense_model.dart';
import '../models/getall_property_expenses_model.dart';
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

  fetchAllProperties() async {
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
  var trtrrtrt = <GetAllCurrentPropertyModel>[].obs;
  RxString searchText = "".obs;
  RxString image = "".obs;
  RxString name = "".obs;
  RxString address = "".obs;
  RxString propertyId = "".obs;

  @override
  void onInit() {
    fetchAllProperties();
    super.onInit();
  }

  fetchAllProperties() async {
    try {
      isLoading(true);
      var properties = await propertiesService.getAllCurrentProperties();
      if (properties.data != null) {
        trtrrtrt.assign(properties);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetPreviousPropertyController extends GetxController {
  var isLoading = true.obs;
  PropertiesService propertiesService = PropertiesService();
  var propertiesList = <GetAllPropertiesModel>[].obs;
  RxString searchText = "".obs;
  RxString image = "".obs;
  RxString name = "".obs;
  RxString address = "".obs;
  RxString propertyId = "".obs;

  @override
  void onInit() {
    fetchAllProperties();
    super.onInit();
  }

  void fetchAllProperties() async {
    try {
      isLoading(true);
      var properties = await propertiesService.getAllPreviousProperties();
      if (properties.data != null) {
        propertiesList.assign(properties);
      }
    } finally {
      isLoading(false);
    }
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

class GetAllExpenseController extends GetxController {
  var isLoading = true.obs;
  PropertiesService propertiesService = PropertiesService();
  var expensetList = <GetAllExpenseModel>[].obs;
  RxString propertyId = "".obs;

  void getAllExpenses() async {
    try {
      isLoading(true);
      var expenses = await propertiesService.getAllExpense(propertyId.value);
      if (expenses.data != null) {
        expensetList.assign(expenses);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetAllPropertyExpensesController extends GetxController {
  var isLoading = true.obs;
  PropertiesService propertiesService = PropertiesService();
  var expensetList = <GetallPropertyExpensesModel>[].obs;
  RxString propertyId = "".obs;

  void getAllExpenses() async {
    try {
      isLoading(true);
      var expenses = await propertiesService.getAllPropertyExpenses();
      if (expenses.data != null) {
        expensetList.assign(expenses);
      }
    } finally {
      isLoading(false);
    }
  }
}

class PropertyCheckoutController extends GetxController {
  var isLoading = true.obs;
  PropertiesService propertiesService = PropertiesService();
  RxString propertyId = "".obs;
  RxString rentalId = "".obs;
  RxString proeprtyAddress = "".obs;
  RxString propertyName = "".obs;
  RxString email = "".obs;
  RxInt rentAmount = 0.obs;

  void sendCheckoutProperties(List<Map<String, dynamic>> checkoutData) async {
    try {
      isLoading(true);
      await propertiesService.sendCheckoutProperties(
          propertyId.value, rentalId.value, checkoutData);
    } finally {
      isLoading(false);
    }
  }
}
