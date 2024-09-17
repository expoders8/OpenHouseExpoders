import 'package:get/get.dart';

import '../services/tenant_service.dart';
import '../models/get_invitation_model.dart';

class GetAllInvitationController extends GetxController {
  var isLoading = true.obs;
  TenantService tenantService = TenantService();
  var invitationList = <GetAllInvitationModel>[].obs;

  @override
  void onInit() {
    getAllInvitations();
    super.onInit();
  }

  void getAllInvitations() async {
    try {
      isLoading(true);
      var invitations = await tenantService.getAllInvitations();
      if (invitations.data != null) {
        invitationList.assign(invitations);
      }
    } finally {
      isLoading(false);
    }
  }
}
