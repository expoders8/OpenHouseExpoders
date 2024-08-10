import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class PropertyPage extends StatefulWidget {
  const PropertyPage({super.key});

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

// Add the `with SingleTickerProviderStateMixin` mixin to the state class
class _PropertyPageState extends State<PropertyPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController with `this` as the vsync
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Text(
            "My Properties",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: kButtonColor,
            labelColor: kPrimaryColor,
            tabs: const [
              Tab(text: 'On Lease'),
              Tab(text: 'Others'),
            ],
          ),
          backgroundColor: kBackGroundColor,
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  children: [
                    leaseproperty(
                        "assets/icons/1.png",
                        "\$2550",
                        "101 Main Street",
                        "2",
                        "Tenant Name",
                        "\$15,200",
                        "\$220",
                        "12-06-2021"),
                    const SizedBox(height: 15),
                    leaseproperty(
                        "assets/icons/2.png",
                        "\$1520",
                        "3545 Robson St, Vancouver",
                        "1",
                        "Tenant Name",
                        "\$10,105",
                        "\$108",
                        "25-06-2021"),
                    const SizedBox(height: 15),
                    leaseproperty(
                        "assets/icons/3.png",
                        "\$1850",
                        "224 Robson St, Vancouver",
                        "2",
                        "Tenant Name",
                        "\$10,105",
                        "\$108",
                        "25-06-2021"),
                    const SizedBox(height: 15),
                    const SizedBox(height: 75),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  children: [
                    property("assets/icons/1.png", "\$2550", "101 Main Street",
                        "2", "Tenant Name", "\$15,200", "\$220", "12-06-2021"),
                    const SizedBox(height: 15),
                    property(
                        "assets/icons/2.png",
                        "\$1520",
                        "3545 Robson St, Vancouver",
                        "1",
                        "Tenant Name",
                        "\$10,105",
                        "\$108",
                        "25-06-2021"),
                    const SizedBox(height: 15),
                    property(
                        "assets/icons/3.png",
                        "\$1850",
                        "224 Robson St, Vancouver",
                        "2",
                        "Tenant Name",
                        "\$10,105",
                        "\$108",
                        "25-06-2021"),
                    const SizedBox(height: 15),
                    const SizedBox(height: 75),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  leaseproperty(String image, price, address, person, tenantname, balancedue,
      rentdue, expiredate) {
    return Container(
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
                        const SizedBox(
                          width: 10,
                        ),
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
                        const SizedBox(
                          width: 10,
                        ),
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
            const SizedBox(
              height: 15,
            ),
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
                            color: kPrimaryColor),
                      ),
                      Text(
                        expiredate,
                        style: const TextStyle(
                            fontFamily: kCircularStdMedium,
                            fontSize: 17,
                            color: kPrimaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  property(String image, price, address, person, tenantname, balancedue,
      rentdue, expiredate) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: kWhiteColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    scale: 1.2,
                    height: 95,
                    width: 95,
                  ),
                ),
                const SizedBox(
                  width: 15,
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
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: Get.width - 220,
                          child: Text(
                            person,
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 13,
                                fontFamily: kCircularStdBold),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width - 180,
                    child: const Text(
                      "Housekeeping || Internet",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13,
                          fontFamily: kCircularStdNormal),
                    ),
                  ),
                  SizedBox(
                    width: Get.width - 180,
                    child: const Text(
                      "Gas || Electricity",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13,
                          fontFamily: kCircularStdNormal),
                    ),
                  ),
                  SizedBox(
                    width: Get.width - 180,
                    child: const Text(
                      "Parking || CCTV camera",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13,
                          fontFamily: kCircularStdNormal),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
