import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:openhome/app/routes/app_pages.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

import '../../view/house_keeper_view.dart';
import '../../view/nearby_view.dart';
import '../../view/tenant_history_view.dart';
import '../../view/property_details_view.dart';
import '../CreateProperty/create_property.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class NotLeasePropertyDetailPage extends StatefulWidget {
  const NotLeasePropertyDetailPage({super.key});

  @override
  State<NotLeasePropertyDetailPage> createState() =>
      _NotLeasePropertyDetailPageState();
}

class _NotLeasePropertyDetailPageState extends State<NotLeasePropertyDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: Get.height / 2.9,
              width: double.infinity,
              child: AnotherCarousel(
                images: const [
                  AssetImage("assets/icons/3.png"),
                  AssetImage("assets/icons/6.png"),
                  AssetImage("assets/icons/7.png"),
                ],
                dotSize: 6,
                autoplay: false,
                borderRadius: true,
                radius: const Radius.circular(0),
                dotPosition: DotPosition.bottomCenter,
                indicatorBgPadding: 27.0,
                dotBgColor: Colors.transparent,
              ),
            ),
            Positioned(
                top: 40,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 9.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                )),
            Positioned(
              child: Container(
                height: Get.height - 225,
                margin: const EdgeInsets.only(top: 225),
                decoration: BoxDecoration(
                  color: kBackGroundColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width - 100,
                                    child: const Text(
                                      "3545 Robson St, Vancouver",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 18,
                                          fontFamily: kCircularStdMedium),
                                    ),
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        "\$2513",
                                        style: TextStyle(
                                            color: kButtonColor,
                                            fontSize: 18,
                                            fontFamily: kCircularStdMedium),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "per month",
                                        style: TextStyle(
                                            color: kSecondaryPrimaryColor,
                                            fontSize: 13,
                                            fontFamily: kCircularStdMedium),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const CreatePropertyPage(
                                      checkEdit: "edit"));
                                },
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      color: kBorderColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Icon(
                                    Icons.edit,
                                    color: kPrimaryColor,
                                    size: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: List.generate(4, (index) {
                              return const Icon(Icons.star,
                                  color: Color.fromARGB(255, 255, 230, 0));
                            })
                              ..add(const Icon(Icons.star_half,
                                  color: Color.fromARGB(255, 255, 230, 0))),
                          ),
                          TabBar(
                            controller: _tabController,
                            indicatorColor: kButtonColor,
                            labelColor: kPrimaryColor,
                            tabs: const [
                              Tab(text: 'Tenants'),
                              Tab(text: 'Overview'),
                              Tab(text: 'Near By'),
                            ],
                          ),
                          SizedBox(
                            height: Get.height / 2.02825,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 10),
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {
                                                Get.toNamed(
                                                    Routes.inviteTenantPage);
                                              },
                                              child: Container(
                                                height: 38,
                                                width: Get.width - 200,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    border: Border.all(
                                                        color: kButtonColor),
                                                    color: kBackGroundColor),
                                                child: const Center(
                                                  child: Text(
                                                    "Invite Tenant",
                                                    style: TextStyle(
                                                        color: kPrimaryColor,
                                                        fontFamily:
                                                            kCircularStdNormal,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const HouseKeeperView(),
                                      ],
                                    ),
                                  ),
                                  const PropertyDetailsView(),
                                  const NearByAmenitiesView(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }

  tenanthistory() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/icons/boy 2.png",
                fit: BoxFit.cover,
                height: 35,
                width: 35,
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tenant Name",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 13,
                      fontFamily: kCircularStdMedium),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 12,
                      color: kButtonColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "+91 9898567548",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 10,
                          fontFamily: kCircularStdNormal),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "01-7-2024 to 31-10-2024",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 10,
                          fontFamily: kCircularStdNormal),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  tenantRequest() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/icons/boy 2.png",
                fit: BoxFit.cover,
                height: 35,
                width: 35,
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tenant Name",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 13,
                      fontFamily: kCircularStdMedium),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 12,
                      color: kButtonColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "+91 9898567548",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 10,
                          fontFamily: kCircularStdNormal),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Pendding",
                      style: TextStyle(
                          color: kRedColor,
                          fontSize: 10,
                          fontFamily: kCircularStdNormal),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  amenities(String text) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/correct.png",
          fit: BoxFit.cover,
          height: 15,
          width: 15,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 14,
              fontFamily: kCircularStdNormal),
        ),
      ],
    );
  }
}
