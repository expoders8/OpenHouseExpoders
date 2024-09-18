import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../view/my_request.dart';
import '../../routes/app_pages.dart';
import '../../view/chechout_request.dart';
import '../../view/tenant_request_view.dart';
import '../../controller/tab_controller.dart';
import '../../../config/constant/constant.dart';
import '../../view/tenant_invitation_view.dart';
import '../../controller/request_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../Property Details/lease_property_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedRoll = "";
  final tabController = Get.put(TabCountController());
  final GetAllRequestsController getAllRequestsController =
      Get.put(GetAllRequestsController());
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
              child: Image.asset(
                "assets/icons/notification.png",
                fit: BoxFit.cover,
                height: 31,
                width: 31,
              ),
            ),
          ),
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
        backgroundColor: kBackGroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: selectedRoll == "tenant"
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const TenantInvitationView(),
                      const SizedBox(height: 10),
                      const Text(
                        "My Lease",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontFamily: kCircularStdMedium),
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
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 235,
                        child: MyRequestView(isviewall: 0),
                      ),
                      const SizedBox(height: 85)
                    ],
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Checkout Requests",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontFamily: kCircularStdMedium),
                      ),
                      const CheckOutRequestView(),
                      const SizedBox(height: 10),
                      TenantRequestView(isviewall: 0),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Lease Status",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontFamily: kCircularStdMedium),
                          ),
                          CupertinoButton(
                            onPressed: () {
                              tabController.changeTabIndex(1);
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
                      leaseproperty(
                          "assets/icons/1.png",
                          "\$2550",
                          "101 Main Street",
                          "2",
                          "Tenant Name",
                          "\$15,200",
                          "\$220",
                          "12-06-2021"),
                      const SizedBox(height: 85)
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
        Get.to(() => const LeasePropertyDetailPage());
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
                          const SizedBox(width: 10),
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
