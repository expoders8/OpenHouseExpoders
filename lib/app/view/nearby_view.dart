import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';

class NearByAmenitiesView extends StatefulWidget {
  const NearByAmenitiesView({super.key});

  @override
  State<NearByAmenitiesView> createState() => _NearByAmenitiesViewState();
}

class _NearByAmenitiesViewState extends State<NearByAmenitiesView> {
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
