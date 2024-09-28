import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../controller/notification_controller.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final GetAllNotificationsController getAllNotificationsController =
      Get.put(GetAllNotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notification",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        centerTitle: true,
        backgroundColor: kBackGroundColor,
      ),
      body: Obx(
        () {
          if (getAllNotificationsController.isLoading.value) {
            return Container(
              color: kBackGroundColor,
              child: const Center(
                child: CircularProgressIndicator(
                  color: kSelectedIconColor,
                ),
              ),
            );
          } else {
            if (getAllNotificationsController.notificationList.isNotEmpty) {
              if (getAllNotificationsController
                  .notificationList[0].data!.isEmpty) {
                return Center(
                  child: Text('No Notification found'),
                );
              } else {
                return ListView.builder(
                  itemCount: getAllNotificationsController
                      .notificationList[0].data!.length,
                  itemBuilder: (context, index) {
                    var requestData =
                        getAllNotificationsController.notificationList[0].data!;
                    if (requestData.isNotEmpty) {
                      var data = requestData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            notification(
                                data.title.toString(),
                                "assets/icons/boy 1.png",
                                data.decription.toString()),
                            const SizedBox(height: 20),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "No Notification",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                              fontFamily: kCircularStdMedium),
                        ),
                      );
                    }
                  },
                );
              }
            } else {
              return const Center(
                child: Text(
                  "No Notification",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
              );
            }
          }
        },
      ),
    );
  }

  notification(String title, image, detail) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: 45,
            width: 45,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                ),
                const Text(
                  "4d",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 12,
                      fontFamily: kCircularStdNormal),
                ),
              ],
            ),
            Text(
              detail,
              style: const TextStyle(
                  color: kSecondaryPrimaryColor,
                  fontSize: 11,
                  fontFamily: kCircularStdMedium),
            ),
          ],
        ),
      ],
    );
  }
}
