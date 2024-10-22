import 'package:get/get.dart';

import '../models/notification_model.dart';
import '../services/notification_service.dart';

class GetAllNotificationsController extends GetxController {
  var isLoading = true.obs;
  var notificationList = <GetAllNotificationModel>[].obs;
  NotificationsService notificationsService = NotificationsService();

  @override
  void onInit() {
    getAllNotofications();
    super.onInit();
  }

  void getAllNotofications() async {
    try {
      isLoading(true);
      var requests = await notificationsService.getAllNotifications();
      if (requests.data != null) {
        notificationList.assign(requests);
      }
    } finally {
      isLoading(false);
    }
  }
}
