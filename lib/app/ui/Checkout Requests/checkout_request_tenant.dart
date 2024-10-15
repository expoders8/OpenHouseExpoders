import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controller/checkout_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class CheckoutRequestsTenantPage extends StatefulWidget {
  const CheckoutRequestsTenantPage({super.key});

  @override
  State<CheckoutRequestsTenantPage> createState() =>
      _CheckoutRequestsTenantPageState();
}

class _CheckoutRequestsTenantPageState
    extends State<CheckoutRequestsTenantPage> {
  final GetAllCheckoutTenantController getAllCheckoutTenantController =
      Get.put(GetAllCheckoutTenantController());
  bool isToggled = false;
  DateTime? dateTime;
  String formattedDate = '';

  IconData getIconFromString(String? iconName) {
    switch (iconName) {
      case 'Remove Personal Belongings':
        return Icons.inventory;
      case 'Check for Damages':
        return Icons.warning;
      case 'Return Keys':
        return Icons.key;
      case 'Swimming Pool':
        return Icons.pool;
      case 'Pay Outstanding Bills':
        return Icons.description;
      case 'Clean Room':
        return Icons.cleaning_services;
      case 'Electricity':
        return Icons.flash_on;
      case 'Comment':
        return Icons.comment;
      default:
        return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Checkout Requests",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        backgroundColor: kBackGroundColor,
      ),
      body: Obx(
        () {
          if (getAllCheckoutTenantController.isLoading.value) {
            return Container(
              color: kBackGroundColor,
              child: const Center(
                child: CircularProgressIndicator(
                  color: kSelectedIconColor,
                ),
              ),
            );
          } else {
            if (getAllCheckoutTenantController.checkoutList.isNotEmpty) {
              if (getAllCheckoutTenantController.checkoutList[0].data == null) {
                return const Center(
                  child: Text(
                    "No Requests",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                );
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  itemCount: getAllCheckoutTenantController
                      .checkoutList[0].data!.length,
                  itemBuilder: (context, index) {
                    var requestData =
                        getAllCheckoutTenantController.checkoutList[0].data!;
                    if (requestData.isNotEmpty) {
                      var data = requestData[index];

                      return data.updatedChecklist != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: kWhiteColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            child: Image.network(
                                              data.propertyImage.toString(),
                                              fit: BoxFit.cover,
                                              height: 65,
                                              width: 65,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  "assets/icons/1.png",
                                                  fit: BoxFit.cover,
                                                  height: 65,
                                                  width: 65,
                                                );
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 15.0),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: Get.width - 170,
                                                child: Text(
                                                  data.propertyName.toString(),
                                                  style: const TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize: 17,
                                                      fontFamily:
                                                          kCircularStdMedium),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                    color: kButtonColor,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  SizedBox(
                                                    width: Get.width / 2.5,
                                                    child: Text(
                                                      data.propertyAddress
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              kSecondaryPrimaryColor,
                                                          fontSize: 13,
                                                          fontFamily:
                                                              kCircularStdMedium),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        children: [
                                          ...data.updatedChecklist!
                                              .map((checklistItem) {
                                            return checklistItem.name
                                                        .toString() ==
                                                    "Comment"
                                                ? Container()
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25),
                                                                border: Border.all(
                                                                    color:
                                                                        kPrimaryColor),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        3.0),
                                                                child: Icon(
                                                                  getIconFromString(
                                                                      checklistItem
                                                                          .name),
                                                                  size: 18,
                                                                  color:
                                                                      kButtonColor,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Text(
                                                              checklistItem.name
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                fontFamily:
                                                                    kWorkSans,
                                                                fontSize: 15,
                                                                color:
                                                                    kPrimaryColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        checklistItem
                                                                    .isActive ==
                                                                true
                                                            ? Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25),
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              kGreenColor),
                                                                ),
                                                                child:
                                                                    const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              3.0),
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    size: 18,
                                                                    color:
                                                                        kGreenColor,
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25),
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              kButtonColor),
                                                                ),
                                                                child:
                                                                    const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              3.0),
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    size: 18,
                                                                    color:
                                                                        kButtonColor,
                                                                  ),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  );
                                          }).toList(),
                                          const SizedBox(height: 5),
                                          SizedBox(
                                            width: Get.width,
                                            child: Text(
                                              data.updatedChecklist!.last
                                                  .isActive!,
                                              style: const TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 15,
                                                fontFamily: kCircularStdMedium,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: kButtonColor),
                                            child: const Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  size: 11,
                                                  color: kWhiteColor,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  "Pendding",
                                                  style: TextStyle(
                                                      color: kWhiteColor,
                                                      fontSize: 11,
                                                      fontFamily:
                                                          kCircularStdNormal),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    } else {
                      return const Center(
                        child: Text(
                          "No Requests",
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
                  "No Requests",
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

  // amenitiesview() {
  //   return SizedBox(
  //     height: 350,
  //     child: ListView.builder(
  //       physics: const NeverScrollableScrollPhysics(),
  //       itemCount: 1,
  //       itemBuilder: (context, index) {
  //         var requestData =
  //             getAllCheckoutTenantController.checkoutList[0].data!;
  //         if (requestData.isNotEmpty) {
  //           var data = requestData[index];
  //           return
  //         } else {
  //           return const Center(
  //             child: Text(
  //               "No Requests",
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                   color: kPrimaryColor,
  //                   fontSize: 15,
  //                   fontFamily: kCircularStdMedium),
  //             ),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text(
  //         "Checkout Requests",
  //         style: TextStyle(fontFamily: kCircularStdBook),
  //       ),
  //       backgroundColor: kBackGroundColor,
  //     ),
  //     body: SingleChildScrollView(
  //       physics: const BouncingScrollPhysics(
  //           parent: AlwaysScrollableScrollPhysics()),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
  //         child: Column(
  //           children: [
  //             leaseproperty(
  //               "assets/icons/1.png",
  //               "Property Address",
  //               "Property Name",
  //               "Pandding",
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
