import 'package:get/get.dart';

import '../models/extensions_model.dart';
import '../models/get_expense_model.dart';
import '../models/get_list_property.dart';
import '../models/getpropretyes_model.dart';
import '../services/properties_service.dart';
import '../models/getall_property_expenses_model.dart';

class GetLeasePropertyController extends GetxController {
  var isLoading = true.obs;
  RxString searchText = "".obs;
  var propertiesList = <GetAllPropertiesModel>[].obs;
  PropertiesService propertiesService = PropertiesService();

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
  RxString searchText = "".obs;
  var propertiesList = <GetAllPropertiesModel>[].obs;
  PropertiesService propertiesService = PropertiesService();

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
  RxString name = "".obs;
  RxString image = "".obs;
  var isLoading = true.obs;
  RxString address = "".obs;
  RxString searchText = "".obs;
  RxString propertyId = "".obs;
  var trtrrtrt = <GetAllCurrentPropertyModel>[].obs;
  PropertiesService propertiesService = PropertiesService();

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
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetPreviousPropertyController extends GetxController {
  RxString name = "".obs;
  RxString image = "".obs;
  var isLoading = true.obs;
  RxString address = "".obs;
  RxString searchText = "".obs;
  RxString propertyId = "".obs;
  var propertiesList = <GetAllPropertiesModel>[].obs;
  PropertiesService propertiesService = PropertiesService();

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
  RxString searchText = "".obs;
  var propertiesList = <GetAllPropertiesModel>[].obs;
  PropertiesService propertiesService = PropertiesService();

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
  RxString propertyId = "".obs;
  var expensetList = <GetAllExpenseModel>[].obs;
  PropertiesService propertiesService = PropertiesService();

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
  RxString propertyId = "".obs;
  var expensetList = <GetallPropertyExpensesModel>[].obs;
  PropertiesService propertiesService = PropertiesService();

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
  RxString email = "".obs;
  var isLoading = true.obs;
  RxInt rentAmount = 0.obs;
  RxString rentalId = "".obs;
  RxString propertyId = "".obs;
  RxString propertyName = "".obs;
  RxString proeprtyAddress = "".obs;
  PropertiesService propertiesService = PropertiesService();

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

class GetPropertyExtensionsController extends GetxController {
  var isLoading = true.obs;
  PropertiesService propertiesService = PropertiesService();
  var propertiesExtensionsList = <GetAllExtensionModel>[].obs;

  @override
  void onInit() {
    fetchAllPropertiesExtensions();
    super.onInit();
  }

  void fetchAllPropertiesExtensions() async {
    try {
      isLoading(true);
      var propertiesExtensions =
          await propertiesService.getAllPropertyExtensions();
      if (propertiesExtensions.data != null) {
        propertiesExtensionsList.assign(propertiesExtensions);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetListPropertyController extends GetxController {
  var isLoading = true.obs;
  RxString searchText = "".obs;
  var propertiesList = <GetAllListPropertyModel>[].obs;
  PropertiesService propertiesService = PropertiesService();

  fetchAllProperties(String cityName) async {
    try {
      isLoading(true);
      var properties = await propertiesService.getAllListProperties(cityName);
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
