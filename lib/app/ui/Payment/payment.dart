import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedRoll = "";
  @override
  void initState() {
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
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
      ),
      body: SafeArea(
        child: selectedRoll == "tenant"
            ? SingleChildScrollView(
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
                          "assets/icons/boy 2.png",
                          "\$1850",
                          "101 Main Street",
                          "Pending",
                          "Host Name",
                          "+91 9898758462",
                          "\$250",
                          "25-06-2025"),
                      const SizedBox(height: 15),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Container(
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: kWhiteColor),
                              color: kButtonColor),
                          child: const Center(
                            child: Text(
                              "Pay Now",
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontFamily: kCircularStdNormal,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 85)
                    ],
                  ),
                ),
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
