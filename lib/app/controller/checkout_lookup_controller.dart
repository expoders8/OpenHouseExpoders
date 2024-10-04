import 'package:get/get.dart';

import '../models/lookup_get_checkout_request.dart';
import '../services/lookup_service.dart';

class GetAllCheckoutLookupController extends GetxController {
  var isLoading = true.obs;
  var lookupdataList = <List<GetAllCheckoutRequestLookupDataModel>>[].obs;
  LookupService lookupService = LookupService();

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
