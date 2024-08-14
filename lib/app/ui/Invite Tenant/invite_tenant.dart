import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:openhome/app/routes/app_pages.dart';
import 'package:country_list_pick/country_list_pick.dart';

import '../widgets/custom_textfield.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class InviteTenantPage extends StatefulWidget {
  const InviteTenantPage({super.key});

  @override
  State<InviteTenantPage> createState() => _InviteTenantPageState();
}

class _InviteTenantPageState extends State<InviteTenantPage> {
  bool isFormSubmitted = false;
  final TextEditingController mobilenoController = TextEditingController();
  String selectedCountrydialCode = "+91";
  final RxString mobileno = ''.obs;
  @override
  void initState() {
    super.initState();
    mobilenoController.addListener(() {
      mobileno.value = mobilenoController.text;
    });
  }

  @override
  void dispose() {
    mobilenoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Invite Tenant",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        backgroundColor: kBackGroundColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/icons/1.png",
                      fit: BoxFit.cover,
                      scale: 1.2,
                      height: 55,
                      width: 55,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: kButtonColor,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: Get.width / 1.7,
                            child: const Text(
                              "3545 Robson St, Vancouver",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 16,
                            color: kButtonColor,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: Get.width - 220,
                            child: const Text(
                              "Name",
                              style: TextStyle(
                                  color: kSecondaryPrimaryColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdBold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: Get.width > 500 ? 600 : Get.width,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: kBackGroundColor,
                            border: Border.all(color: kSecondaryPrimaryColor),
                            borderRadius: BorderRadius.circular(50)),
                        child: CountryListPick(
                          theme: CountryTheme(
                            isShowFlag: false,
                            isShowTitle: false,
                            isShowCode: true,
                            isDownIcon: false,
                            showEnglishName: true,
                          ),
                          initialSelection: 'IN',
                          onChanged: (CountryCode? code) {
                            setState(() {
                              selectedCountrydialCode =
                                  code!.dialCode.toString();
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              hintText: 'PhoneNo',
                              maxLines: 1,
                              ctrl: mobilenoController,
                              keyboardType: TextInputType.phone,
                              name: "phoneno",
                              formSubmitted: isFormSubmitted,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(() {
                return mobileno.isNotEmpty
                    ? Container(
                        height: 250,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: kBackGroundColor,
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                searchresult("assets/icons/boy 1.png", "Jack",
                                    "+91 9898545625"),
                                const SizedBox(height: 10),
                                searchresult("assets/icons/boy 2.png",
                                    "Jackson", "+91 9898545625"),
                                const SizedBox(height: 10),
                                searchresult("assets/icons/boy 3.png", "James",
                                    "+91 9898545625"),
                                const SizedBox(height: 10),
                                searchresult("assets/icons/boy 1.png", "Leo",
                                    "+91 9898545625"),
                                const SizedBox(height: 10),
                                searchresult("assets/icons/boy 2.png",
                                    "Tenant Name", "+91 9898545625"),
                                const SizedBox(height: 10),
                                searchresult("assets/icons/boy 3.png",
                                    "Tenant Name", "+91 9898545625"),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container();
              }),
              const SizedBox(height: 10),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Get.toNamed(Routes.inviteTenantDetailPage);
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
                      "Next",
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
    );
  }

  searchresult(String image, name, number) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            scale: 1.2,
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            SizedBox(
              width: Get.width - 220,
              child: Text(
                name,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 17,
                    fontFamily: kCircularStdMedium),
              ),
            ),
            SizedBox(
              width: Get.width - 220,
              child: Text(
                number,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 13,
                    fontFamily: kCircularStdBook),
              ),
            ),
          ],
        )
      ],
    );
  }
}
