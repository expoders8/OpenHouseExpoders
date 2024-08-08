import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:openhome/config/constant/color_constant.dart';
import 'package:openhome/config/constant/font_constant.dart';

import '../../routes/app_pages.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  "assets/house101.png",
                  fit: BoxFit.cover,
                  scale: 1.2,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(
                      fontFamily: kCircularStdMedium,
                      fontSize: 15,
                      color: kPrimaryColor),
                ),
                const Text(
                  "Open House",
                  style: TextStyle(
                      fontFamily: kCircularStdBold,
                      fontSize: 35,
                      color: kPrimaryColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Get.toNamed(Routes.loginPage);
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: kWhiteColor),
                        color: kButtonColor),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: kWhiteColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Get.toNamed(Routes.signUpPage);
                  },
                  child: Container(
                    height: 45,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: kWhiteColor),
                        color: kButtonColor),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: kWhiteColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
