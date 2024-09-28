import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:openhome/app/ui/TabPage/tab_page.dart';

import '../controller/property_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../controller/property_detail_controller.dart';
import '../controller/tab_controller.dart';
import '../ui/Property Details/Tenant/tenant_lease_property.dart';

class CurrentPropertyView extends StatefulWidget {
  const CurrentPropertyView({super.key});

  @override
  State<CurrentPropertyView> createState() => _CurrentPropertyViewState();
}

class _CurrentPropertyViewState extends State<CurrentPropertyView> {
  final GetCurrentPropertyController getCurrentPropertyController =
      Get.put(GetCurrentPropertyController());
  final GetCurrentDetailsPropertiesController
      getCurrentDetailsPropertiesController =
      Get.put(GetCurrentDetailsPropertiesController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Obx(
        () {
          if (getCurrentPropertyController.isLoading.value) {
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
            if (getCurrentPropertyController.propertiesList[0].data! != null) {
              if (getCurrentPropertyController
                  .propertiesList[0].data!.isEmpty) {
                return Column(
                  children: [
                    const SizedBox(height: 150),
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
                    CupertinoButton(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(width: 1, color: kButtonColor)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                "Start now",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 18),
                              )),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_right_alt,
                                size: 35,
                                color: kPrimaryColor,
                              )
                            ],
                          ),
                        ),
                        onPressed: () {
                          // Get.offAll(() => const TabPage(
                          //       selectedTabIndex: 1,
                          //     ));
                        }),
                  ],
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: getCurrentPropertyController
                      .propertiesList[0].data!.length,
                  itemBuilder: (context, index) {
                    var propertyData =
                        getCurrentPropertyController.propertiesList[0].data!;
                    if (propertyData.isNotEmpty) {
                      var data = propertyData[index];
                      getCurrentPropertyController.image(data.propertyImage);
                      getCurrentPropertyController.name(data.name);
                      getCurrentPropertyController.address(data.address);
                      getCurrentPropertyController.propertyId(data.id);
                      return Column(
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              getCurrentDetailsPropertiesController
                                  .propertyId(data.id);
                              Get.to(
                                  () => const TenantLeasePropertyDetailPage());
                              getCurrentDetailsPropertiesController
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
                                                data.rentAmountUnit
                                                            .toString() ==
                                                        "null"
                                                    ? "\$0"
                                                    : data.rentAmountUnit
                                                        .toString(),
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
                          "You have no current leases or requests. Waiting for an invitation? Check your email for host invitations or explore properties once added.",
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
                  "You have no current leases or requests. Waiting for an invitation? Check your email for host invitations or explore properties once added.",
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