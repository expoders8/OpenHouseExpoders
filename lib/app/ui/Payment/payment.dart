import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../controller/payment_controller.dart';
import '../../models/firebase_user_model.dart';
import '../../routes/app_pages.dart';
import '../../../config/constant/constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String userImage = "",
      authToken = "",
      firstName = "",
      lastName = "",
      firstlater = "",
      lastlatter = "",
      selectedRoll = "";
  final GetPaymentTenantController getPaymentTenantController =
      Get.put(GetPaymentTenantController());
  final GetPaymentHostController getPaymentHostController =
      Get.put(GetPaymentHostController());
  var userCollection = FirebaseFirestore.instance.collection("Users");
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
    getuser();
    super.initState();
  }

  getuser() {
    var user = getStorage.read('user');
    var userData = jsonDecode(user);
    if (userData != null) {
      // userImage = userData["profile_picture"] ?? "";
      firstName = userData['first_name'] ?? "";
      lastName = userData['last_name'] ?? "";
      firstlater = firstName[0];
      lastlatter = lastName[0];
    }
    getUserFirebaseDatabase();
  }

  Stream<List<FirebaseUser>> getAppUser() {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);
    return userCollection
        .where('uid', isEqualTo: getUserData['id'].toString())
        .snapshots()
        .map((event) =>
            event.docs.map((e) => FirebaseUser.fromJson(e.data())).toList());
  }

  getUserFirebaseDatabase() async {
    var userStream = getAppUser();
    userStream.listen((users) {
      if (users.isNotEmpty) {
        setState(() {
          userImage = users.first.image.toString();
        });
      }
    });
  }

  int totalPayrent = 0;
  int totalAmount = 0;
  int penddingrentAmount = 0;
  DateTime? dateDueTime;
  DateTime? dateTime;
  String formattedDueDate = '';
  String formattedDate = '';

  Future<void> _refreshItems() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      getPaymentTenantController.fetchAllPayments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Payment",
              style: TextStyle(fontFamily: kCircularStdBold, fontSize: 18),
            ),
            const SizedBox(width: 3),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: kButtonColor),
              child: Center(
                child: Text(
                  '${selectedRoll[0].toUpperCase()}${selectedRoll.substring(1)}',
                  style: const TextStyle(
                    color: kWhiteColor,
                    fontSize: 10,
                    fontFamily: kCircularStdNormal,
                  ),
                ),
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kBackGroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.toNamed(Routes.profilePage);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(
                  child: Material(
                      child: userImage != ""
                          ? Image.network(
                              userImage,
                              width: 30,
                              height: 30,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                "assets/images/blank_profile.png",
                                width: 33,
                                height: 33,
                                fit: BoxFit.cover,
                              ),
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return SizedBox(
                                  width: 33,
                                  height: 33,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: kPrimaryColor,
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  ),
                                );
                              },
                            )
                          : Container(
                              height: 36,
                              width: 36,
                              color: kTransparentColor,
                              child: Center(
                                  child: Text(
                                "$firstlater$lastlatter".toUpperCase(),
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                    fontFamily: kCircularStdNormal),
                              )),
                            )),
                ),
              ),
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
                        if (getPaymentTenantController.isLoading.value) {
                          return Container(
                            color: kBackGroundColor,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: kPrimaryColor,
                              ),
                            ),
                          );
                        } else {
                          if (getPaymentTenantController
                              .paymentList.isNotEmpty) {
                            if (getPaymentTenantController
                                .paymentList[0].data!.isEmpty) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 55.0),
                                  child: Text(
                                    "No Payments",
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
                                  Flexible(
                                    child: RefreshIndicator(
                                      onRefresh: _refreshItems,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        itemCount: getPaymentTenantController
                                            .paymentList[0].data!.length,
                                        itemBuilder: (context, index) {
                                          var requestData =
                                              getPaymentTenantController
                                                  .paymentList[0].data!;
                                          if (requestData.isNotEmpty) {
                                            var data = requestData[index];
                                            dateDueTime = DateTime.parse(
                                                data.dueDate!.toString());
                                            formattedDueDate =
                                                DateFormat('dd MMM yyyy')
                                                    .format(dateDueTime!);
                                            dateTime = DateTime.parse(
                                                data.paymentDate!.toString());
                                            formattedDate =
                                                DateFormat('dd MMM yyyy')
                                                    .format(dateTime!);
                                            if (requestData[index]
                                                .totalPayment!
                                                .isNotEmpty) {
                                              totalPayrent = data.totalPayment!
                                                  .map((expense) => int.parse(
                                                      expense.paymentAmount!))
                                                  .reduce((sum, price) =>
                                                      sum + price);
                                              int currentTotalRent = int.parse(
                                                  data.totalAmount.toString());
                                              totalAmount = int.parse(
                                                  data.totalAmount.toString());
                                              penddingrentAmount =
                                                  currentTotalRent -
                                                      totalPayrent;
                                            }
                                            return payment(
                                                data.userimage.toString(),
                                                "\$ $totalPayrent",
                                                data.propertyAddress,
                                                penddingrentAmount == 0
                                                    ? "Paid"
                                                    : "Pending",
                                                data.username,
                                                data.phoneNumber.toString() ==
                                                        "null"
                                                    ? "null"
                                                    : data.phoneNumber
                                                        .toString(),
                                                "\$ $penddingrentAmount",
                                                penddingrentAmount == 0
                                                    ? formattedDate
                                                    : formattedDueDate);
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
                                  ),
                                ],
                              );
                            }
                          } else {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 55.0),
                                child: Text(
                                  "No Payments",
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
                    ),
                  ),
                ],
              )
            : Column(
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
                        if (getPaymentHostController.isLoading.value) {
                          return Container(
                            color: kBackGroundColor,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: kPrimaryColor,
                              ),
                            ),
                          );
                        } else {
                          if (getPaymentHostController.paymentList.isNotEmpty) {
                            if (getPaymentHostController
                                .paymentList[0].data!.isEmpty) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 55.0),
                                  child: Text(
                                    "No Payments",
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
                                  Flexible(
                                    child: RefreshIndicator(
                                      onRefresh: _refreshItems,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        itemCount: getPaymentHostController
                                            .paymentList[0].data!.length,
                                        itemBuilder: (context, index) {
                                          var requestData =
                                              getPaymentHostController
                                                  .paymentList[0].data!;
                                          if (requestData.isNotEmpty) {
                                            var data = requestData[index];
                                            dateDueTime = DateTime.parse(
                                                data.dueDate!.toString());
                                            formattedDueDate =
                                                DateFormat('dd MMM yyyy')
                                                    .format(dateDueTime!);
                                            dateTime = DateTime.parse(
                                                data.paymentDate!.toString());
                                            formattedDate =
                                                DateFormat('dd MMM yyyy')
                                                    .format(dateTime!);
                                            if (requestData[index]
                                                .totalPayment!
                                                .isNotEmpty) {
                                              totalPayrent = data.totalPayment!
                                                  .map((expense) => int.parse(
                                                      expense.paymentAmount!))
                                                  .reduce((sum, price) =>
                                                      sum + price);
                                              int currentTotalRent = int.parse(
                                                  data.totalAmount.toString());
                                              totalAmount = int.parse(
                                                  data.totalAmount.toString());
                                              penddingrentAmount =
                                                  currentTotalRent -
                                                      totalPayrent;
                                            }
                                            return payment(
                                                data.userimage.toString(),
                                                "\$ $totalPayrent",
                                                data.propertyAddress,
                                                penddingrentAmount == 0
                                                    ? "Paid"
                                                    : "Pending",
                                                data.username,
                                                data.phoneNumber.toString() ==
                                                        "null"
                                                    ? "null"
                                                    : data.phoneNumber
                                                        .toString(),
                                                "\$ $penddingrentAmount",
                                                penddingrentAmount == 0
                                                    ? formattedDate
                                                    : formattedDueDate);
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
                                  ),
                                ],
                              );
                            }
                          } else {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 55.0),
                                child: Text(
                                  "No Payments",
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
                    ),
                  ),
                ],
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
                      cantact.toString() == "null"
                          ? Container()
                          : Row(children: [
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
                  borderRadius: BorderRadius.circular(100),
                  child: userimage.toString() != "null"
                      ? Image.network(
                          userimage,
                          fit: BoxFit.cover,
                          height: 65,
                          width: 65,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/images/blank_profile.png",
                              fit: BoxFit.cover,
                              height: 65,
                              width: 65,
                            );
                          },
                        )
                      : Image.asset(
                          "assets/images/blank_profile.png",
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
