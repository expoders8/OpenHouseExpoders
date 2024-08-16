import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/constant/color_constant.dart';
import '../../config/constant/font_constant.dart';

class NearByAmenitiesView extends StatelessWidget {
  const NearByAmenitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          amenities("Mall"),
          const SizedBox(height: 5),
          amenities("Market"),
          const SizedBox(height: 5),
          amenities("Hospital"),
        ],
      ),
    );
  }

  Widget amenities(String text) {
    return SizedBox(
      width: Get.width - 30,
      child: Row(
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
    );
  }
}
