import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../controller/payment_controller.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final GetPropertyPaymentController getPropertyPaymentController =
      Get.put(GetPropertyPaymentController());
  @override
  void initState() {
    getPropertyPaymentController.fetchAllPayments();
    super.initState();
  }

  DateTime? dateTime;
  String formattedDate = '';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getPropertyPaymentController.isLoading.value) {
          return Container();
        } else {
          if (getPropertyPaymentController.paymentList.isNotEmpty) {
            if (getPropertyPaymentController.paymentList[0].data!.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text(
                    "No Payment",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                ),
              );
            } else {
              return SizedBox(
                height: Get.height,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 12),
                  itemCount:
                      getPropertyPaymentController.paymentList[0].data!.length,
                  itemBuilder: (context, index) {
                    var requestData =
                        getPropertyPaymentController.paymentList[0].data!;
                    if (requestData.isNotEmpty) {
                      var data = requestData[index];
                      dateTime = DateTime.parse(data.paymentDate!.toString());
                      formattedDate =
                          DateFormat('dd MMM yyyy').format(dateTime!);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          paymenthistory("Paid", data.username.toString(),
                              data.paymentAmount.toString(), formattedDate),
                          const SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Center(
                          child: Text(
                            "No Payment",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 15,
                                fontFamily: kCircularStdMedium),
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            }
          } else {
            return const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(
                child: Text(
                  "No Payment",
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

  paymenthistory(
      String status, String tenantname, String payment, String paymentdate) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kWhiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                    Text(
                      status,
                      style: TextStyle(
                          color: status != "Paid" ? kRedColor : kGreenColor,
                          fontSize: 15,
                          fontFamily: kCircularStdMedium),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.person, size: 16, color: kButtonColor),
                    const SizedBox(width: 10),
                    Text(
                      tenantname,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  payment,
                  style: const TextStyle(
                      color: kRedColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
                const SizedBox(height: 5),
                Text(
                  paymentdate,
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
