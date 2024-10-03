import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../controller/property_controller.dart';
import '../controller/property_detail_controller.dart';

class PreviousPropertyView extends StatefulWidget {
  const PreviousPropertyView({super.key});

  @override
  State<PreviousPropertyView> createState() => _PreviousPropertyViewState();
}

class _PreviousPropertyViewState extends State<PreviousPropertyView> {
  final GetPreviousPropertyController getPreviousPropertyController =
      Get.put(GetPreviousPropertyController());
  var leasesearchController = TextEditingController();
  final GetPreviousDetailsPropertiesController
      getPreviousDetailsPropertiesController =
      Get.put(GetPreviousDetailsPropertiesController());
  DateTime? dateTime;
  String formattedDate = '';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getPreviousPropertyController.isLoading.value) {
          return Container(
            color: kBackGroundColor,
            child: const Center(
              child: CircularProgressIndicator(
                color: kSelectedIconColor,
              ),
            ),
          );
        } else {
          if (getPreviousPropertyController.propertiesList.isNotEmpty) {
            if (getPreviousPropertyController.propertiesList[0].data!.isEmpty) {
              return Column(
                children: [
                  const SizedBox(height: 110),
                  Image.asset(
                    "assets/images/noproperty.png",
                    scale: 4,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "You don't have properties on lease.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: leasesearchController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(13, 0, 10, 0),
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: kWhiteColor,
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                            color: kSecondaryPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: kWhiteColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: kWhiteColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: kWhiteColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: getPreviousPropertyController
                          .propertiesList[0].data!.length,
                      itemBuilder: (context, index) {
                        var propertyData = getPreviousPropertyController
                            .propertiesList[0].data!;
                        if (propertyData.isNotEmpty) {
                          var data = propertyData[index];
                          if (data.endDate != null) {
                            dateTime = DateTime.parse(data.endDate.toString());
                            formattedDate =
                                DateFormat('dd MMM yyyy').format(dateTime!);
                          } else {
                            formattedDate = 'No Date Available';
                          }
                          getPreviousPropertyController
                              .image(data.propertyImage);
                          getPreviousPropertyController.name(data.name);
                          getPreviousPropertyController.address(data.address);
                          getPreviousPropertyController.propertyId(data.id);
                          return Column(
                            children: [
                              notLeaseProperty(
                                data.propertyImage.toString(),
                                data.name.toString(),
                                "\$ ${data.rentAmount.toString()}",
                                data.address.toString(),
                                data.person.toString(),
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.only(bottom: 35.0),
                            child: Center(
                              child: Text(
                                "You have no current leases or requests. Waiting for an invitation? Check your email for host invitations or explore properties once added.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                    fontFamily: kCircularStdMedium),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
            }
          } else {
            return const Padding(
              padding: EdgeInsets.only(bottom: 35.0),
              child: Center(
                child: Text(
                  "You have no current leases or requests. Waiting for an invitation? Check your email for host invitations or explore properties once added.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
              ),
            );
          }
        }
      },
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Flexible(
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           notLeaseProperty("assets/icons/1.png", "Main Street", "\$2550",
  //               "101 Main Street", "2"),
  //           const SizedBox(height: 15),
  //           notLeaseProperty("assets/icons/2.png", "Main Street", "\$1520",
  //               "3545 Robson St, Vancouver", "1"),
  //           const SizedBox(height: 15),
  //           notLeaseProperty("assets/icons/3.png", "Main Street", "\$1850",
  //               "224 Robson St, Vancouver", "2"),
  //           const SizedBox(height: 90)
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget notLeaseProperty(String image, name, price, address, person) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      scale: 1.2,
                      height: 95,
                      width: 95,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/samplehouse.jpeg",
                          fit: BoxFit.cover,
                          height: 95,
                          width: 95,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width - 170,
                        child: Text(
                          name,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: kPrimaryColor,
                              fontSize: 17,
                              fontFamily: kCircularStdMedium),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Icon(
                            Icons.request_page_sharp,
                            size: 16,
                            color: kButtonColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            price,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: kPrimaryColor,
                                fontSize: 17,
                                fontFamily: kCircularStdMedium),
                          ),
                        ],
                      ),
                      address == ""
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
                      // Row(
                      //   children: [
                      //     const Icon(
                      //       Icons.person,
                      //       size: 16,
                      //       color: kButtonColor,
                      //     ),
                      //     const SizedBox(width: 10),
                      //     SizedBox(
                      //       width: Get.width - 220,
                      //       child: const Text(
                      //         "Host Name",
                      //         style: TextStyle(
                      //             color: kPrimaryColor,
                      //             fontSize: 13,
                      //             fontFamily: kCircularStdMedium),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       price,
                  //       style: const TextStyle(
                  //           color: kPrimaryColor,
                  //           fontSize: 25,
                  //           fontFamily: kCircularStdMedium),
                  //     ),
                  //     Row(
                  //       children: [
                  //         const Icon(
                  //           Icons.location_on,
                  //           size: 16,
                  //           color: kButtonColor,
                  //         ),
                  //         const SizedBox(width: 10),
                  //         SizedBox(
                  //           width: Get.width / 2.5,
                  //           child: Text(
                  //             address,
                  //             style: const TextStyle(
                  //                 color: kSecondaryPrimaryColor,
                  //                 fontSize: 13,
                  //                 fontFamily: kCircularStdMedium),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         const Icon(
                  //           Icons.bed_outlined,
                  //           size: 16,
                  //           color: kButtonColor,
                  //         ),
                  //         const SizedBox(width: 10),
                  //         SizedBox(
                  //           width: Get.width - 220,
                  //           child: Text(
                  //             person,
                  //             style: const TextStyle(
                  //                 color: kPrimaryColor,
                  //                 fontSize: 13,
                  //                 fontFamily: kCircularStdBold),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     // const Row(
                  //     //   children: [
                  //     //     Icon(
                  //     //       Icons.wifi,
                  //     //       size: 16,
                  //     //       color: kSecondaryPrimaryColor,
                  //     //     ),
                  //     //     SizedBox(width: 5),
                  //     //     Icon(
                  //     //       Icons.gas_meter_rounded,
                  //     //       size: 16,
                  //     //       color: kSecondaryPrimaryColor,
                  //     //     ),
                  //     //     SizedBox(width: 5),
                  //     //     Icon(
                  //     //       Icons.electric_bolt_sharp,
                  //     //       size: 16,
                  //     //       color: kSecondaryPrimaryColor,
                  //     //     ),
                  //     //     SizedBox(width: 5),
                  //     //     Icon(
                  //     //       Icons.local_parking,
                  //     //       size: 16,
                  //     //       color: kSecondaryPrimaryColor,
                  //     //     ),
                  //     //     SizedBox(width: 5),
                  //     //     Icon(
                  //     //       Icons.nest_cam_wired_stand_sharp,
                  //     //       size: 16,
                  //     //       color: kSecondaryPrimaryColor,
                  //     //     ),
                  //     //   ],
                  //     // ),

                  //   ],
                  // )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: kWhiteColor),
                          color: kButtonColor),
                      child: const Center(
                        child: Text(
                          "Request",
                          style: TextStyle(
                              color: kWhiteColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 13),
                        ),
                      ),
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
}
