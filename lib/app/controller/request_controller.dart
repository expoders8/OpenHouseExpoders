import 'package:get/get.dart';

import '../services/requests_service.dart';
import '../models/tenant_request_model.dart';
import '../models/get_all_request_model.dart';

class GetAllRequestsController extends GetxController {
  var isLoading = true.obs;
  RequestsService requestsService = RequestsService();
  var requestList = <GetAllRequestsModel>[].obs;

  @override
  void onInit() {
    getAllRequests();
    super.onInit();
  }

  void getAllRequests() async {
    try {
      isLoading(true);
      var requests = await requestsService.getAllRequests();
      if (requests.data != null) {
        requestList.assign(requests);
      }
    } finally {
      isLoading(false);
    }
  }
}

class GetAllHostRequestsController extends GetxController {
  var isLoading = true.obs;
  RequestsService requestsService = RequestsService();
  var requestList = <GetAllHostRequestsModel>[].obs;

  @override
  void onInit() {
    getAllRequests();
    super.onInit();
  }

  void getAllRequests() async {
    try {
      isLoading(true);
      var requests = await requestsService.getAllHostRequests();
      if (requests.data != null) {
        requestList.assign(requests);
      }
    } finally {
      isLoading(false);
    }
  }
}
