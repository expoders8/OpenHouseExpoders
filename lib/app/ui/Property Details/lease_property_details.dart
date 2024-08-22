import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:openhome/app/view/tenant_history_view.dart';
import 'package:openhome/app/view/property_details_view.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

import '../../../config/constant/constant.dart';
import '../../view/nearby_view.dart';
import '../../view/payment_detail_view.dart';
import '../CreateProperty/create_property.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class LeasePropertyDetailPage extends StatefulWidget {
  const LeasePropertyDetailPage({
    super.key,
  });

  @override
  State<LeasePropertyDetailPage> createState() =>
      _LeasePropertyDetailPageeState();
}

class _LeasePropertyDetailPageeState extends State<LeasePropertyDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedRoll = "";

  @override
  void initState() {
    super.initState();
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
    });
    _tabController = TabController(length: 5, vsync: this);
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
                    padding: EdgeInsets.only(left: 8.5),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kPrimaryColor,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ),
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
                              selectedRoll == "tenant"
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
                            tabAlignment: TabAlignment.start,
                            controller: _tabController,
                            indicatorColor: kButtonColor,
                            isScrollable: true,
                            labelColor: kPrimaryColor,
                            tabs: [
                              Tab(
                                  text: selectedRoll == "tenant"
                                      ? "Host"
                                      : 'Tenants'),
                              const Tab(
                                text: 'Overview',
                              ),
                              const Tab(text: 'Near By'),
                              Tab(
                                  text: selectedRoll == "tenant"
                                      ? "Amenities"
                                      : 'Payment'),
                              const Tab(text: 'Expense'),
                            ],
                          ),
                          SizedBox(
                            height: Get.height / 2.02825,
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
                                      selectedRoll == "tenant"
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 150,
                                                  child: CupertinoButton(
                                                      padding: EdgeInsets.zero,
                                                      color: kButtonColor,
                                                      child: const Row(
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
                                                const SizedBox(width: 10),
                                                SizedBox(
                                                  width: 150,
                                                  child: CupertinoButton(
                                                      padding: EdgeInsets.zero,
                                                      color: kBlack87Color,
                                                      child: const Row(
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
                                          : const TenantHistoryView()
                                    ],
                                  ),
                                ),
                                const PropertyDetailsView(),
                                const NearByAmenitiesView(),
                                selectedRoll == "tenant"
                                    ? SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),
                                            GestureDetector(
                                              onTap: () {
                                                _bottomSheetForChackout();
                                              },
                                              child: otheractivities(
                                                  "Before you leave",
                                                  "How to check out",
                                                  Icons.door_front_door),
                                            ),
                                            otheractivities(
                                                "Connecting to wifi",
                                                "Network: Expo",
                                                Icons.wifi),
                                            otheractivities(
                                                "Things to know",
                                                "Instructions and house rules",
                                                Icons.menu_book_rounded),
                                            otheractivities("Message your host",
                                                "Host Name", Icons.message),
                                          ],
                                        ),
                                      )
                                    : const PaymentView(),
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      routingmaintanance("Electricity", "\$105",
                                          Icons.electric_bolt_sharp),
                                      routingmaintanance("Gas", "\$99",
                                          Icons.gas_meter_rounded),
                                      routingmaintanance("Repair", "\$65",
                                          Icons.manage_history_sharp),
                                      routingmaintanance(
                                          "Internet",
                                          "\$46",
                                          Icons
                                              .signal_wifi_statusbar_connected_no_internet_4_sharp),
                                    ],
                                  ),
                                ),
                              ],
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

  routingmaintanance(String title, amount, IconData icons) {
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
              Text(
                title,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                    fontFamily: kCircularStdMedium),
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontFamily: kCircularStdMedium),
          ),
        ],
      ),
    );
  }

  _bottomSheetForChackout() {
    return showModalBottomSheet<dynamic>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: kWhiteColor,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            const Center(
              child: ImageIcon(
                AssetImage("assets/icons/line.png"),
                size: 30,
                color: Color(0XffBFC5CC),
              ),
            ),
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'How to check out',
                          style: TextStyle(
                              fontSize: 17,
                              color: kPrimaryColor,
                              fontFamily: kCircularStdBold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const ListTile(
                      leading: Icon(Icons.delete),
                      title: Text(
                        'Throw trash away',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontFamily: kCircularStdMedium),
                      ),
                      subtitle: Text(
                        'Ensure all perishable trash especially left over food is put in the trash bin and not left on the kitchen counter so no bugs can fester.',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 11,
                            fontFamily: kCircularStdNormal),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.power_settings_new),
                      title: Text(
                        'Turn things off',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontFamily: kCircularStdMedium),
                      ),
                      subtitle: Text(
                        'Kindly switch off the shower heater, lights in each room and electronic appliances. You can leave the fridge switched on.',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 11,
                            fontFamily: kCircularStdNormal),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.lock),
                      title: Text(
                        'Lock up',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontFamily: kCircularStdMedium),
                      ),
                      subtitle: Text(
                        'Kindly close all the windows and lock the door when checking out. A friendly reminder that check out time is at/before 10am.',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 11,
                            fontFamily: kCircularStdNormal),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.key),
                      title: Text(
                        'Return keys',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontFamily: kCircularStdMedium),
                      ),
                      subtitle: Text(
                        'At check out, kindly return the key back to the lock box and secure the lock box.',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 11,
                            fontFamily: kCircularStdNormal),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.request_page),
                      title: Text(
                        'Additional requests',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontFamily: kCircularStdMedium),
                      ),
                      subtitle: Text(
                        'Before you leave don’t forget to double check that you have all your belongings. The host will not be liable for any items left in the apartment.',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 11,
                            fontFamily: kCircularStdNormal),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Container(
                        height: 40,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: kWhiteColor),
                            color: kButtonColor),
                        child: const Center(
                          child: Text(
                            "Send Request",
                            style: TextStyle(
                                color: kWhiteColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  otheractivities(String title, subtitle, IconData icons) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icons,
            size: 25,
            color: kButtonColor,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 17,
                    fontFamily: kCircularStdMedium),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 12,
                    fontFamily: kCircularStdNormal),
              ),
            ],
          ),
        ],
      ),
    );
  }

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
                      selectedRoll == "tenant" ? "Host Name" : "Tenant Name",
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
            selectedRoll == "tenant"
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
