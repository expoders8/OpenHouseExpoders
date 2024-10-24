import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../controller/tenants_controller.dart';
import '../controller/property_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../controller/property_detail_controller.dart';
import '../ui/Property Details/Host/not_lease_property_details.dart';

class NotLeasePropertyView extends StatefulWidget {
  const NotLeasePropertyView({super.key});

  @override
  State<NotLeasePropertyView> createState() => _NotLeasePropertyViewState();
}

class _NotLeasePropertyViewState extends State<NotLeasePropertyView> {
  TextEditingController notleasesearchController = TextEditingController();
  final GetnotleaseDetailsPropertiesController
      getnotleaseDetailsPropertiesController =
      Get.put(GetnotleaseDetailsPropertiesController());
  final GetAvailablePropertyController getAvailablePropertyController =
      Get.put(GetAvailablePropertyController());

  Future<void> _refreshItems() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      getAvailablePropertyController.fetchAllProperties();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getAvailablePropertyController.isLoading.value) {
          return Container(
            color: kBackGroundColor,
            child: const Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            ),
          );
        } else {
          if (getAvailablePropertyController.propertiesList.isNotEmpty) {
            if (getAvailablePropertyController
                .propertiesList[0].data!.isEmpty) {
              return Column(
                children: [
                  const SizedBox(height: 150),
                  Image.asset(
                    "assets/house101.png",
                    fit: BoxFit.cover,
                    scale: 2,
                  ),
                  const Text(
                    "No properties available!",
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
                    child: RefreshIndicator(
                      onRefresh: _refreshItems,
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
                                data.id.toString(),
                                data.amenitys!);
                          } else {
                            return Column(
                              children: [
                                const SizedBox(height: 150),
                                Image.asset(
                                  "assets/house101.png",
                                  fit: BoxFit.cover,
                                  scale: 2,
                                ),
                                const Text(
                                  "No properties available",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 15,
                                      fontFamily: kCircularStdMedium),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          } else {
            return Column(
              children: [
                const SizedBox(height: 150),
                Image.asset(
                  "assets/house101.png",
                  fit: BoxFit.cover,
                  scale: 2,
                ),
                const Text(
                  "No properties available",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
              ],
            );
          }
        }
      },
    );
  }

  IconData getIconFromString(String? iconName) {
    switch (iconName) {
      case 'electricity-icon.png':
        return Icons.electric_bolt;
      case 'parking-icon.png':
        return Icons.local_parking_outlined;
      case 'pool-icon.png':
        return Icons.pool;
      case 'house-icon.png':
        return Icons.clean_hands;
      case 'Icons.description':
        return Icons.description;
      case 'Icons.cleaning_services':
        return Icons.cleaning_services;
      case 'Icons.flash_on':
        return Icons.flash_on;
      default:
        return Icons.help;
    }
  }

  notLeaseProperty(
      String image, price, address, person, name, id, List amenities) {
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
              getAllTenantController.rentAmount.value = price;
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
                          height: 100,
                          width: 95,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/images/samplehouse.jpeg",
                              fit: BoxFit.cover,
                              height: 100,
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
                                  color: kPrimaryColor,
                                  fontSize: 17,
                                  fontFamily: kCircularStdMedium),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "\$ $price",
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: kButtonColor,
                                fontSize: 15,
                                fontFamily: kCircularStdMedium),
                          ),
                          SizedBox(
                              height:
                                  address != "" && address != "null" ? 3 : 0),
                          address != "" && address != "null"
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 16,
                                      color: kButtonColor,
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: Get.width - 185,
                                      child: Text(
                                        address,
                                        style: const TextStyle(
                                            color: kSecondaryPrimaryColor,
                                            fontSize: 13,
                                            fontFamily: kCircularStdMedium),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                          const SizedBox(height: 3),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.bed_outlined,
                                size: 16,
                                color: kButtonColor,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                person,
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 13,
                                    fontFamily: kCircularStdBold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          SizedBox(
                            width: Get.width - 200,
                            height: 20,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: amenities.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Icon(
                                      getIconFromString(amenities[index].icon),
                                      size: 18,
                                      color: kSecondaryPrimaryColor,
                                    ),
                                    const SizedBox(width: 5),
                                  ],
                                );
                              },
                            ),
                          )
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
