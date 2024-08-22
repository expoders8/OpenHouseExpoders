import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:openhome/app/routes/app_pages.dart';

import '../../../config/constant/constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../TabPage/tab_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedRoll = "";
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
          "Profile",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kBackGroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: Get.width,
                    height: 130,
                    decoration: const BoxDecoration(
                      color: kButtonColor,
                      gradient: LinearGradient(
                        colors: [kButtonColor, kBlackColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.editProfilePage);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(color: kWhiteColor)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.edit,
                                        size: 20,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(right: 0.0, bottom: 10),
                                child: Text(
                                  "Host Name",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontFamily: kCircularStdBold,
                                      fontSize: 23),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 25,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: kWhiteColor, width: 2),
                          borderRadius: BorderRadius.circular(1000)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/icons/boy 1.png",
                          fit: BoxFit.cover,
                          scale: 1.2,
                          height: 110,
                          width: 110,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 28.0, top: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 18,
                              color: kButtonColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "+91 9898567548",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 18,
                              color: kButtonColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "test@google.com",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.people,
                          size: 18,
                          color: kButtonColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Tenants Details",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontFamily: kCircularStdMedium),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 13,
                      color: kButtonColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_search,
                          size: 18,
                          color: kButtonColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Requests",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontFamily: kCircularStdMedium),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 13,
                      color: kButtonColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.security,
                          size: 18,
                          color: kButtonColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Privacy and Security",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontFamily: kCircularStdMedium),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 13,
                      color: kButtonColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.perm_device_info_rounded,
                          size: 18,
                          color: kButtonColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Terms and conditions",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontFamily: kCircularStdMedium),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 13,
                      color: kButtonColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.help_center_outlined,
                          size: 18,
                          color: kButtonColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Help Us",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontFamily: kCircularStdMedium),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 13,
                      color: kButtonColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.changePasswordPage);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lock,
                            size: 18,
                            color: kButtonColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Change Password",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontFamily: kCircularStdMedium),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                        color: kButtonColor,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              GestureDetector(
                onTap: () {
                  if (selectedRoll == "tenant") {
                    getStorage.write('roll', "host");
                    Get.offAll(const TabPage());
                  } else {
                    getStorage.write('roll', "tenant");
                    Get.offAll(const TabPage());
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.sync,
                            size: 18,
                            color: kButtonColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Swich To ${selectedRoll == "tenant" ? "Host" : "Tenant"}",
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontFamily: kCircularStdMedium),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                        color: kButtonColor,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.logout,
                          size: 18,
                          color: kButtonColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Log out",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontFamily: kCircularStdMedium),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 13,
                      color: kButtonColor,
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

  details(String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 30,
          color: kButtonColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 22,
              fontFamily: kCircularStdMedium),
        ),
      ],
    );
  }
}
