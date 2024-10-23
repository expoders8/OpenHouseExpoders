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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bedrooms",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.numberofbedrooms.toString()} BHK",
                    style: const TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdBook),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Capacity",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.person.toString()} Person",
                    style: const TextStyle(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bathrooms",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.numberofwashrooms.toString()} bathroom",
                    style: const TextStyle(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bedrooms",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.numberofbedrooms.toString()} BHK",
                    style: const TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdBook),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Capacity",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.person.toString()} Person",
                    style: const TextStyle(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bathrooms",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.numberofwashrooms.toString()} bathroom",
                    style: const TextStyle(
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

class CurrentPropertyDetailsView extends StatefulWidget {
  const CurrentPropertyDetailsView({super.key});

  @override
  State<CurrentPropertyDetailsView> createState() =>
      _CurrentPropertyDetailsViewState();
}

class _CurrentPropertyDetailsViewState
    extends State<CurrentPropertyDetailsView> {
  final GetCurrentDetailsPropertiesController
      getCurrentDetailsPropertiesController =
      Get.put(GetCurrentDetailsPropertiesController());

  @override
  Widget build(BuildContext context) {
    var propertydata = getCurrentDetailsPropertiesController.detailModel!.data!;
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bedrooms",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.numberofbedrooms.toString()} BHK",
                    style: const TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdBook),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Capacity",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.person.toString()} Person",
                    style: const TextStyle(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bathrooms",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.numberofwashrooms.toString()} bathroom",
                    style: const TextStyle(
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

class PreviousPropertyDetailsView extends StatefulWidget {
  const PreviousPropertyDetailsView({super.key});

  @override
  State<PreviousPropertyDetailsView> createState() =>
      _PreviousPropertyDetailsViewState();
}

class _PreviousPropertyDetailsViewState
    extends State<PreviousPropertyDetailsView> {
  final GetPreviousDetailsPropertiesController
      getPreviousDetailsPropertiesController =
      Get.put(GetPreviousDetailsPropertiesController());

  @override
  Widget build(BuildContext context) {
    var propertydata =
        getPreviousDetailsPropertiesController.detailModel!.data!;
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bedrooms",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.numberofbedrooms.toString()} BHK",
                    style: const TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdBook),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Capacity",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.person.toString()} Person",
                    style: const TextStyle(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bathrooms",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.numberofwashrooms.toString()} bathroom",
                    style: const TextStyle(
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

class ListPropertyDetailsView extends StatefulWidget {
  const ListPropertyDetailsView({super.key});

  @override
  State<ListPropertyDetailsView> createState() =>
      _ListPropertyDetailsViewState();
}

class _ListPropertyDetailsViewState extends State<ListPropertyDetailsView> {
  final GetListDetailsPropertiesController getListDetailsPropertiesController =
      Get.put(GetListDetailsPropertiesController());

  @override
  Widget build(BuildContext context) {
    var propertydata = getListDetailsPropertiesController.detailModel!.data!;
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bedrooms",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.numberofbedrooms.toString()} BHK",
                    style: const TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdBook),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Capacity",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.person.toString()} Person",
                    style: const TextStyle(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bathrooms",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdNormal),
                  ),
                  Text(
                    "${propertydata.numberofwashrooms.toString()} bathroom",
                    style: const TextStyle(
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
