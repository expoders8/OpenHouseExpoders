import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../view/my_request.dart';
import '../../routes/app_pages.dart';
import '../../view/chechout_request.dart';
import '../../view/tenant_request_view.dart';
import '../../controller/tab_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../Property Details/lease_property_details.dart';

class HomePage extends StatefulWidget {
  final String? checkRoll;
  const HomePage({super.key, this.checkRoll});

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
          child: widget.checkRoll == "tenant"
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        "Invitations",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 17,
                            fontFamily: kCircularStdMedium),
                      ),
                      const SizedBox(height: 10),
                      Container(
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
                              const Row(
                                children: [
                                  Text(
                                    "Jons jacko",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: kRedColor,
                                        color: kRedColor,
                                        fontSize: 14,
                                        fontFamily: kCircularStdNormal),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "for",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                        fontFamily: kCircularStdNormal),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "6001 Main Street",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                          invitationDialog();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFFFF1100),
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
                                      const SizedBox(width: 25),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(height: 10),
                      const Text(
                        "My Lease",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 17,
                            fontFamily: kCircularStdMedium),
                      ),
                      const SizedBox(height: 10),
                      leaseproperty(
                          "assets/icons/1.png",
                          "\$2550",
                          "101 Main Street",
                          "2",
                          "Tenant Name",
                          "\$15,200",
                          "\$220",
                          "12-06-2021"),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "My Requests",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 17,
                                fontFamily: kCircularStdMedium),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: kPrimaryColor, width: 1),
                                borderRadius: BorderRadius.circular(25)),
                            child: const Text(
                              "Add +",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 14,
                                  fontFamily: kCircularStdNormal),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const MyRequestView(),
                      const SizedBox(height: 10),
                      const SizedBox(height: 65),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
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
                                    left: 15.0,
                                    right: 15.0,
                                    top: 20,
                                    bottom: 20.0),
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
                      const Text(
                        "Checkout Requests",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 17,
                            fontFamily: kCircularStdMedium),
                      ),
                      const SizedBox(height: 3),
                      const CheckOutRequestView(),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Tenant Requests",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 17,
                                fontFamily: kCircularStdMedium),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.tenantRequestPage);
                            },
                            child: const Text(
                              "View all",
                              style: TextStyle(
                                  color: kBlueColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      TenantRequestView(isviewall: 0),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Lease Status",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 17,
                                fontFamily: kCircularStdMedium),
                          ),
                          GestureDetector(
                            onTap: () {
                              tabCountController.changeTabIndex(1);
                            },
                            child: const Text(
                              "View all",
                              style: TextStyle(
                                  color: kBlueColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      leaseproperty(
                          "assets/icons/1.png",
                          "\$2550",
                          "101 Main Street",
                          "2",
                          "Tenant Name",
                          "\$15,200",
                          "\$220",
                          "12-06-2021"),
                      const SizedBox(height: 80)
                    ],
                  ),
                ),
        ),
      ),
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

  leaseproperty(String image, price, address, person, tenantname, balancedue,
      rentdue, expiredate) {
    return GestureDetector(
      onTap: () {
        Get.to(LeasePropertyDetailPage(
          checkRoll: widget.checkRoll,
        ));
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
}
