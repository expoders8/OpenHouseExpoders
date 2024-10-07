import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../../config/provider/loader_provider.dart';
import '../controller/checkout_controller.dart';
import '../services/checkout_service.dart';

class CheckOutRequestView extends StatefulWidget {
  const CheckOutRequestView({super.key});

  @override
  State<CheckOutRequestView> createState() => _CheckOutRequestViewState();
}

class _CheckOutRequestViewState extends State<CheckOutRequestView> {
  final GetAllCheckoutController getAllCheckoutController =
      Get.put(GetAllCheckoutController());
  CheckoutService checkoutService = CheckoutService();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getAllCheckoutController.isLoading.value) {
          return Container();
        } else {
          if (getAllCheckoutController.checkoutList.isNotEmpty) {
            if (getAllCheckoutController.checkoutList[0].data!.isEmpty) {
              return const Center(
                child: Text(
                  "No request",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount:
                    getAllCheckoutController.checkoutList[0].data!.length,
                itemBuilder: (context, index) {
                  var requestData =
                      getAllCheckoutController.checkoutList[0].data!;
                  if (requestData.isNotEmpty) {
                    var data = requestData[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
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
                            Row(
                              children: [
                                data.profilePicture != null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          data.profilePicture!,
                                          fit: BoxFit.cover,
                                          scale: 1.2,
                                          height: 40,
                                          width: 40,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              "assets/images/blank_profile.png",
                                              fit: BoxFit.cover,
                                              height: 40,
                                              width: 40,
                                            );
                                          },
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.asset(
                                          "assets/images/blank_profile.png",
                                          fit: BoxFit.cover,
                                          height: 65,
                                          width: 65,
                                        ),
                                      ),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(50),
                                //   child: Image.asset(
                                //     "image",
                                //     fit: BoxFit.cover,
                                //     scale: 1.2,
                                //     height: 40,
                                //     width: 40,
                                //   ),
                                // ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.username.toString(),
                                      style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 12,
                                          fontFamily: kCircularStdMedium),
                                    ),
                                    Text(
                                      data.phoneNumber.toString(),
                                      style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 10,
                                          fontFamily: kCircularStdMedium),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "You have received a house Checkout Request from",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdNormal),
                            ),
                            Row(
                              children: [
                                Text(
                                  data.address.toString(),
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: kRedColor,
                                      color: kRedColor,
                                      fontSize: 14,
                                      fontFamily: kCircularStdNormal),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: _bottomSheetForChackout,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: kButtonColor,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.question_mark,
                                              color: kWhiteColor,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Text(
                                        "CheckOut Checklist",
                                        style: TextStyle(
                                            color: kButtonColor,
                                            fontSize: 13,
                                            fontFamily: kCircularStdMedium),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        checkoutService
                                            .acceptCheckoutInvitation(
                                                data.id.toString(),
                                                data.name.toString(),
                                                data.address.toString(),
                                                data.propertyId.toString());
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: kGreenColor, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(25)),
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
                                        invitationDialog(
                                            data.id.toString(),
                                            data.name.toString(),
                                            data.address.toString());
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xFFFF1100),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(25)),
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
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text(
                        "No request",
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
                "No request",
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

  _bottomSheetForChackout() {
    return showModalBottomSheet<dynamic>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: kWhiteColor,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            const Center(
              child: ImageIcon(
                AssetImage("assets/icons/line.png"),
                size: 30,
                color: Color(0XffBFC5CC),
              ),
            ),
            Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: kPrimaryColor)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.electric_bolt_sharp,
                                      size: 18,
                                      color: kButtonColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Electricity",
                                  style: TextStyle(
                                    fontFamily: kWorkSans,
                                    fontSize: 15,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: kGreenColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.check,
                                  size: 18,
                                  color: kGreenColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: kPrimaryColor)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.gas_meter_sharp,
                                      size: 18,
                                      color: kButtonColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Gas",
                                  style: TextStyle(
                                    fontFamily: kWorkSans,
                                    fontSize: 15,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: kButtonColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.close,
                                  size: 18,
                                  color: kButtonColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: kPrimaryColor)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.water,
                                      size: 18,
                                      color: kButtonColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Pipe Fitting",
                                  style: TextStyle(
                                    fontFamily: kWorkSans,
                                    fontSize: 15,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: kGreenColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.check,
                                  size: 18,
                                  color: kGreenColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: kPrimaryColor)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.water,
                                      size: 18,
                                      color: kButtonColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Other",
                                  style: TextStyle(
                                    fontFamily: kWorkSans,
                                    fontSize: 15,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: kButtonColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.close,
                                  size: 18,
                                  color: kButtonColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 25)
                  ],
                )),
          ],
        );
      },
    );
  }

  invitationDialog(String id, name, address) async {
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
              LoaderX.show(context, 60.0, 60.0);
              checkoutService.notAcceptCheckoutInvitation(id, name, address);
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
