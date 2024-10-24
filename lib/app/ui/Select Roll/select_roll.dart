import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../controller/auth_controller.dart';
import '../../../config/constant/constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/loader_provider.dart';

class SelectRollPage extends StatefulWidget {
  const SelectRollPage({super.key});

  @override
  State<SelectRollPage> createState() => _SelectRollPageState();
}

class _SelectRollPageState extends State<SelectRollPage> {
  String rolltype = "";
  bool rolltypeSelected = false;
  final signUpController = Get.put(SignUpController());
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
                CupertinoButton(
                  onPressed: () {
                    getStorage.write('roll', "tenant");
                    setState(() {
                      rolltype = "tenant";
                    });
                    // Get.toNamed(Routes.tabPage);
                    LoaderX.show(context, 60.0, 60.0);
                    signUpController.roll("tenant");
                    signUpController.signUp();
                  },
                  child: Container(
                    height: 80,
                    width: Get.width,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Row(
                        children: [
                          const SizedBox(width: 25),
                          Container(
                            padding: const EdgeInsets.all(3),
                            height: 19,
                            width: 19,
                            decoration: BoxDecoration(
                                border: Border.all(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(25)),
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  color: rolltype == "tenant"
                                      ? kPrimaryColor
                                      : kWhiteColor,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                          const SizedBox(width: 25),
                          const Text(
                            "A Tenant",
                            style: TextStyle(
                                fontSize: 20,
                                color: kPrimaryColor,
                                fontFamily: kCircularStdMedium),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                CupertinoButton(
                  onPressed: () {
                    getStorage.write('roll', "host");
                    setState(() {
                      rolltype = "host";
                    });
                    LoaderX.show(context, 60.0, 60.0);
                    // Get.toNamed(Routes.tabPage);
                    signUpController.roll("host");
                    signUpController.signUp();
                  },
                  child: Container(
                    height: 80,
                    width: Get.width,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Row(
                        children: [
                          const SizedBox(width: 25),
                          Container(
                            padding: const EdgeInsets.all(3),
                            height: 19,
                            width: 19,
                            decoration: BoxDecoration(
                                border: Border.all(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(25)),
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  color: rolltype == "host"
                                      ? kPrimaryColor
                                      : kWhiteColor,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                          const SizedBox(width: 25),
                          const Text(
                            "A Landlord",
                            style: TextStyle(
                                fontSize: 20,
                                color: kPrimaryColor,
                                fontFamily: kCircularStdMedium),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
