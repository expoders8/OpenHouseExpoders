import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../controller/housekeeeper_controller.dart';
import '../../ui/Add Housekeeper/add_housekeeper.dart';

class HouseKeeperView extends StatefulWidget {
  final String? propertyId;
  const HouseKeeperView({super.key, this.propertyId});

  @override
  State<HouseKeeperView> createState() => _HouseKeeperViewState();
}

class _HouseKeeperViewState extends State<HouseKeeperView> {
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
              return Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    const Text(
                      "No Housekeeper",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontFamily: kCircularStdMedium),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 150,
                      child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          borderRadius: BorderRadius.circular(15),
                          color: kButtonColor,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: kWhiteColor,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Add Now",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            Get.to(() => AddHousekeeperPage(
                                  propertyId: widget.propertyId.toString(),
                                ));
                          }),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 40,
                                child: CupertinoButton(
                                    borderRadius: BorderRadius.circular(15),
                                    padding: EdgeInsets.zero,
                                    color: kButtonColor,
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Text(
                                        "Remove",
                                        style: TextStyle(
                                            color: kWhiteColor,
                                            fontFamily: kCircularStdNormal,
                                            fontSize: 12),
                                      ),
                                    ),
                                    onPressed: () {}),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: kButtonColor),
                                    borderRadius: BorderRadius.circular(15)),
                                height: 40,
                                child: CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    borderRadius: BorderRadius.circular(15),
                                    color: kBackGroundColor,
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: Text(
                                        "Add",
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontFamily: kCircularStdNormal,
                                            fontSize: 12),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.to(() => AddHousekeeperPage(
                                            propertyId:
                                                data.propertyId.toString(),
                                          ));
                                    }),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (index == 1)
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Text(
                                  "Previous Housekeeper",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 14,
                                    fontFamily: kCircularStdMedium,
                                  ),
                                ),
                                Divider(),
                                SizedBox(height: 5),
                              ],
                            ),
                          previoushousekeeperhistory(
                            "${data.firstName} ${data.lastName}",
                            data.phoneNumber,
                            data.email,
                          )
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
                  SizedBox(
                    width: Get.width - 120,
                    child: Text(
                      name,
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontFamily: kCircularStdMedium),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
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

  previoushousekeeperhistory(String name, phoneNo, email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
            const SizedBox(width: 10),
            SizedBox(
              width: Get.width - 36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        ],
                      ),
                    ],
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Text(
                      "Assign",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: kCircularStdNormal,
                          fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
