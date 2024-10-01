import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../controller/tenants_controller.dart';
import '../controller/property_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../controller/property_detail_controller.dart';
import '../ui/Property Details/not_lease_property_details.dart';

class NotLeasePropertyView extends StatefulWidget {
  const NotLeasePropertyView({super.key});

  @override
  State<NotLeasePropertyView> createState() => _NotLeasePropertyViewState();
}

class _NotLeasePropertyViewState extends State<NotLeasePropertyView> {
  final GetAvailablePropertyController getAvailablePropertyController =
      Get.put(GetAvailablePropertyController());
  var notleasesearchController = TextEditingController();
  final GetnotleaseDetailsPropertiesController
      getnotleaseDetailsPropertiesController =
      Get.put(GetnotleaseDetailsPropertiesController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getAvailablePropertyController.isLoading.value) {
          return Container(
            color: kBackGroundColor,
            child: const Center(
              child: CircularProgressIndicator(
                color: kSelectedIconColor,
              ),
            ),
          );
        } else {
          if (getAvailablePropertyController.propertiesList.isNotEmpty) {
            if (getAvailablePropertyController
                .propertiesList[0].data!.isEmpty) {
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
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: notleasesearchController,
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
                      itemCount: getAvailablePropertyController
                          .propertiesList[0].data!.length,
                      itemBuilder: (context, index) {
                        var propertyData = getAvailablePropertyController
                            .propertiesList[0].data!;
                        if (propertyData.isNotEmpty) {
                          var data = propertyData[index];
                          // String dateStartString = data.startDate.toString();
                          // String dateEndString = data.endDate.toString();
                          // DateTime myDateStartTime =
                          //     DateTime.parse(dateStartString);
                          // DateTime myDateEndTime = DateTime.parse(dateEndString);
                          // String startTime =
                          //   DateFormat('hh:mm a').format(myDateStartTime);
                          // String endTime =
                          //     DateFormat('hh:mm a').format(myDateEndTime);
                          return notLeaseProperty(
                              data.propertyImage.toString(),
                              data.rentAmount.toString(),
                              data.address.toString(),
                              data.person.toString(),
                              data.name.toString(),
                              data.id.toString());
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
                    ),
                  ),
                ],
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
    );
  }

  notLeaseProperty(String image, price, address, person, name, id) {
    final GetAllTenantController getAllTenantController =
        Get.put(GetAllTenantController());
    return Column(
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              getAllTenantController.propertyId.value = id;
              getAllTenantController.propertyName.value = name;
              getAllTenantController.propertyAddress.value = address;
              getAllTenantController.propertyImage.value = image;
            });
            getnotleaseDetailsPropertiesController.propertyId(id);
            getnotleaseDetailsPropertiesController.fetchPropertyDetail();
            Get.to(() => const NotLeasePropertyDetailPage());
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
                                price,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: kPrimaryColor,
                                    fontSize: 17,
                                    fontFamily: kCircularStdMedium),
                              ),
                            ],
                          ),
                          address != "" && address != "null"
                              ? Row(
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
                                )
                              : Container(),
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
                                      color: kPrimaryColor,
                                      fontSize: 13,
                                      fontFamily: kCircularStdBold),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.wifi,
                                size: 16,
                                color: kSecondaryPrimaryColor,
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.gas_meter_rounded,
                                size: 16,
                                color: kSecondaryPrimaryColor,
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.electric_bolt_sharp,
                                size: 16,
                                color: kSecondaryPrimaryColor,
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.local_parking,
                                size: 16,
                                color: kSecondaryPrimaryColor,
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.nest_cam_wired_stand_sharp,
                                size: 16,
                                color: kSecondaryPrimaryColor,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
