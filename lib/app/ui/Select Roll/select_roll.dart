import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class SelectRollPage extends StatefulWidget {
  const SelectRollPage({super.key});

  @override
  State<SelectRollPage> createState() => _SelectRollPageState();
}

class _SelectRollPageState extends State<SelectRollPage> {
  bool rolltypeSelected = false;
  String rolltype = "tenant";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
      ),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Thank you for being \npart of us..",
                  style: TextStyle(
                      fontFamily: kCircularStdMedium,
                      fontSize: 22,
                      color: kPrimaryColor),
                ),
                Image.asset(
                  "assets/house101.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 25),
                Container(
                  height: 80,
                  width: Get.width,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: RadioListTile(
                      dense: true,
                      title: const Text(
                        "A Tenant",
                        style: TextStyle(
                            fontSize: 20,
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium),
                      ),
                      value: "tenant",
                      groupValue: rolltype,
                      onChanged: (value) {
                        setState(() {
                          rolltype = value.toString();
                          rolltypeSelected = true;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 80,
                  width: Get.width,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: RadioListTile(
                      dense: true,
                      title: const Text(
                        "A Landlord",
                        style: TextStyle(
                            fontSize: 20,
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium),
                      ),
                      value: "landload",
                      groupValue: rolltype,
                      onChanged: (value) {
                        setState(() {
                          rolltype = value.toString();
                          rolltypeSelected = true;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // const Text(
                //   "Welcome",
                //   style: TextStyle(
                //       fontFamily: kCircularStdMedium,
                //       fontSize: 15,
                //       color: kPrimaryColor),
                // ),
                // const Text(
                //   "Open House",
                //   style: TextStyle(
                //       fontFamily: kCircularStdBold,
                //       fontSize: 35,
                //       color: kPrimaryColor),
                // ),
                // const SizedBox(height: 30),
                // CupertinoButton(
                //   padding: EdgeInsets.zero,
                //   onPressed: () {
                //     Get.toNamed(Routes.loginPage);
                //   },
                //   child: Container(
                //     height: 50,
                //     width: Get.width,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(25),
                //         border: Border.all(color: kWhiteColor),
                //         color: kButtonColor),
                //     child: const Center(
                //       child: Text(
                //         "Login",
                //         style: TextStyle(
                //             color: kWhiteColor,
                //             fontFamily: kCircularStdNormal,
                //             fontSize: 18),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 15),
                // CupertinoButton(
                //   padding: EdgeInsets.zero,
                //   onPressed: () {
                //     Get.toNamed(Routes.signUpPage);
                //   },
                //   child: Container(
                //     height: 45,
                //     width: Get.width,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(25),
                //         border: Border.all(color: kWhiteColor),
                //         color: kButtonColor),
                //     child: const Center(
                //       child: Text(
                //         "Sign Up",
                //         style: TextStyle(
                //             color: kWhiteColor,
                //             fontFamily: kCircularStdNormal,
                //             fontSize: 18),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
