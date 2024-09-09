import 'package:get/get.dart';

import '../models/getpropretyes_model.dart';

class GetAllMyTenantsController extends GetxController {
  var isLoading = true.obs;
  var tenantsList = <GetAllPropertiesModel>[].obs;
  RxString searchText = "".obs;

  @override
  void onInit() {
    fetchAllTenants();
    super.onInit();
  }

  void fetchAllTenants() async {
    try {
      isLoading(true);
      // var properties =
      //     await propertiesService.getAllProperties(createRequest());
      // if (properties.data != null) {
      //   propertiesList.assign(properties);
      // }
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
