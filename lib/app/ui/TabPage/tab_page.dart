import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controller/tab_controller.dart';
import '../Home/home.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class TabPage extends StatefulWidget {
  final String? firstIndex;
  final int? selectedTabIndex;
  const TabPage({super.key, this.firstIndex, this.selectedTabIndex = 0});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  // FCMNotificationServices fCMNotificationServices = FCMNotificationServices();
  String authToken = "";
  final controller = Get.put(TabCountController());
  final TextStyle unselectedLabelStyle = const TextStyle(
      color: kBlack45Color, fontFamily: kCircularStdNormal, fontSize: 11);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Color.fromARGB(255, 63, 168, 248),
      fontFamily: kCircularStdNormal,
      fontSize: 11);

  @override
  void initState() {
    super.initState();
    // fCMNotificationServices.requestNotificationPermission();
    // notificationServices.isTokenRefresh();
    // fCMNotificationServices.firebaseInit();
    // fCMNotificationServices.getDeviceToken().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    final TabCountController tabCountController =
        Get.put(TabCountController(), permanent: false);

    return GetBuilder<TabCountController>(
      builder: (context) {
        return Scaffold(
          body: Obx(
            () => Stack(
              children: [
                IndexedStack(
                  index: tabCountController.tabIndex.value,
                  children: const [
                    HomePage(),
                    HomePage(),
                    HomePage(),
                    HomePage(),
                    HomePage(),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      shadowColor: Color.fromARGB(118, 0, 0, 0),
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.only(top: Platform.isIOS ? 8 : 0),
                        height: Platform.isIOS ? 100 : 68,
                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: kWhiteColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildBottomTab(
                                    0, "Home", "assets/icons/gridview.png"),
                                const SizedBox(width: 25),
                                buildBottomTab(
                                    1, "Property", "assets/icons/homeicon.png"),
                                const SizedBox(width: 25),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    tabCountController.changeTabIndex(3);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: kRedColor,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Image.asset(
                                      "assets/icons/Plus.png",
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 25),
                                buildBottomTab(
                                    3, "Payment", "assets/icons/phone.png"),
                                const SizedBox(width: 25),
                                buildBottomTab(
                                    4, "Profile", "assets/icons/profile.png"),
                              ],
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  buildBottomTab(int index, String title, String image) {
    final TabCountController tabCountController =
        Get.put(TabCountController(), permanent: false);
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        tabCountController.changeTabIndex(index);
      },
      child: SizedBox(
        height: title == "Home" ? 25 : 34,
        child: Image.asset(
          image,
          color: kPrimaryColor,
          scale: 1.5,
        ),
      ),
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(
      () => SizedBox(
        height: Platform.isIOS ? 105 : 68,
        child: Theme(
          data: ThemeData(
            splashColor: kTransparentColor,
            highlightColor: kTransparentColor,
          ),
          child: BottomNavigationBar(
            elevation: 1,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: kBackGroundColor,
            unselectedItemColor: kBlack45Color,
            selectedItemColor: kAppBackGround2Color,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 11, top: 6),
                  child: Image.asset(
                    "assets/icons/homeicon.png",
                    color: controller.tabIndex.value == 0
                        ? kAppBackGround2Color
                        : kBlack45Color,
                    height: 20,
                    width: 20,
                  ),
                ),
                label: 'Home',
                backgroundColor: kBackGroundColor,
              ),

              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 11, top: 6),
                  child: Image.asset(
                    "assets/icons/file.png",
                    color: controller.tabIndex.value == 1
                        ? kAppBackGround2Color
                        : kBlack45Color,
                    height: 20,
                    width: 20,
                  ),
                ),
                label: 'e',
                backgroundColor: kBackGroundColor,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 0, top: 0),
                  child: Image.asset(
                    "assets/icons/recodingicon.png",
                    height: 38,
                    width: 40,
                  ),
                ),
                label: 'e',
              ),
              // BottomNavigationBarItem(
              //   icon: Container(
              //     margin: const EdgeInsets.only(bottom: 0, top: 0),
              //     child: Image.asset(
              //       "assets/icons/create.png",
              //       height: 38,
              //       width: 38,
              //     ),
              //   ),
              //   label: 'Create',
              //   backgroundColor: kBackGroundColor,
              // ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 5),
                  child: Image.asset(
                    "assets/icons/pencolor.png",
                    color: controller.tabIndex.value == 3
                        ? kAppBackGround2Color
                        : kBlack45Color,
                    height: 22,
                    width: 22,
                  ),
                ),
                label: 'e',
                backgroundColor: kBackGroundColor,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 11, top: 6),
                  child: Image.asset(
                    "assets/icons/User.png",
                    color: controller.tabIndex.value == 4
                        ? kAppBackGround2Color
                        : kBlack45Color,
                    height: 20,
                    width: 20,
                  ),
                ),
                label: 'e',
                backgroundColor: kBackGroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
