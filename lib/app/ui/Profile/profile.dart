import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:openhome/app/routes/app_pages.dart';

import '../Auth/Login/login.dart';
import '../TabPage/tab_page.dart';
import '../../../config/constant/constant.dart';
import '../../services/firebase_auth_service.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedRoll = "";
  String userName = "";
  String email = "";
  String phoneNo = "";
  String userImage = "";

  @override
  void initState() {
    var roll = getStorage.read('roll') ?? "";
    getuser();
    setState(() {
      selectedRoll = roll;
    });
    super.initState();
  }

  getuser() {
    var user = getStorage.read('user');
    var userData = jsonDecode(user);
    if (userData != null) {
      userName = userData["first_name"] + " " + userData["last_name"] ?? "";
      email = userData["email"] ?? "";
      phoneNo = userData["phone_number"] ?? "";
      userImage = userData["profile_picture"] ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
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
                                onTap: () async {
                                  await Get.toNamed(Routes.editProfilePage)!
                                      .then(
                                    (value) {
                                      setState(() {
                                        getuser();
                                      });
                                    },
                                  );
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
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 0.0, bottom: 10),
                                child: Text(
                                  userName,
                                  style: const TextStyle(
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
                        child: userImage != ""
                            ? Image.network(
                                userImage,
                                fit: BoxFit.cover,
                                height: 110,
                                width: 110,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/blank_profile.png",
                                    fit: BoxFit.cover,
                                    height: 110,
                                    width: 110,
                                  );
                                },
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return SizedBox(
                                    height: 110,
                                    width: 110,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: kPrimaryColor,
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Image.asset(
                                "assets/images/blank_profile.png",
                                fit: BoxFit.cover,
                                height: 110,
                                width: 110,
                              ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0, top: 10),
                    child: Column(
                      children: [
                        // ignore: unnecessary_null_comparison
                        phoneNo != ""
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    size: 18,
                                    color: kButtonColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    phoneNo,
                                    style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 12,
                                        fontFamily: kCircularStdMedium),
                                  ),
                                ],
                              )
                            : Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.email_outlined,
                              size: 18,
                              color: kButtonColor,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              email,
                              style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 12,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: phoneNo != "" ? 40 : 60),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  var url = "https://www.google.com";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw "Could not launch $url";
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                          SizedBox(width: 10),
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
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  var url = "https://www.google.com";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw "Could not launch $url";
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                          SizedBox(width: 10),
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
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  var url = "https://www.google.com";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw "Could not launch $url";
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                          SizedBox(width: 10),
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
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Get.toNamed(Routes.changePasswordPage);
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                          SizedBox(width: 10),
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
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (selectedRoll == "host") {
                    getStorage.write('roll', "tenant");
                    Get.offAll(const TabPage());
                  } else {
                    getStorage.write('roll', "host");
                    Get.offAll(const TabPage());
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                          const SizedBox(width: 10),
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
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: logoutConfirmationDialog,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(18, 0, 17, 16),
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
                          SizedBox(width: 10),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  logoutConfirmationDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert !"),
        elevation: 5,
        titleTextStyle: const TextStyle(fontSize: 18, color: kRedColor),
        content: const Text("Are you sure want to logout?"),
        contentPadding: const EdgeInsets.only(left: 25, top: 10),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              // FirebaseAuthServices().signOut();
              getStorage.remove('user');
              getStorage.remove('authToken');
              getStorage.remove('appFlow');
              FirebaseAuthServices().signOut();
              Get.offAll(() => const LoginPage());
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

  details(String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 30,
          color: kButtonColor,
        ),
        const SizedBox(width: 10),
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
