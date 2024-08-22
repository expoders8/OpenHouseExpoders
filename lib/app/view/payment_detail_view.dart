import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:openhome/config/constant/font_constant.dart';
import 'package:openhome/config/constant/color_constant.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flexible(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              payment(
                "assets/icons/boy 2.png",
                "\$1850",
                "Pending",
                "Tenant Name",
                "+91 9898758462",
                "\$300",
                "25-07-2024",
              ),
              const SizedBox(height: 10),
              paymenthistory(
                "Paid",
                "Tenant Name",
                "\$1850",
                "10-06-2024",
              ),
              const SizedBox(height: 10),
              paymenthistory(
                "Paid",
                "Tenant Name",
                "\$1850",
                "10-05-2024",
              ),
              const SizedBox(height: 10),
              paymenthistory(
                "Paid",
                "Tenant Name",
                "\$1850",
                "10-04-2024",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget payment(
      String userimage,
      String totalamount,
      String status,
      String tenantname,
      String contact,
      String pendingpayment,
      String duedate) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kWhiteColor,
      ),
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
                          child: Text(
                            status,
                            style: TextStyle(
                              color: status != "Paid" ? kRedColor : kGreenColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.person, size: 16, color: kButtonColor),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: Get.width - 220,
                          child: Text(
                            tenantname,
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          size: 16,
                          color: kButtonColor,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: Get.width - 220,
                          child: Text(
                            contact,
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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

  Widget paymenthistory(
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

  Widget details(String title, String detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: kPrimaryColor,
          ),
        ),
        Text(
          detail,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
