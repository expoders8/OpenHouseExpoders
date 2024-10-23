import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Home/home_host.dart';
import '../Home/home_tenant.dart';
import '../My Host/my_host.dart';
import '../Payment/payment.dart';
import '../Property/property.dart';
import '../My Tenants/my_tenant.dart';
import '../Home/create_my_requests.dart';
import '../../controller/tab_controller.dart';
import '../CreateProperty/create_property.dart';
import '../../../config/constant/constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class TabPage extends StatefulWidget {
  final String? firstIndex;
  final int? selectedTabIndex;
  const TabPage({
    super.key,
    this.firstIndex,
    this.selectedTabIndex = 0,
  });

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with WidgetsBindingObserver {
  // FCMNotificationServices fCMNotificationServices = FCMNotificationServices();
  String authToken = "";
  String selectedRoll = "";
  bool _isKeyboardVisible = false;
  final controller = Get.put(TabCountController());
  final TextStyle unselectedLabelStyle = const TextStyle(
      color: kBlack45Color, fontFamily: kCircularStdNormal, fontSize: 11);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Color.fromARGB(255, 63, 168, 248),
      fontFamily: kCircularStdNormal,
      fontSize: 11);
  final tabController = Get.put(TabCountController());
  @override
  void initState() {
    super.initState();
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
    });
    // fCMNotificationServices.requestNotificationPermission();
    // notificationServices.isTokenRefresh();
    // fCMNotificationServices.firebaseInit();
    // fCMNotificationServices.getDeviceToken().then((value) => print(value));
    // if (widget.selectedTabIndex != 0) {
    //   tabController.changeTabIndex(1);
    // }
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    // ignore: deprecated_member_use
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      _isKeyboardVisible = bottomInset > 0;
    });
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
                  children: [
                    selectedRoll == "tenant"
                        ? const HomeTenantPage()
                        : const HomeHostPage(),
                    const PropertyPage(),
                    selectedRoll == "tenant"
                        ? const CreateMyRequestsPage()
                        : const CreatePropertyPage(),
                    const PaymentPage(),
                    selectedRoll == "tenant"
                        ? const MyHostsPage()
                        : const MyTenantsPage(),
                    //
                  ],
                ),
                !_isKeyboardVisible
                    ? Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Card(
                            shadowColor: const Color.fromARGB(118, 0, 0, 0),
                            elevation: 5,
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: Platform.isAndroid ? 0 : 3),
                              height: 68,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: kWhiteColor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      buildBottomTab(0, "Home",
                                          "assets/icons/homeicon.png"),
                                      const SizedBox(width: 20),
                                      buildBottomTab(1, "Property",
                                          "assets/icons/property.png"),
                                      const SizedBox(width: 20),
                                      CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          tabCountController.changeTabIndex(2);
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Image.asset(
                                            "assets/icons/tablogo.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      buildBottomTab(3, "Payment",
                                          "assets/icons/payment.png"),
                                      const SizedBox(width: 20),
                                      buildBottomTab(4, "Profile",
                                          "assets/icons/people.png"),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      )
                    : Container()
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
        height: title == "Home"
            ? 25
            : title == "Payment"
                ? 25
                : title == "MyTenant"
                    ? 38
                    : title == "Property"
                        ? 25
                        : 35,
        child: Image.asset(
          image,
          color: tabCountController.tabIndex.value == index
              ? kButtonColor
              : kPrimaryColor,
          scale: 1.5,
        ),
      ),
    );
  }

 
}
