import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/constant/color_constant.dart';
import '../../config/constant/font_constant.dart';

class MyRequestView extends StatefulWidget {
  const MyRequestView({super.key});

  @override
  State<MyRequestView> createState() => _TanantRequestViewState();
}

class _TanantRequestViewState extends State<MyRequestView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          myRequest(
              "Electricity",
              "I want to change fan.",
              "4693 Wentz Avenue, Saskatoon",
              "Tenant Name",
              "Emergency",
              Icons.electric_bolt_sharp),
          const SizedBox(width: 10),
          myRequest(
              "Gas",
              "I want to change Gas meter.",
              "4693 Wentz Avenue, Saskatoon",
              "Tenant Name",
              "Emergency",
              Icons.gas_meter_sharp),
          const SizedBox(width: 10),
          myRequest(
              "Electricity",
              "I want to change Air Conditioner.",
              "3545 Robson St, Vancouver",
              "Tenant Name",
              "",
              Icons.electric_bolt_sharp),
        ],
      ),
    );
  }

  myRequest(String title, comments, address, name, emergency, IconData icons) {
    return Container(
      width: Get.width - 130,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: kPrimaryColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Icon(
                          icons,
                          size: 18,
                          color: kButtonColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: const TextStyle(
                          fontFamily: kCircularStdMedium,
                          fontSize: 18,
                          color: kPrimaryColor),
                    ),
                  ],
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    comments,
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 13,
                        fontFamily: kCircularStdBold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
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
                    address,
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdNormal),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
                    name,
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 13,
                        fontFamily: kCircularStdNormal),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "12-May-2023",
                  style: TextStyle(
                      color: kGreyColor,
                      fontSize: 13,
                      fontFamily: kCircularStdNormal),
                ),
                emergency != ""
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: kButtonColor),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.warning,
                              size: 16,
                              color: kWhiteColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              emergency,
                              style: const TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdNormal),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
