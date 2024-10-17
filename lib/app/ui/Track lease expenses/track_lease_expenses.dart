import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../controller/property_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class TrackLeaseExpensesPage extends StatefulWidget {
  const TrackLeaseExpensesPage({super.key});

  @override
  State<TrackLeaseExpensesPage> createState() => _TrackLeaseExpensesPageState();
}

class _TrackLeaseExpensesPageState extends State<TrackLeaseExpensesPage> {
  final GetAllPropertyExpensesController getAllPropertyExpensesController =
      Get.put(GetAllPropertyExpensesController());

  @override
  void initState() {
    getAllPropertyExpensesController.getAllExpenses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Property Service Expense"),
      ),
      body: Obx(
        () {
          if (getAllPropertyExpensesController.isLoading.value) {
            return Container(
              color: kBackGroundColor,
              child: const Center(
                child: CircularProgressIndicator(
                  color: kSelectedIconColor,
                ),
              ),
            );
          } else {
            if (getAllPropertyExpensesController.expensetList.isNotEmpty) {
              if (getAllPropertyExpensesController
                  .expensetList[0].data!.isEmpty) {
                return const Center(
                  child: Text(
                    "No Expense",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                );
              } else {
                return Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: getAllPropertyExpensesController
                            .expensetList[0].data!.length,
                        itemBuilder: (context, index) {
                          var requestData = getAllPropertyExpensesController
                              .expensetList[0].data!;
                          if (requestData.isNotEmpty) {
                            var data = requestData[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: Column(
                                children: [
                                  leaseproperty(
                                      data.propertyImage.toString(),
                                      data.propertyAddress.toString(),
                                      data.propertyName.toString(),
                                      data.rentals!)
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text(
                                "No Expense",
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
                  "No Expense",
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

  leaseproperty(String image, address, name, List amenitiesList) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  image != "null"
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                            scale: 1.2,
                            height: 65,
                            width: 65,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/noproperty.png",
                                fit: BoxFit.cover,
                                height: 65,
                                width: 65,
                              );
                            },
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            "assets/images/blank_profile.png",
                            fit: BoxFit.cover,
                            scale: 1.2,
                            height: 70,
                            width: 70,
                          ),
                        ),
                  const SizedBox(width: 15.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      SizedBox(height: address.toString() == "null" ? 0 : 5),
                      address.toString() == "null"
                          ? Container()
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                    address.toString(),
                                    style: const TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 13,
                                        fontFamily: kCircularStdMedium),
                                    overflow: TextOverflow.ellipsis,
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
              amenitiesList.isNotEmpty
                  ? Column(
                      children: amenitiesList.map((amenity) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                amenity.title[0].toUpperCase() +
                                    amenity.title.substring(1),
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                    fontFamily: kCircularStdMedium),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                "\$ ${amenity.price}",
                                style: const TextStyle(
                                    color: kRedColor,
                                    fontSize: 15,
                                    fontFamily: kCircularStdMedium),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
