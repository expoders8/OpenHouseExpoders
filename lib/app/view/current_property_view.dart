import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../controller/payment_controller.dart';
import '../controller/property_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../controller/property_detail_controller.dart';
import '../ui/Property Details/Tenant/tenant_lease_property.dart';

class CurrentPropertyView extends StatefulWidget {
  const CurrentPropertyView({super.key});

  @override
  State<CurrentPropertyView> createState() => _CurrentPropertyViewState();
}

class _CurrentPropertyViewState extends State<CurrentPropertyView> {
  DateTime? dateTime;
  String formattedDate = '';
  TextEditingController leasesearchController = TextEditingController();
  final GetCurrentPropertyController getCurrentPropertyController =
      Get.put(GetCurrentPropertyController());
  final GetCurrentDetailsPropertiesController
      getCurrentDetailsPropertiesController =
      Get.put(GetCurrentDetailsPropertiesController());
  final PropertyCheckoutController propertyCheckoutController =
      Get.put(PropertyCheckoutController());
  final GetAllPaymentDataController getAllPaymentDataController =
      Get.put(GetAllPaymentDataController());

  Future<void> _refreshItems() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      getCurrentPropertyController.fetchAllProperties();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getCurrentPropertyController.isLoading.value) {
          return Container(
            color: kBackGroundColor,
            child: const Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            ),
          );
        } else {
          if (getCurrentPropertyController.trtrrtrt.isNotEmpty &&
              getCurrentPropertyController.trtrrtrt[0].data != null) {
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
                  child: RefreshIndicator(
                    onRefresh: _refreshItems,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        var propertyData =
                            getCurrentPropertyController.trtrrtrt[0].data!;
                        propertyCheckoutController
                            .propertyId(propertyData.propertyId);
                        propertyCheckoutController.rentalId(propertyData.id);
                        propertyCheckoutController
                            .proeprtyAddress(propertyData.address);
                        propertyCheckoutController
                            .propertyName(propertyData.name);
                        propertyCheckoutController
                            .rentAmount(propertyData.rentAmount);
                        if (propertyData.endDate != null) {
                          dateTime =
                              DateTime.parse(propertyData.endDate.toString())
                                  .toLocal();
                          formattedDate =
                              DateFormat('dd MMM yyyy').format(dateTime!);
                        } else {
                          formattedDate = 'No Date Available';
                        }
                        getCurrentPropertyController
                            .image(propertyData.propertyImage);
                        getCurrentPropertyController.name(propertyData.name);
                        getCurrentPropertyController
                            .address(propertyData.address);
                        getCurrentPropertyController
                            .propertyId(propertyData.propertyId);
                        return Column(
                          children: [
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                getCurrentDetailsPropertiesController
                                    .propertyId(propertyData.propertyId);
                                getAllPaymentDataController.rentAmount(
                                    propertyData.rentAmount.toString());
                                getAllPaymentDataController
                                    .propertyId(propertyData.id.toString());

                                Get.to(() =>
                                    const TenantLeasePropertyDetailPage());
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
                                              propertyData.propertyImage
                                                  .toString(),
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
                                                  propertyData.name.toString(),
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
                                                    "\$ ${propertyData.rentAmount.toString()}",
                                                    style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: kPrimaryColor,
                                                        fontSize: 17,
                                                        fontFamily:
                                                            kCircularStdMedium),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  height: propertyData.address
                                                              .toString() ==
                                                          "null"
                                                      ? 0
                                                      : 5),
                                              propertyData.address.toString() ==
                                                      "null"
                                                  ? Container()
                                                  : Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on,
                                                          size: 16,
                                                          color: kButtonColor,
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        SizedBox(
                                                          width:
                                                              Get.width / 2.5,
                                                          child: Text(
                                                            propertyData.address
                                                                .toString(),
                                                            style: const TextStyle(
                                                                color:
                                                                    kSecondaryPrimaryColor,
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    kCircularStdMedium),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
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
                                                      propertyData.person
                                                          .toString(),
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
                                                  propertyData.rentAmountUnit
                                                              .toString() ==
                                                          "null"
                                                      ? "\$0"
                                                      : propertyData
                                                          .rentAmountUnit
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
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "Lease expiry",
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
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  "assets/images/noproperty1.png",
                  fit: BoxFit.cover,
                  scale: 2.3,
                ),
                const Text(
                  "You have no current leases or requests. Waiting for an invitation? Check your email for host invitations or\nexplore properties once added.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
                CupertinoButton(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1, color: kButtonColor)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            "Explore more",
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 17),
                          )),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_right_alt,
                            size: 25,
                            color: kPrimaryColor,
                          )
                        ],
                      ),
                    ),
                    onPressed: () {
                      _refreshItems();
                      // Get.offAll(() => const TabPage(
                      //       selectedTabIndex: 1,
                      //     ));
                    }),
              ],
            );
          }
        }
      },
    );
  }
}
