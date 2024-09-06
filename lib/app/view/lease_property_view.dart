import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller/property_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../controller/property_detail_controller.dart';

class LeasePropertyView extends StatefulWidget {
  const LeasePropertyView({super.key});

  @override
  State<LeasePropertyView> createState() => _LeasePropertyViewState();
}

class _LeasePropertyViewState extends State<LeasePropertyView> {
  final GetLeasePropertyController getLeasePropertyController =
      Get.put(GetLeasePropertyController());
  final GetDetailsPropertiesController getDetailsPropertiesController =
      Get.put(GetDetailsPropertiesController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (getLeasePropertyController.isLoading.value) {
            return Container(
              color: kBackGroundColor,
              child: const Center(
                child: CircularProgressIndicator(
                  color: kSelectedIconColor,
                ),
              ),
            );
          } else {
            // ignore: unnecessary_null_comparison
            if (getLeasePropertyController.propertiesList[0].data! != null) {
              if (getLeasePropertyController.propertiesList[0].data!.isEmpty) {
                return Center(
                  child: SizedBox(
                    width: Get.width - 80,
                    child: const Text(
                      "No Properties",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontFamily: kCircularStdMedium),
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:
                      getLeasePropertyController.propertiesList[0].data!.length,
                  itemBuilder: (context, index) {
                    var propertyData =
                        getLeasePropertyController.propertiesList[0].data!;
                    if (propertyData.isNotEmpty) {
                      var data = propertyData[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              getDetailsPropertiesController
                                  .conferanceId(data.id);
                              getDetailsPropertiesController
                                  .fetchPropertyDetail();
                            },
                            child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: kWhiteColor),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image.network(
                                            data.propertyImage.toString(),
                                            fit: BoxFit.cover,
                                            scale: 1.2,
                                            height: 120,
                                            width: 120,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                "assets/images/samplehouse.jpeg",
                                                fit: BoxFit.cover,
                                                height: 110,
                                                width: 110,
                                              );
                                            },
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.rentAmount.toString(),
                                              style: const TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 25,
                                                  fontFamily:
                                                      kCircularStdMedium),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  size: 16,
                                                  color: kButtonColor,
                                                ),
                                                const SizedBox(width: 10),
                                                SizedBox(
                                                  width: Get.width / 2.5,
                                                  child: Text(
                                                    data.addresh.toString(),
                                                    style: const TextStyle(
                                                        color:
                                                            kSecondaryPrimaryColor,
                                                        fontSize: 13,
                                                        fontFamily:
                                                            kCircularStdMedium),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  Icons.bed_outlined,
                                                  size: 16,
                                                  color: kButtonColor,
                                                ),
                                                const SizedBox(width: 10),
                                                SizedBox(
                                                  width: Get.width - 220,
                                                  child: Text(
                                                    data.person.toString(),
                                                    style: const TextStyle(
                                                        color:
                                                            kSecondaryPrimaryColor,
                                                        fontSize: 13,
                                                        fontFamily:
                                                            kCircularStdBold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.person,
                                                  size: 16,
                                                  color: kButtonColor,
                                                ),
                                                const SizedBox(width: 10),
                                                SizedBox(
                                                  width: Get.width - 220,
                                                  child: Text(
                                                    data.name.toString(),
                                                    style: const TextStyle(
                                                        color: kPrimaryColor,
                                                        fontSize: 13,
                                                        fontFamily:
                                                            kCircularStdMedium),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0,
                                          right: 5.0,
                                          top: 10,
                                          bottom: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Balance Due",
                                                style: TextStyle(
                                                    fontFamily:
                                                        kCircularStdNormal,
                                                    fontSize: 12,
                                                    color: kPrimaryColor),
                                              ),
                                              Text(
                                                "\$1500",
                                                style: TextStyle(
                                                    fontFamily:
                                                        kCircularStdMedium,
                                                    fontSize: 17,
                                                    color: kPrimaryColor),
                                              ),
                                            ],
                                          ),
                                          Image.asset(
                                            "assets/icons/line_vertical.png",
                                            fit: BoxFit.cover,
                                            scale: 1.8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Rent Due on",
                                                style: TextStyle(
                                                    fontFamily:
                                                        kCircularStdNormal,
                                                    fontSize: 12,
                                                    color: kPrimaryColor),
                                              ),
                                              Text(
                                                data.rentAmountUnit.toString(),
                                                style: const TextStyle(
                                                    fontFamily:
                                                        kCircularStdMedium,
                                                    fontSize: 17,
                                                    color: kPrimaryColor),
                                              ),
                                            ],
                                          ),
                                          Image.asset(
                                            "assets/icons/line_vertical.png",
                                            fit: BoxFit.cover,
                                            scale: 1.8,
                                          ),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "lease Expaires",
                                                style: TextStyle(
                                                    fontFamily:
                                                        kCircularStdNormal,
                                                    fontSize: 12,
                                                    color: kPrimaryColor),
                                              ),
                                              Text(
                                                "expiredate",
                                                style: TextStyle(
                                                    fontFamily:
                                                        kCircularStdMedium,
                                                    fontSize: 17,
                                                    color: kPrimaryColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "No Properties",
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
                  "No Properties",
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
}
