import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../routes/app_pages.dart';
import '../controller/request_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';

class MyRequestView extends StatefulWidget {
  const MyRequestView({super.key});

  @override
  State<MyRequestView> createState() => _MyRequestViewState();
}

class _MyRequestViewState extends State<MyRequestView> {
  final GetAllRequestsController getAllRequestsController =
      Get.put(GetAllRequestsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getAllRequestsController.isLoading.value) {
          return Container(
            color: kBackGroundColor,
            child: const Center(
              child: CircularProgressIndicator(
                color: kSelectedIconColor,
              ),
            ),
          );
        } else {
          if (getAllRequestsController.requestList.isNotEmpty) {
            if (getAllRequestsController.requestList[0].data!.isEmpty) {
              return Container();
            } else {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "My Requests",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontFamily: kCircularStdMedium),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          Get.toNamed(Routes.myRequestViewAllView);
                        },
                        child: const Text(
                          "View all",
                          style: TextStyle(
                              color: kBlueColor,
                              fontSize: 13,
                              fontFamily: kCircularStdMedium),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 204,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          getAllRequestsController.requestList[0].data!.length,
                      itemBuilder: (context, index) {
                        var requestData =
                            getAllRequestsController.requestList[0].data!;
                        if (requestData.isNotEmpty) {
                          var data = requestData[index];
                          DateTime dateTime =
                              DateTime.parse(data.startDate.toString());
                          String formattedDate =
                              DateFormat('dd MMM yyyy').format(dateTime);
                          return Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Container(
                                  width: Get.width - 150,
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              data.title
                                                      .toString()
                                                      .substring(0, 1)
                                                      .toUpperCase() +
                                                  data.title
                                                      .toString()
                                                      .substring(1),
                                              style: const TextStyle(
                                                  fontFamily:
                                                      kCircularStdMedium,
                                                  fontSize: 18,
                                                  color: kPrimaryColor),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15,
                                              color: kButtonColor,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.arrow_forward_rounded,
                                              size: 16,
                                              color: kButtonColor,
                                            ),
                                            const SizedBox(width: 10),
                                            SizedBox(
                                              width: Get.width - 220,
                                              child: Text(
                                                data.description.toString(),
                                                style: const TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 13,
                                                    fontFamily:
                                                        kCircularStdBold),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        data.address.toString() != "null"
                                            ? Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                    color: kButtonColor,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  SizedBox(
                                                    width: Get.width - 220,
                                                    child: Text(
                                                      data.address.toString(),
                                                      style: const TextStyle(
                                                          color: kPrimaryColor,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              kCircularStdNormal),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Container(),
                                        const SizedBox(height: 5),
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
                                                data.username.toString(),
                                                style: const TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 13,
                                                    fontFamily:
                                                        kCircularStdNormal),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.date_range_outlined,
                                              size: 16,
                                              color: kButtonColor,
                                            ),
                                            const SizedBox(width: 10),
                                            SizedBox(
                                              width: Get.width - 220,
                                              child: Text(
                                                formattedDate,
                                                style: const TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 13,
                                                    fontFamily:
                                                        kCircularStdNormal),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            data.type.toString() != "normal"
                                                ? Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 5,
                                                        vertical: 3),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        color: kButtonColor),
                                                    child: const Row(
                                                      children: [
                                                        Icon(
                                                          Icons.warning,
                                                          size: 11,
                                                          color: kWhiteColor,
                                                        ),
                                                        SizedBox(width: 5),
                                                        Text(
                                                          "Emergency",
                                                          style: TextStyle(
                                                              color:
                                                                  kWhiteColor,
                                                              fontSize: 9,
                                                              fontFamily:
                                                                  kCircularStdNormal),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Container(),
                                            CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              child: Container(
                                                height: 30,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    border: Border.all(
                                                        color: kWhiteColor),
                                                    color: kPrimaryColor),
                                                child: Center(
                                                  child: Text(
                                                    data.status.toString(),
                                                    style: const TextStyle(
                                                        color: kWhiteColor,
                                                        fontFamily:
                                                            kCircularStdNormal,
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
                              ),
                            ],
                          );
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
                    ),
                  ),
                ],
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
    );
  }
}
