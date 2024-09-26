import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:openhome/app/ui/Auth/Login/login.dart';
import 'package:openhome/app/ui/TabPage/tab_page.dart';
import 'package:openhome/config/constant/color_constant.dart';

import '../../../config/constant/constant.dart';
import '../../../config/constant/font_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? appflow = 0;
  @override
  void initState() {
    appflow = getStorage.read("appFlow") ?? 0;
    Future.delayed(const Duration(seconds: 2), () {
      if (appflow == 1) {
        Get.offAll(() => const TabPage());
      } else {
        Get.offAll(() => const LoginPage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kButtonColor,
        body: Center(
          child: TweenAnimationBuilder(
            tween: Tween(begin: 1.0, end: 1.7),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
            child: const Text(
              "OpenHouse",
              style: TextStyle(
                  fontFamily: kCircularStdBold,
                  color: kWhiteColor,
                  fontSize: 25),
            ),
          ),
        ));
  }
}
