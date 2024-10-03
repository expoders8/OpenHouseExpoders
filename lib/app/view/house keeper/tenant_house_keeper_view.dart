import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../controller/housekeeeper_controller.dart';

class TenantHouseKeeperView extends StatefulWidget {
  final String? propertyId;
  const TenantHouseKeeperView({super.key, this.propertyId});

  @override
  State<TenantHouseKeeperView> createState() => _TenantHouseKeeperViewState();
}

class _TenantHouseKeeperViewState extends State<TenantHouseKeeperView> {
  final GetAllHouseKeeperController getAllHouseKeeperController =
      Get.put(GetAllHouseKeeperController());
  @override
  void initState() {
    getAllHouseKeeperController.propertyId(widget.propertyId.toString());
    getAllHouseKeeperController.getAllHousekeepers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getAllHouseKeeperController.isLoading.value) {
          return Container();
        } else {
          if (getAllHouseKeeperController.requestList.isNotEmpty) {
            if (getAllHouseKeeperController.requestList[0].data!.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Text(
                      "No Housekeeper",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontFamily: kCircularStdMedium),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    getAllHouseKeeperController.requestList[0].data!.length,
                itemBuilder: (context, index) {
                  var requestData =
                      getAllHouseKeeperController.requestList[0].data!;
                  if (requestData.isNotEmpty) {
                    var data = requestData[index];
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Current Housekeeper",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontFamily: kCircularStdMedium,
                            ),
                          ),
                          const Divider(),
                          const SizedBox(height: 5),
                          housekeeperhistory(
                            "${data.firstName} ${data.lastName}",
                            data.phoneNumber,
                            data.email,
                          ),
                        ],
                      );
                    }
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Center(
                        child: Text(
                          "No Housekeeper",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontFamily: kCircularStdMedium,
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            }
          } else {
            return const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(
                child: Text(
                  "No Housekeeper",
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

  housekeeperhistory(String name, phoneNo, email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(100),
              //   child: Image.asset(
              //     "assets/icons/boy 2.png",
              //     fit: BoxFit.cover,
              //     height: 40,
              //     width: 40,
              //   ),
              // ),
              // const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 15,
                            color: kButtonColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            phoneNo,
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 11,
                                fontFamily: kCircularStdNormal),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.email,
                            size: 15,
                            color: kButtonColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            email,
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 11,
                                fontFamily: kCircularStdNormal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
