import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/app_pages.dart';
import '../../controller/tab_controller.dart';
import '../../../config/constant/constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedRoll = "";
  final tabController = Get.put(TabCountController());
  String userImage = "",
      authToken = "",
      firstName = "",
      lastName = "",
      firstlater = "",
      lastlatter = "";
  @override
  void initState() {
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
    });
    getuser();
    super.initState();
  }

  getuser() {
    var user = getStorage.read('user');
    var userData = jsonDecode(user);
    if (userData != null) {
      userImage = userData["profile_picture"] ?? "";
      firstName = userData['first_name'] ?? "";
      lastName = userData['last_name'] ?? "";
      firstlater = firstName[0];
      lastlatter = lastName[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "OpenHouse",
              style: TextStyle(fontFamily: kCircularStdBold, fontSize: 18),
            ),
            const SizedBox(width: 3),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: kButtonColor),
              child: Center(
                child: Text(
                  '${selectedRoll[0].toUpperCase()}${selectedRoll.substring(1)}',
                  style: const TextStyle(
                    color: kWhiteColor,
                    fontSize: 10,
                    fontFamily: kCircularStdNormal,
                  ),
                ),
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.toNamed(Routes.notificationPage);
            },
            child: Image.asset(
              "assets/icons/notification.png",
              fit: BoxFit.cover,
              height: 33,
              width: 33,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.toNamed(Routes.profilePage);
              },
              child: ClipOval(
                child: Material(
                    child: userImage != ""
                        ? Image.network(
                            userImage,
                            width: 30,
                            height: 30,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              "assets/images/blank_profile.png",
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return SizedBox(
                                width: 30,
                                height: 30,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: kPrimaryColor,
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            height: 36,
                            width: 36,
                            color: kTransparentColor,
                            child: Center(
                                child: Text(
                              "$firstlater$lastlatter".toUpperCase(),
                              style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdNormal),
                            )),
                          )),
              ),
            ),
          ),
        ],
        backgroundColor: kBackGroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: selectedRoll == "tenant"
              ? SizedBox(
                  height: Get.height - 85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 80),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 3.0,
                        childAspectRatio: 1,
                      ),
                      children: const [
                        ResponsiveContainer(
                          icon: Icons.build,
                          name: 'Tenant Service\nRequest',
                        ),
                        ResponsiveContainer(
                          icon: Icons.logout,
                          name: "Checkout Requests",
                        ),
                        ResponsiveContainer(
                          icon: Icons.insert_invitation_rounded,
                          name: "Property Invitations",
                        ),
                        ResponsiveContainer(
                          icon: Icons.bungalow_outlined,
                          name: "Check-In as\nRepeat Tenants",
                        ),
                        ResponsiveContainer(
                          icon: Icons.chat,
                          name: "Chat with Host",
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(
                  height: Get.height - 85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 80),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 3.0,
                        childAspectRatio: 1,
                      ),
                      children: const [
                        ResponsiveContainer(
                          icon: Icons.home,
                          name: 'Manage All\nYour Properties',
                        ),
                        ResponsiveContainer(
                          icon: Icons.build,
                          name: "Manage Tenants' Service Requests",
                        ),
                        ResponsiveContainer(
                          icon: Icons.exit_to_app,
                          name: "Track Check-Out Requests",
                        ),
                        ResponsiveContainer(
                          icon: Icons.calendar_today,
                          name: "Track Lease\nExtensions",
                        ),
                        ResponsiveContainer(
                          icon: Icons.trending_up,
                          name: "Track Property\nIncome",
                        ),
                        ResponsiveContainer(
                          icon: Icons.trending_down,
                          name: "Track Property\nExpenses",
                        ),
                        ResponsiveContainer(
                          icon: Icons.trending_down,
                          name: "Chat with Tenants",
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class ResponsiveGridView extends StatelessWidget {
  const ResponsiveGridView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int gridColumns;
    if (screenWidth <= 600) {
      gridColumns = 2;
    } else if (screenWidth <= 900) {
      gridColumns = 3;
    } else {
      gridColumns = 4;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridColumns,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ResponsiveContainer(
              icon: Icons.home,
              name: 'Item $index',
            );
          },
        ),
      ),
    );
  }
}

class ResponsiveContainer extends StatelessWidget {
  final IconData icon;
  final String name;

  const ResponsiveContainer(
      {super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    final tabController = Get.put(TabCountController());
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        if (name == "Manage All\nYour Properties") {
          tabController.changeTabIndex(1);
        } else if (name == "Manage Tenants' Service Requests") {
          Get.toNamed(Routes.tenantRequestAllView);
        } else if (name == "Track Check-Out Requests") {
          Get.toNamed(Routes.checkoutRequestsPage);
        } else if (name == "Tenant Service\nRequest") {
          Get.toNamed(Routes.myRequestViewAllView);
        } else if (name == "Property Invitations") {
          Get.toNamed(Routes.invitationshowPage);
        } else if (name == "Track Lease\nExtensions") {
          Get.toNamed(Routes.trackLeaseExtensionPage);
        } else if (name == "Track Property\nExpenses") {
          Get.toNamed(Routes.trackLeaseExpensesPage);
        } else if (name == "Track Property\nIncome") {
          Get.toNamed(Routes.trackPropertyIncomePage);
        } else if (name == "Chat with Host") {
          Get.toNamed(Routes.messagePage);
        } else if (name == "Chat with Tenants") {
          Get.toNamed(Routes.messagePage);
        } else if (name == "Checkout Requests") {
          Get.toNamed(Routes.checkoutRequestsTenantPage);
        }
      },
      child: Card(
        elevation: 5,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: kButtonColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 31,
                color: kButtonColor,
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: kCircularStdMedium,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
