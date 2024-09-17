import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../controller/invitation_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';

// ignore: must_be_immutable
class TenantInvitationView extends StatefulWidget {
  const TenantInvitationView({super.key});

  @override
  State<TenantInvitationView> createState() => _TenantInvitationViewtate();
}

class _TenantInvitationViewtate extends State<TenantInvitationView> {
  final GetAllInvitationController getAllInvitationController =
      Get.put(GetAllInvitationController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getAllInvitationController.isLoading.value) {
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
          if (getAllInvitationController.invitationList.isNotEmpty &&
              getAllInvitationController.invitationList[0].data! != null) {
            if (getAllInvitationController.invitationList[0].data!.isEmpty) {
              return Container();
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      "Invitations",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontFamily: kCircularStdMedium),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getAllInvitationController
                          .invitationList[0].data!.length,
                      itemBuilder: (context, index) {
                        var requestData =
                            getAllInvitationController.invitationList[0].data!;
                        if (requestData.isNotEmpty) {
                          var data = requestData[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "You have received a house rent invitation from",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 14,
                                          fontFamily: kCircularStdNormal),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          data.name.toString(),
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: kRedColor,
                                              color: kRedColor,
                                              fontSize: 14,
                                              fontFamily: kCircularStdNormal),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          "for",
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 14,
                                              fontFamily: kCircularStdNormal),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          data.address.toString(),
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: kRedColor,
                                              color: kRedColor,
                                              fontSize: 14,
                                              fontFamily: kCircularStdNormal),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "End On 16-06-2022",
                                          style: TextStyle(
                                              color: kGreyColor,
                                              fontSize: 13,
                                              fontFamily: kCircularStdNormal),
                                        ),
                                        Row(
                                          children: [
                                            CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: kGreenColor,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: const Icon(
                                                  Icons.check,
                                                  color: kGreenColor,
                                                  size: 19,
                                                ),
                                              ),
                                            ),
                                            CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {
                                                invitationDialog();
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xFFFF1100),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFF1100),
                                                  size: 19,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          );
                        } else {
                          return const Center(
                            child: Text(
                              "No Invitatios",
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
                  ],
                ),
              );
            }
          } else {
            return const Center(
              child: Text(
                "No Invitations",
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

  invitationDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert !"),
        elevation: 5,
        titleTextStyle: const TextStyle(fontSize: 18, color: kRedColor),
        content: const Text("Are you sure want to reject?"),
        contentPadding: const EdgeInsets.only(left: 25, top: 10),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Get.back();
            },
            child: const Text(
              'Yes',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'No',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
