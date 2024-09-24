import 'package:get/get.dart';

import '../services/tenant_service.dart';
import '../models/getall_tenant_model.dart';

class GetAllTenantController extends GetxController {
  var isLoading = true.obs;
  var tenantssList = <GetAllTenantModel>[].obs;
  TenantService tenantService = TenantService();
  RxString email = "".obs;
  RxString phoneNo = "".obs;
  RxString endDate = "".obs;
  RxString tenantId = "".obs;
  RxString startDate = "".obs;
  RxString searchText = "".obs;
  RxString propertyId = "".obs;
  RxString rentAmount = "".obs;
  RxString propertyName = "".obs;
  RxString propertyImage = "".obs;
  RxString propertyAddress = "".obs;

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
