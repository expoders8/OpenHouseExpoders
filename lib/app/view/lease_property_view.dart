import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller/property_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../ui/Property Details/lease_property_details.dart';

class LeasePropertyView extends StatefulWidget {
  const LeasePropertyView({super.key});

  @override
  State<LeasePropertyView> createState() => _LeasePropertyViewState();
}

class _LeasePropertyViewState extends State<LeasePropertyView> {
  final GetLeasePropertyController getLeasePropertyController =
      Get.put(GetLeasePropertyController());
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
                      // String dateStartString = data.startDate.toString();
                      // String dateEndString = data.endDate.toString();
                      // DateTime myDateStartTime =
                      //     DateTime.parse(dateStartString);
                      // DateTime myDateEndTime = DateTime.parse(dateEndString);

                      // String startTime =
                      //     DateFormat('hh:mm a').format(myDateStartTime);
                      // String endTime =
                      //     DateFormat('hh:mm a').format(myDateEndTime);
                      return Column(
                        children: [
                          leaseproperty(
                              data.profilePicture.toString(),
                              data.rentAmount.toString(),
                              "${data.addresh} ${data.address1}",
                              data.person.toString(),
                              data.name.toString(),
                              "\$10,105",
                              "\$108",
                              "25-06-2021"),
                          const SizedBox(height: 10)
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

leaseproperty(String image, price, address, person, tenantname, balancedue,
    rentdue, expiredate) {
  return GestureDetector(
    onTap: () {
      Get.to(() => const LeasePropertyDetailPage());
    },
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: kWhiteColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    scale: 1.2,
                    height: 120,
                    width: 120,
                    errorBuilder: (context, error, stackTrace) {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 25,
                          fontFamily: kCircularStdMedium),
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
                            address,
                            style: const TextStyle(
                                color: kSecondaryPrimaryColor,
                                fontSize: 13,
                                fontFamily: kCircularStdMedium),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            person,
                            style: const TextStyle(
                                color: kSecondaryPrimaryColor,
                                fontSize: 13,
                                fontFamily: kCircularStdBold),
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
                            tenantname,
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 13,
                                fontFamily: kCircularStdMedium),
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
                  left: 5.0, right: 5.0, top: 10, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Balance Due",
                        style: TextStyle(
                            fontFamily: kCircularStdNormal,
                            fontSize: 12,
                            color: kPrimaryColor),
                      ),
                      Text(
                        balancedue,
                        style: const TextStyle(
                            fontFamily: kCircularStdMedium,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Rent Due on",
                        style: TextStyle(
                            fontFamily: kCircularStdNormal,
                            fontSize: 12,
                            color: kPrimaryColor),
                      ),
                      Text(
                        rentdue,
                        style: const TextStyle(
                            fontFamily: kCircularStdMedium,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "lease Expaires",
                        style: TextStyle(
                            fontFamily: kCircularStdNormal,
                            fontSize: 12,
                            color: kPrimaryColor),
                      ),
                      Text(
                        expiredate,
                        style: const TextStyle(
                            fontFamily: kCircularStdMedium,
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
  );
}
