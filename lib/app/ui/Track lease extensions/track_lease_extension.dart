import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../models/extensions_model.dart';
import '../../controller/property_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class TrackLeaseExtensionPage extends StatefulWidget {
  const TrackLeaseExtensionPage({super.key});

  @override
  State<TrackLeaseExtensionPage> createState() =>
      _TrackLeaseExtensionPageState();
}

class _TrackLeaseExtensionPageState extends State<TrackLeaseExtensionPage> {
  final GetPropertyExtensionsController getPropertyExtensionsController =
      Get.put(GetPropertyExtensionsController());

  bool isView = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Property Service Extensions"),
        ),
        body: Obx(
          () {
            if (getPropertyExtensionsController.isLoading.value) {
              return Container(
                color: kBackGroundColor,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: kSelectedIconColor,
                  ),
                ),
              );
            } else {
              if (getPropertyExtensionsController
                  .propertiesExtensionsList.isNotEmpty) {
                if (getPropertyExtensionsController
                    .propertiesExtensionsList[0].data!.isEmpty) {
                  return const Center(
                    child: Text(
                      "No extensions",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontFamily: kCircularStdMedium),
                    ),
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: getPropertyExtensionsController
                        .propertiesExtensionsList[0].data!.length,
                    itemBuilder: (context, index) {
                      var requestData = getPropertyExtensionsController
                          .propertiesExtensionsList[0].data!;
                      if (requestData.isNotEmpty) {
                        var data = requestData[index];
                        return Card(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: kButtonSecondaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(data.propertyName.toString(),
                                          style: const TextStyle(
                                              color: kWhiteColor,
                                              fontFamily: kCircularStdMedium,
                                              fontSize: 15)),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 16,
                                            color: kWhiteColor,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(data.propertyAddress.toString(),
                                              style: const TextStyle(
                                                  color: kWhiteColor,
                                                  fontFamily:
                                                      kCircularStdNormal,
                                                  fontSize: 11)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              buildRentals(data.rentals)
                            ],
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            "No extensions",
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
                    "No extensions",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                );
              }
            }
          },
        ));
  }

  Widget buildRentals(List<Rentals>? rentals) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rentals!.map((rentalsData) {
          var startDateTime =
              DateTime.parse(rentalsData.startDate.toString()).toLocal();
          var formattedStartDate =
              DateFormat('dd MMM yyyy').format(startDateTime);
          var endDateTime =
              DateTime.parse(rentalsData.endDate.toString()).toLocal();
          var formattedEndDate = DateFormat('dd MMM yyyy').format(endDateTime);

          var extendedOn =
              DateTime.parse(rentalsData.cretedOn.toString()).toLocal();
          var formattedExtendedOn =
              DateFormat('dd MMM yyyy').format(extendedOn);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: kButtonColor,
                  ),
                  Text(
                    formattedStartDate,
                    style: const TextStyle(
                        color: kButtonColor,
                        fontFamily: kCircularStdMedium,
                        fontSize: 14),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 100,
                    width: 2,
                    decoration: BoxDecoration(
                        border: Border.all(color: kButtonColor, width: 0.8)),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          rentalsData.profilePicture != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    rentalsData.profilePicture!,
                                    fit: BoxFit.cover,
                                    height: 30,
                                    width: 30,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        "assets/images/blank_profile.png",
                                        fit: BoxFit.cover,
                                        height: 30,
                                        width: 30,
                                      );
                                    },
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    "assets/images/blank_profile.png",
                                    fit: BoxFit.cover,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                          const SizedBox(width: 5),
                          Text(
                            rentalsData.tenantName.toString(),
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdMedium,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: Get.width - 85,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Rent amount",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                            Text(
                              "\$${rentalsData.rentAmount.toString()}",
                              style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width - 85,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Extended on",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                            Text(
                              formattedExtendedOn,
                              style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: kGreenColor,
                  ),
                  Text(
                    formattedEndDate,
                    style: const TextStyle(
                        color: kGreenColor,
                        fontFamily: kCircularStdMedium,
                        fontSize: 14),
                  ),
                ],
              ),
            ]),
          );
        }).toList(),
      ),
    );
  }
}
