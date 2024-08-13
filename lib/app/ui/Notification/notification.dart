import 'package:flutter/material.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notification",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kBackGroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            notification("Notification", "assets/icons/boy 1.png", "Details"),
            const SizedBox(height: 20),
            notification(
                "Notification title", "assets/icons/boy 2.png", "Details"),
            const SizedBox(height: 20),
            notification("Notification", "assets/icons/boy 3.png", "Details"),
            const SizedBox(height: 20),
          ],
        ),
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
