import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:openhome/app/ui/Property%20Details/Tenant/tenant_lease_property.dart';

import '../../config/constant/constant.dart';
import '../controller/property_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../controller/property_detail_controller.dart';
import '../ui/Property Details/lease_property_details.dart';

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

  String selectedRoll = "";

  @override
  void initState() {
    super.initState();
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
    });
  }

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
                      "No leases available yet. You can manage leases once invited by a host or add a lease to start tracking your rentals.",
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
                      DateTime dateTime =
                          DateTime.parse(data.endDate.toString());
                      String formattedDate =
                          DateFormat('dd MMM yyyy').format(dateTime);
                      return Column(
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              getDetailsPropertiesController
                                  .propertyId(data.id);

                              getDetailsPropertiesController
                                  .fetchPropertyDetail();
                              Get.to(() => const LeasePropertyDetailPage());
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
                                            height: 110,
                                            width: 110,
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
                                            SizedBox(
                                              width: Get.width - 170,
                                              child: Text(
                                                data.name.toString(),
                                                style: const TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: kPrimaryColor,
                                                    fontSize: 17,
                                                    fontFamily:
                                                        kCircularStdMedium),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.request_page_sharp,
                                                  size: 16,
                                                  color: kButtonColor,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  data.rentAmount.toString(),
                                                  style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: kPrimaryColor,
                                                      fontSize: 17,
                                                      fontFamily:
                                                          kCircularStdMedium),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    data.address.toString() ==
                                                            "null"
                                                        ? 0
                                                        : 5),
                                            data.address.toString() == "null"
                                                ? Container()
                                                : Row(
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
                                                          data.address
                                                              .toString(),
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
                                            const SizedBox(height: 5),
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
                                                    fontSize: 16,
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
                                                data.rentAmountUnit
                                                            .toString() ==
                                                        "null"
                                                    ? "\$0"
                                                    : data.rentAmountUnit
                                                        .toString(),
                                                style: const TextStyle(
                                                    fontFamily:
                                                        kCircularStdMedium,
                                                    fontSize: 16,
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
                                                "Lease expairy",
                                                style: TextStyle(
                                                    fontFamily:
                                                        kCircularStdNormal,
                                                    fontSize: 12,
                                                    color: kPrimaryColor),
                                              ),
                                              Text(
                                                formattedDate,
                                                style: const TextStyle(
                                                    fontFamily:
                                                        kCircularStdMedium,
                                                    fontSize: 16,
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
                          "No leases available yet. You can manage leases once invited by a host or add a lease to start tracking your rentals.",
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
                  "No leases available yet. You can manage leases once invited by a host or add a lease to start tracking your rentals.",
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
