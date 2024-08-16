import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/constant/color_constant.dart';
import '../../config/constant/font_constant.dart';

class PropertyDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Property details",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 17,
                fontFamily: kCircularStdMedium),
          ),
          const Divider(),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Bedrooms",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "1 Single",
                    style: TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdBook),
                  ),
                  Text(
                    "1 Double",
                    style: TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdBook),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Capacity",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "3 Person",
                    style: TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdBook),
                  ),
                ],
              ),
              Image.asset(
                "assets/icons/line_vertical.png",
                fit: BoxFit.cover,
                scale: 0.7,
                color: kSecondaryColor,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Bathrooms",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "1 full bathroom",
                    style: TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdBook),
                  ),
                  Text(
                    "1 toilet",
                    style: TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdBook),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Bills",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "included",
                    style: TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdBook),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Room & Property amenities",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 17,
                fontFamily: kCircularStdMedium),
          ),
          const Divider(),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  amenities("Parking"),
                  const SizedBox(height: 5),
                  amenities("Wifi"),
                  const SizedBox(height: 5),
                  amenities("Garden"),
                  const SizedBox(height: 5),
                  amenities("Washing machine"),
                  const SizedBox(height: 5),
                  amenities("TV"),
                  const SizedBox(height: 5),
                  amenities("Furnished"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget amenities(String text) {
    return SizedBox(
      width: Get.width - 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/icons/correct.png",
                fit: BoxFit.cover,
                height: 15,
                width: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontFamily: kCircularStdNormal),
              ),
            ],
          ),
          const Text(
            "How to.?",
            style: TextStyle(
                color: kBlueColor,
                fontSize: 10,
                fontFamily: kCircularStdNormal),
          ),
        ],
      ),
    );
  }
}
