import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../controller/property_detail_controller.dart';

class PropertyDetailsView extends StatefulWidget {
  const PropertyDetailsView({super.key});

  @override
  State<PropertyDetailsView> createState() => _PropertyDetailsViewState();
}

class _PropertyDetailsViewState extends State<PropertyDetailsView> {
  final GetDetailsPropertiesController getDetailsPropertiesController =
      Get.put(GetDetailsPropertiesController());

  @override
  Widget build(BuildContext context) {
    var propertydata = getDetailsPropertiesController.detailModel!.data!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
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
          SizedBox(
            width: Get.width - 30,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: propertydata.amenitys!.length,
              itemBuilder: (context, index) {
                if (propertydata.amenitys!.isNotEmpty) {
                  return Column(
                    children: [
                      amenities(
                          propertydata.amenitys![index].title!.toString()),
                      const SizedBox(height: 5),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text(
                      "No Amenities",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontFamily: kCircularStdMedium),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  amenities(String text) {
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
            text[0].toUpperCase() + text.substring(1),
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 14,
              fontFamily: kCircularStdNormal,
            ),
          ),
        ],
      ),
    );
  }
}

class NotLeasePropertyDetailsView extends StatefulWidget {
  const NotLeasePropertyDetailsView({super.key});

  @override
  State<NotLeasePropertyDetailsView> createState() =>
      _NotLeasePropertyDetailsViewState();
}

class _NotLeasePropertyDetailsViewState
    extends State<NotLeasePropertyDetailsView> {
  final GetnotleaseDetailsPropertiesController
      getnotleaseDetailsPropertiesController =
      Get.put(GetnotleaseDetailsPropertiesController());

  @override
  Widget build(BuildContext context) {
    var propertydata =
        getnotleaseDetailsPropertiesController.detailModel!.data!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
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
          SizedBox(
            width: Get.width - 30,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: propertydata.amenitys!.length,
              itemBuilder: (context, index) {
                if (propertydata.amenitys!.isNotEmpty) {
                  return Column(
                    children: [
                      amenities(
                          propertydata.amenitys![index].title!.toString()),
                      const SizedBox(height: 5),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text(
                      "No Amenities",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontFamily: kCircularStdMedium),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  amenities(String text) {
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
            text[0].toUpperCase() + text.substring(1),
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 14,
              fontFamily: kCircularStdNormal,
            ),
          ),
        ],
      ),
    );
  }
}
