import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class TrackLeaseExpensesPage extends StatefulWidget {
  const TrackLeaseExpensesPage({super.key});

  @override
  State<TrackLeaseExpensesPage> createState() => _TrackLeaseExpensesPageState();
}

class _TrackLeaseExpensesPageState extends State<TrackLeaseExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Property Service Expense"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            children: [
              leaseproperty("assets/icons/1.png", "1500", "address", "5",
                  "name", "1200", "800", "10 May 2024")
            ],
          ),
        ),
      ),
    );
  }

  leaseproperty(String image, price, address, person, tenantname, balancedue,
      rentdue, expiredate) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        // Get.to(() => const LeasePropertyDetailPage());
      },
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      scale: 1.2,
                      height: 65,
                      width: 65,
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width - 170,
                        child: const Text(
                          "Name",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 17,
                              fontFamily: kCircularStdMedium),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: address.toString() == "null" ? 0 : 5),
                      address.toString() == "null"
                          ? Container()
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: kButtonColor,
                                ),
                                const SizedBox(width: 5),
                                SizedBox(
                                  width: Get.width / 2.5,
                                  child: Text(
                                    address.toString(),
                                    style: const TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 13,
                                        fontFamily: kCircularStdMedium),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Amenities Name",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "\$ 250",
                    style: TextStyle(
                        color: kRedColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Amenities Name",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "\$ 250",
                    style: TextStyle(
                        color: kRedColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
