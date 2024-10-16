import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:openhome/config/constant/font_constant.dart';

import '../../../config/constant/color_constant.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);
  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Container(
        color: kBackGroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: Lottie.asset(
                  'assets/nointernet.json',
                  width: 330,
                  height: 330,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const DefaultTextStyle(
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
              child: Text('No Internet Connection'),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: kCircularStdBook,
                    color: kSecondaryPrimaryColor),
                child: Text(
                    'You are not connected to the internet. Make sure Internet is on, Airplane Mode is off.'),
              ),
            ),
            SizedBox(
              width: 170,
              child: CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: kButtonColor,
                onPressed: () async {
                  AppSettings.openAppSettings();
                },
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Go to Settings',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: kCircularStdMedium,
                          color: kWhiteColor),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                        height: 20, width: 20, child: Icon(Icons.settings)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
