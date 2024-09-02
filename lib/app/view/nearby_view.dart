import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../config/constant/constant.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';

class NearByAmenitiesView extends StatefulWidget {
  const NearByAmenitiesView({super.key});

  @override
  State<NearByAmenitiesView> createState() => _NearByAmenitiesViewState();
}

class _NearByAmenitiesViewState extends State<NearByAmenitiesView> {
  String selectedRoll = "";

  @override
  void initState() {
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          selectedRoll == "tenant"
              ? Container()
              : CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    height: 38,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kPrimaryColor),
                        color: kBackGroundColor),
                    child: const Center(
                      child: Text(
                        "+ Add Nearby",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
          const SizedBox(height: 5),
          nearby("assets/icons/market1.jpeg", "Yaya center supermarket",
              "Robson St, Vancouver", "Supermarket"),
          const SizedBox(height: 5),
          nearby(
            "assets/icons/hospital.jpeg",
            "Central Hospital",
            "224 Robson St",
            "General Hospital",
          ),
          const SizedBox(height: 5),
          nearby(
            "assets/icons/market2.jpeg",
            "Supermarket",
            "502 Robson St",
            "Grocery Store",
          ),
          const SizedBox(height: 5),
          // amenities("Mall"),
          // const SizedBox(height: 5),
          // amenities("Market"),
          // const SizedBox(height: 5),
          // amenities("Hospital"),
        ],
      ),
    );
  }

  Widget nearby(String image, title, address, type) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                    fontFamily: kCircularStdMedium),
              ),
              SizedBox(
                width: Get.width / 2,
                child: Text(
                  type,
                  style: const TextStyle(
                      color: kSecondaryPrimaryColor,
                      fontSize: 11,
                      fontFamily: kCircularStdMedium),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 13,
                    color: kButtonColor,
                  ),
                  const SizedBox(width: 3),
                  SizedBox(
                    width: Get.width / 2,
                    child: Text(
                      address,
                      style: const TextStyle(
                          color: kSecondaryPrimaryColor,
                          fontSize: 11,
                          fontFamily: kCircularStdNormal),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
          const SizedBox(width: 10),
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
