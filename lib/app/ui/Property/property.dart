import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/app_pages.dart';
import '../../view/lease_property_view.dart';
import '../../view/current_property_view.dart';
import '../../../config/constant/constant.dart';
import '../../view/previous_property_view.dart';
import '../../view/not_lease_property_view.dart';
import '../../controller/property_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class PropertyPage extends StatefulWidget {
  const PropertyPage({super.key});

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage>
    with SingleTickerProviderStateMixin {
  String selectedRoll = "";
  late TabController _tabController;
  var leasesearchController = TextEditingController();
  var currentsearchController = TextEditingController();
  var previoussearchController = TextEditingController();
  var notleasesearchController = TextEditingController();
  final GetAvailablePropertyController getAvailablePropertyController =
      Get.put(GetAvailablePropertyController());
  final GetLeasePropertyController getLeasePropertyController =
      Get.put(GetLeasePropertyController());
  final GetCurrentPropertyController getCurrentPropertyController =
      Get.put(GetCurrentPropertyController());
  String userImage = "",
      authToken = "",
      firstName = "",
      lastName = "",
      firstlater = "",
      lastlatter = "";
  @override
  void initState() {
    super.initState();
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
    });
    getuser();
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: selectedRoll == "tenant" ? 0 : 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        toolbarHeight: 45,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedRoll == "tenant"
                  ? "On Lease Properties"
                  : "My Properties",
              style:
                  const TextStyle(fontFamily: kCircularStdBold, fontSize: 18),
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
        backgroundColor: kBackGroundColor,
        actions: [
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
                              width: 33,
                              height: 33,
                              fit: BoxFit.cover,
                            ),
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return SizedBox(
                                width: 33,
                                height: 33,
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: selectedRoll == "tenant"
              ? Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      indicatorColor: kButtonColor,
                      labelColor: kPrimaryColor,
                      tabs: const [
                        Tab(text: 'Current Properties'),
                        Tab(text: 'Previous Properties'),
                      ],
                    ),
                    Flexible(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: const CurrentPropertyView(),
                          ),
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: const PreviousPropertyView(),
                          ),
                          // Column(
                          //   children: [
                          //     const SizedBox(height: 10),
                          //     TextFormField(
                          //       controller: previoussearchController,
                          //       decoration: InputDecoration(
                          //         contentPadding:
                          //             const EdgeInsets.fromLTRB(13, 0, 10, 0),
                          //         prefixIcon: const Icon(Icons.search),
                          //         filled: true,
                          //         fillColor: kWhiteColor,
                          //         hintText: 'Search',
                          //         hintStyle: const TextStyle(
                          //             color: kSecondaryPrimaryColor,
                          //             fontFamily: kCircularStdNormal,
                          //             fontWeight: FontWeight.w400,
                          //             fontSize: 16),
                          //         border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(25.0),
                          //           borderSide:
                          //               const BorderSide(color: kWhiteColor),
                          //         ),
                          //         enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(25.0),
                          //           borderSide:
                          //               const BorderSide(color: kWhiteColor),
                          //         ),
                          //         focusedBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(25.0),
                          //           borderSide:
                          //               const BorderSide(color: kWhiteColor),
                          //         ),
                          //       ),
                          //     ),
                          //     const SizedBox(height: 10),
                          //     const PreviousPropertyView(),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      indicatorColor: kButtonColor,
                      labelColor: kPrimaryColor,
                      tabs: const [
                        Tab(text: 'On lease'),
                        Tab(text: 'Available'),
                      ],
                    ),
                    Flexible(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: const LeasePropertyView(),
                          ),
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: const NotLeasePropertyView(),
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
