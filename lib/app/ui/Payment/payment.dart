import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/app_pages.dart';
import '../../../config/constant/constant.dart';
import '../../controller/payment_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedRoll = "";
  final GetPaymentController getPaymentController =
      Get.put(GetPaymentController());
  int totalamount = 0;
  int dueamount = 0;
  @override
  void initState() {
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
    });
    var userdata = getStorage.read('user');
    var user = jsonDecode(userdata);
    setState(() {
      totalamount = user['total_amount'] ?? 0;
      dueamount = user['due_amount'] ?? 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kBackGroundColor,
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.profilePage);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/icons/boy 1.png",
                    fit: BoxFit.cover,
                    height: 30,
                    width: 30,
                  )),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: selectedRoll == "tenant"
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width / 2.250,
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 20, bottom: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Total Amount",
                                  style: TextStyle(
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 15,
                                      color: kPrimaryColor),
                                ),
                                Text(
                                  "\$$totalamount",
                                  style: const TextStyle(
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 25,
                                      color: kPrimaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: Get.width / 2.250,
                          decoration: BoxDecoration(
                            color: kButtonColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 20, bottom: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Pending Amount",
                                  style: TextStyle(
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 15,
                                      color: kWhiteColor),
                                ),
                                Text(
                                  "\$$dueamount",
                                  style: const TextStyle(
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 25,
                                      color: kWhiteColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Flexible(
                    child: Obx(
                      () {
                        if (getPaymentController.isLoading.value) {
                          return Container(
                            color: kBackGroundColor,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: kSelectedIconColor,
                              ),
                            ),
                          );
                        } else {
                          if (getPaymentController.paymentList.isNotEmpty) {
                            if (getPaymentController
                                .paymentList[0].data!.isEmpty) {
                              return const Center(
                                child: Text(
                                  "No Payments",
                                  textAlign: TextAlign.center,
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
                                      scrollDirection: Axis.vertical,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      itemCount: getPaymentController
                                          .paymentList[0].data!.length,
                                      itemBuilder: (context, index) {
                                        var requestData = getPaymentController
                                            .paymentList[0].data!;
                                        if (requestData.isNotEmpty) {
                                          var data = requestData[index];
                                          return payment(
                                              "assets/icons/boy 2.png",
                                              "\$${data.totalPayment}",
                                              data.address,
                                              "Pending",
                                              data.name,
                                              data.mobileNo,
                                              "\$250",
                                              "25-06-2025");
                                        } else {
                                          return const Center(
                                            child: Text(
                                              "No Payments",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 15,
                                                  fontFamily:
                                                      kCircularStdMedium),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {},
                                        child: Container(
                                          height: 45,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  color: kWhiteColor),
                                              color: kButtonColor),
                                          child: const Center(
                                            child: Text(
                                              "Pay Now",
                                              style: TextStyle(
                                                  color: kWhiteColor,
                                                  fontFamily:
                                                      kCircularStdNormal,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                          } else {
                            return const Center(
                              child: Text(
                                "No Payments",
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
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width / 2.250,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 20,
                                  bottom: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 15,
                                        color: kPrimaryColor),
                                  ),
                                  Text(
                                    "\$5420",
                                    style: TextStyle(
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 25,
                                        color: kPrimaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: Get.width / 2.250,
                            decoration: BoxDecoration(
                              color: kButtonColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 20,
                                  bottom: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Pending Amount",
                                    style: TextStyle(
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 15,
                                        color: kWhiteColor),
                                  ),
                                  Text(
                                    "\$1952",
                                    style: TextStyle(
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 25,
                                        color: kWhiteColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      payment(
                          "assets/icons/boy 1.png",
                          "\$1850",
                          "224 Robson St, Vancouver",
                          "Paid",
                          "Tenant Name",
                          "+91 1234567890",
                          "\$0",
                          "12-06-2025"),
                      const SizedBox(height: 12),
                      payment(
                          "assets/icons/boy 2.png",
                          "\$1850",
                          "101 Main Street",
                          "Pending",
                          "Tenant Name",
                          "+91 9898758462",
                          "\$250",
                          "25-06-2025"),
                      const SizedBox(height: 12),
                      payment(
                          "assets/icons/boy 3.png",
                          "\$1850",
                          "206 / B , Main Street",
                          "Paid",
                          "Tenant Name",
                          "+91 7859642316",
                          "\$250",
                          "25-06-2025"),
                      const SizedBox(height: 90)
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  payment(String userimage, totalamount, address, status, tenantname, cantact,
      pendingpayment, duedate) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: kWhiteColor),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.pending_actions_rounded,
                              size: 18,
                              color: status != "Paid" ? kRedColor : kGreenColor,
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                                width: Get.width - 220,
                                child: Text(status,
                                    style: TextStyle(
                                        color: status != "Paid"
                                            ? kRedColor
                                            : kGreenColor,
                                        fontSize: 15,
                                        fontFamily: kCircularStdBold)))
                          ]),
                      const SizedBox(height: 5),
                      Row(children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: kButtonColor,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                            width: Get.width / 2,
                            child: Text(address,
                                style: const TextStyle(
                                    color: kSecondaryPrimaryColor,
                                    fontSize: 13,
                                    fontFamily: kCircularStdMedium))),
                      ]),
                      const SizedBox(height: 5),
                      Row(children: [
                        const Icon(Icons.person, size: 16, color: kButtonColor),
                        const SizedBox(width: 10),
                        SizedBox(
                            width: Get.width - 220,
                            child: Text(tenantname,
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 13,
                                    fontFamily: kCircularStdMedium)))
                      ]),
                      const SizedBox(height: 5),
                      Row(children: [
                        const Icon(
                          Icons.phone,
                          size: 16,
                          color: kButtonColor,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                            width: Get.width - 220,
                            child: Text(cantact,
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 13,
                                    fontFamily: kCircularStdMedium)))
                      ]),
                    ]),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    userimage,
                    fit: BoxFit.cover,
                    height: 65,
                    width: 65,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            status == "Paid"
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      details("Payment", totalamount),
                      Image.asset("assets/icons/line_vertical.png",
                          fit: BoxFit.cover, scale: 1.8),
                      details("Payment Date", duedate),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      details("Payment", totalamount),
                      Image.asset("assets/icons/line_vertical.png",
                          fit: BoxFit.cover, scale: 1.8),
                      details("Pending Payment", pendingpayment),
                      Image.asset("assets/icons/line_vertical.png",
                          fit: BoxFit.cover, scale: 1.8),
                      details("Due Date", duedate),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  details(String title, detail) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: const TextStyle(
                  fontFamily: kCircularStdNormal,
                  fontSize: 12,
                  color: kPrimaryColor)),
          Text(detail,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 17,
                  fontFamily: kCircularStdMedium)),
        ]);
  }
}
