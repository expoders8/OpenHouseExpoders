import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:openhome/app/view/property_details_view.dart';
import 'package:openhome/app/view/tenant_history_view.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../CreateProperty/create_property.dart';

class LeasePropertyDetailPage extends StatefulWidget {
  final String? checkRoll;
  const LeasePropertyDetailPage({super.key, this.checkRoll});

  @override
  State<LeasePropertyDetailPage> createState() =>
      _LeasePropertyDetailPageeState();
}

class _LeasePropertyDetailPageeState extends State<LeasePropertyDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController with `this` as the vsync
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            // Positioned(
            //   left: 20,
            //   top: 45,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8),
            //       color: kWhiteColor,
            //       boxShadow: const [
            //         BoxShadow(
            //           color: Color.fromARGB(80, 0, 0, 0),
            //           blurRadius: 10,
            //           offset: Offset(0, 2),
            //           spreadRadius: -6,
            //         ),
            //       ],
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: InkWell(
            //         onTap: () {},
            //         child: const ImageIcon(
            //           AssetImage("assets/icons/back.png"),
            //           size: 25,
            //           color: kPrimaryColor,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
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
                      padding: EdgeInsets.only(left: 8.5),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
                        size: 17,
                      ),
                    ),
                  ),
                )),
            // Positioned(
            //     top: 40,
            //     right: 10,
            //     child: GestureDetector(
            //       onTap: () {
            //         Get.toNamed(Routes.editPropertyPage);
            //       },
            //       child: Container(
            //         height: 45,
            //         width: 45,
            //         decoration: BoxDecoration(
            //             color: kWhiteColor,
            //             borderRadius: BorderRadius.circular(15)),
            //         child: const Icon(
            //           Icons.edit,
            //           color: kPrimaryColor,
            //           size: 17,
            //         ),
            //       ),
            //     )),
            Positioned(
              child: Container(
                height: Get.height / 1.457,
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
                          const SizedBox(
                            height: 15,
                          ),
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
                              widget.checkRoll == "tenant"
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        Get.to(() => const CreatePropertyPage(
                                            checkEdit: "edit"));
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: kBorderColor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
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
                            tabs: [
                              Tab(
                                  text: widget.checkRoll == "tenant"
                                      ? "Host"
                                      : 'Tenants'),
                              const Tab(text: 'Overview'),
                              const Tab(text: 'Near By'),
                            ],
                          ),
                          SizedBox(
                            height: 353,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 10),
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        tenantname(),
                                        const SizedBox(height: 15),
                                        widget.checkRoll == "tenant"
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 150,
                                                    child: CupertinoButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        color: kButtonColor,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(Icons.payment),
                                                            SizedBox(width: 10),
                                                            Text("Pay rent"),
                                                          ],
                                                        ),
                                                        onPressed: () {}),
                                                  ),
                                                  SizedBox(width: 10),
                                                  SizedBox(
                                                    width: 150,
                                                    child: CupertinoButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        color: kBlack87Color,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(Icons
                                                                .checklist_outlined),
                                                            SizedBox(width: 10),
                                                            Text("Checkout"),
                                                          ],
                                                        ),
                                                        onPressed: () {}),
                                                  ),
                                                ],
                                              )
                                            : TenantHistoryView()
                                      ],
                                    ),
                                  ),
                                  PropertyDetailsView(),
                                  const SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Near By",
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 15,
                                              fontFamily: kCircularStdNormal),
                                        ),
                                      ],
                                    ),
                                  ),
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

  // tenantRequest() {
  //   return Column(
  //     children: [
  //       Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(100),
  //             child: Image.asset(
  //               "assets/icons/boy 2.png",
  //               fit: BoxFit.cover,
  //               height: 35,
  //               width: 35,
  //             ),
  //           ),
  //           const SizedBox(width: 8),
  //           const Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 "Tenant Name",
  //                 style: TextStyle(
  //                     color: kPrimaryColor,
  //                     fontSize: 13,
  //                     fontFamily: kCircularStdMedium),
  //               ),
  //               Row(
  //                 children: [
  //                   Icon(
  //                     Icons.phone,
  //                     size: 12,
  //                     color: kButtonColor,
  //                   ),
  //                   SizedBox(width: 5),
  //                   Text(
  //                     "+91 9898567548",
  //                     style: TextStyle(
  //                         color: kPrimaryColor,
  //                         fontSize: 10,
  //                         fontFamily: kCircularStdNormal),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   Text(
  //                     "Pendding",
  //                     style: TextStyle(
  //                         color: kRedColor,
  //                         fontSize: 10,
  //                         fontFamily: kCircularStdNormal),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 10),
  //     ],
  //   );
  // }

  tenantname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/icons/boy 2.png",
                    fit: BoxFit.cover,
                    height: 65,
                    width: 65,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.checkRoll == "tenant"
                          ? "Host Name"
                          : "Tenant Name",
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                          fontFamily: kCircularStdMedium),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 15,
                          color: kButtonColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "+91 9898567548",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 13,
                              fontFamily: kCircularStdNormal),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.email,
                          size: 15,
                          color: kButtonColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "test@google.com",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 13,
                              fontFamily: kCircularStdNormal),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 15,
                          color: kButtonColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "01-7-2024 to 30-11-2024",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 13,
                              fontFamily: kCircularStdNormal),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            widget.checkRoll == "tenant"
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kButtonColor),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "Extend",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 11,
                                  fontFamily: kCircularStdNormal),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kButtonColor),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "Terminate",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 11,
                                  fontFamily: kCircularStdNormal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Monthly rent",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdNormal),
                ),
                Text(
                  "\$2540 / month",
                  style: TextStyle(
                      color: kSecondaryPrimaryColor,
                      fontSize: 12,
                      fontFamily: kCircularStdBook),
                ),
              ],
            ),
            Image.asset(
              "assets/icons/line_vertical.png",
              fit: BoxFit.cover,
              scale: 1.9,
              color: kSecondaryColor,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Deposit",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdNormal),
                ),
                Text(
                  "\$1800",
                  style: TextStyle(
                      color: kSecondaryPrimaryColor,
                      fontSize: 12,
                      fontFamily: kCircularStdBook),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
