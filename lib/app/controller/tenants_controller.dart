import 'package:get/get.dart';

import '../services/tenant_service.dart';
import '../models/getall_tenant_model.dart';
import '../models/previous_tenant_model.dart';

class GetAllTenantController extends GetxController {
  RxString email = "".obs;
  var isLoading = true.obs;
  RxString endDate = "".obs;
  RxString phoneNo = "".obs;
  RxString tenantId = "".obs;
  RxString hostId = "".obs;
  RxString hostName = "".obs;
  RxString startDate = "".obs;
  RxString searchText = "".obs;
  RxString propertyId = "".obs;
  RxString rentAmount = "".obs;
  RxString propertyName = "".obs;
  RxString propertyImage = "".obs;
  RxString propertyAddress = "".obs;
  var tenantssList = <GetAllTenantModel>[].obs;
  TenantService tenantService = TenantService();

  // @override
  // void onInit() {
  //   debounce(searchText, (_) {
  //     fetchAllTenants();
  //   },
  //       time: Duration(
  //           milliseconds: 500)); // Wait for 500ms after the user stops typing
  //   super.onInit();
  // }

  // fetchAllTenants() async {
  //   try {
  //     isLoading(true);
  //     var tenants = await tenantService.getallTenant(searchText.value);
  //     if (tenants.data != null) {
  //       tenantssList.assign(tenants);
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}

class GetAllPropertyPreviousTenantController extends GetxController {
  var isLoading = true.obs;
  RxString propertyId = "".obs;
  TenantService tenantService = TenantService();
  var requestList = <GetAllPreviousTenantModel>[].obs;

  void getAllTenants() async {
    try {
      isLoading(true);
      var requests =
          await tenantService.getAllPreviousTenant(propertyId.value.toString());
      if (requests.data != null) {
        requestList.assign(requests);
      }
    } finally {
      isLoading(false);
    }
  }
}
