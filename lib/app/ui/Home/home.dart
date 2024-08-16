import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';
import '../../controller/tab_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TabCountController tabCountController = Get.find<TabCountController>();
  final tabController = Get.put(TabCountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OpenHouse",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.notificationPage);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/icons/notification.png", scale: 1.8),
            ),
          ),
        ],
        backgroundColor: kBackGroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.totalAmountDetailPage);
                      },
                      child: Container(
                        width: Get.width / 2.250,
                        decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 20, bottom: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total Amount",
                                style: TextStyle(
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 15,
                                    color: kWhiteColor),
                              ),
                              Text(
                                "\$50,000",
                                style: TextStyle(
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 25,
                                    color: kWhiteColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        tabCountController.changeTabIndex(3);
                      },
                      child: Container(
                        width: Get.width / 2.250,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 20, bottom: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Month Due",
                                style: TextStyle(
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 15,
                                    color: kPrimaryColor),
                              ),
                              Text(
                                "\$1952",
                                style: TextStyle(
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 25,
                                    color: kPrimaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    tabCountController.changeTabIndex(1);
                  },
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 20, bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total Property",
                                style: TextStyle(
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 14,
                                    color: kPrimaryColor),
                              ),
                              Text(
                                "10",
                                style: TextStyle(
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 24,
                                    color: kPrimaryColor),
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/icons/line_vertical.png",
                            fit: BoxFit.cover,
                            scale: 1.2,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Property on lease",
                                style: TextStyle(
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 14,
                                    color: kPrimaryColor),
                              ),
                              Text(
                                "8",
                                style: TextStyle(
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 24,
                                    color: kPrimaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tenant Requests",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 17,
                          fontFamily: kCircularStdMedium),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                          color: kBlueColor,
                          fontSize: 13,
                          fontFamily: kCircularStdMedium),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      tenantRequest(
                          "Electricity",
                          "I want to change fan.",
                          "4693 Wentz Avenue, Saskatoon",
                          "Tenant Name",
                          "Emergency",
                          Icons.electric_bolt_sharp),
                      const SizedBox(width: 10),
                      tenantRequest(
                          "Gas",
                          "I want to change Gas meter.",
                          "4693 Wentz Avenue, Saskatoon",
                          "Tenant Name",
                          "Emergency",
                          Icons.gas_meter_sharp),
                      const SizedBox(width: 10),
                      tenantRequest(
                          "Electricity",
                          "I want to change Air Conditioner.",
                          "3545 Robson St, Vancouver",
                          "Tenant Name",
                          "",
                          Icons.electric_bolt_sharp),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                leaseproperty("assets/icons/1.png", "\$2550", "101 Main Street",
                    "2", "Tenant Name", "\$15,200", "\$220", "12-06-2021"),
                const SizedBox(height: 80)
                // const Text(
                //   "Routine Maintenance",
                //   style: TextStyle(
                //       color: kPrimaryColor,
                //       fontSize: 17,
                //       fontFamily: kCircularStdMedium),
                // ),
                // const SizedBox(height: 10),
                // routingmaintanance("Electricity", "\$105", "25-12-2020",
                //     "101 Main Street", Icons.electric_bolt_sharp),
                // routingmaintanance("Gas", "\$99", "25-11-2020",
                //     "3545 Robson St, Vancouver", Icons.gas_meter_rounded),
                // routingmaintanance("Repair", "\$65", "25-11-2020",
                //     "101 Main Street", Icons.manage_history_sharp),
                // routingmaintanance(
                //     "Internet",
                //     "\$46",
                //     "30-1-2021",
                //     "3545 Robson St, Vancouver",
                //     Icons.signal_wifi_statusbar_connected_no_internet_4_sharp),
                // const SizedBox(height: 65),
              ],
            ),
          ),
        ),
      ),
    );
  }

  tenantRequest(
      String title, comments, address, name, emergency, IconData icons) {
    return Container(
      width: Get.width - 130,
      height: Get.height / 3.5,
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
            emergency != ""
                ? Row(
                    children: [
                      const Icon(
                        Icons.warning,
                        size: 16,
                        color: kAmberColor,
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: Get.width - 220,
                        child: Text(
                          emergency,
                          style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 13,
                              fontFamily: kCircularStdNormal),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  leaseproperty(String image, price, address, person, tenantname, balancedue,
      rentdue, expiredate) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.leasePropertyDetailPage);
      },
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      scale: 1.2,
                      height: 120,
                      width: 120,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                            fontFamily: kCircularStdMedium),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: kButtonColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: Get.width / 2.5,
                            child: Text(
                              address,
                              style: const TextStyle(
                                  color: kSecondaryPrimaryColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.bed_outlined,
                            size: 16,
                            color: kButtonColor,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: Get.width - 220,
                            child: Text(
                              person,
                              style: const TextStyle(
                                  color: kSecondaryPrimaryColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdBold),
                            ),
                          ),
                        ],
                      ),
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
                              tenantname,
                              style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 10, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Balance Due",
                          style: TextStyle(
                              fontFamily: kCircularStdNormal,
                              fontSize: 12,
                              color: kPrimaryColor),
                        ),
                        Text(
                          balancedue,
                          style: const TextStyle(
                              fontFamily: kCircularStdMedium,
                              fontSize: 17,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/icons/line_vertical.png",
                      fit: BoxFit.cover,
                      scale: 1.8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Rent Due on",
                          style: TextStyle(
                              fontFamily: kCircularStdNormal,
                              fontSize: 12,
                              color: kPrimaryColor),
                        ),
                        Text(
                          rentdue,
                          style: const TextStyle(
                              fontFamily: kCircularStdMedium,
                              fontSize: 17,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/icons/line_vertical.png",
                      fit: BoxFit.cover,
                      scale: 1.8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "lease Expaires",
                          style: TextStyle(
                              fontFamily: kCircularStdNormal,
                              fontSize: 12,
                              color: kRedColor),
                        ),
                        Text(
                          expiredate,
                          style: const TextStyle(
                              fontFamily: kCircularStdMedium,
                              fontSize: 17,
                              color: kRedColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  routingmaintanance(String title, amount, date, address, IconData icons) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icons,
                size: 18,
                color: kButtonColor,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                  Text(
                    address,
                    style: const TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdMedium),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                    fontFamily: kCircularStdMedium),
              ),
              Text(
                date,
                style: const TextStyle(
                    color: kSecondaryPrimaryColor,
                    fontSize: 12,
                    fontFamily: kCircularStdMedium),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
