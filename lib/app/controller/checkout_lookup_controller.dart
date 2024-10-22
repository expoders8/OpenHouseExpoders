import 'package:get/get.dart';

import '../services/lookup_service.dart';
import '../models/lookup_get_checkout_request.dart';

class GetAllCheckoutLookupController extends GetxController {
  var isLoading = true.obs;
  LookupService lookupService = LookupService();
  var lookupdataList = <List<GetAllCheckoutRequestLookupDataModel>>[].obs;

  // @override
  // void onInit() {
  //   fetchAllcheckoutlookup();
  //   super.onInit();
  // }

  void fetchAllcheckoutlookup() async {
    try {
      isLoading(true);
      var data = await lookupService.getCheckoutLookup();
      lookupdataList.assign(data);
    } finally {
      isLoading(false);
    }
  }
}
