import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/app_pages.dart';
import '../widgets/social_login_widget.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class NoUserLoginScreen extends StatefulWidget {
  final int? selectscreenIndex;
  const NoUserLoginScreen({Key? key, this.selectscreenIndex}) : super(key: key);

  @override
  State<NoUserLoginScreen> createState() => _NoUserLoginScreenState();
}

class _NoUserLoginScreenState extends State<NoUserLoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/Logo.png",
              height: 100,
              width: 200,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: size.width - 50,
            child: const Text(
              "The page you're trying to access has restricted access.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.5,
                  fontSize: 17,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: kCircularStdMedium),
            ),
          ),
          const SizedBox(height: 40),
          SocialLoginPage(
              checkRowOrColumn: 'column',
              selectscreenIndex: widget.selectscreenIndex),
          const SizedBox(height: 20),
          SizedBox(
            width: Get.width - 50,
            height: 50,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.toNamed(Routes.loginPage);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: kButtonColor,
                  borderRadius: BorderRadius.circular(9.0),
                  gradient: const LinearGradient(
                      colors: [kAppBackGround1Color, kAppBackGround2Color],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      tileMode: TileMode.repeated),
                ),
                child: const Center(
                  child: Text(
                    'Continue with Email',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontFamily: kCircularStdMedium,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
