import 'package:get/get.dart';
import 'package:openhome/app/models/my_host_get_model.dart';
import '../models/my_tenant_get_model.dart';
import '../services/my_hosts_service.dart';
import '../services/my_tenants_service.dart';

class GetAllPreviousHostsController extends GetxController {
  var isLoading = true.obs;
  var hostsList = <GetAllMyHostsModel>[].obs;
  RxString searchText = "".obs;
  MyHostService myHostService = MyHostService();

  @override
  void onInit() {
    fetchAllTenants();
    super.onInit();
  }

  void fetchAllTenants() async {
    try {
      isLoading(true);
      var tenants = await myHostService.previousHosts();
      if (tenants.data != null) {
        hostsList.assign(tenants);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetAllCurrentHostsController extends GetxController {
  var isLoading = true.obs;
  var hostsList = <GetAllMyHostsModel>[].obs;
  RxString searchText = "".obs;
  MyHostService myHostService = MyHostService();

  @override
  void onInit() {
    fetchAllTenants();
    super.onInit();
  }

  void fetchAllTenants() async {
    try {
      isLoading(true);
      var tenants = await myHostService.currentHosts();
      if (tenants.data != null) {
        hostsList.assign(tenants);
      }
    } finally {
      isLoading(false);
    }
  }
}
