import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/custom_textfield.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isFormSubmitted = false;
  bool selectEmail = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kBackGroundColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
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
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: const EdgeInsets.only(top: 75),
                            decoration: BoxDecoration(
                              border: Border.all(color: kWhiteColor, width: 2),
                              borderRadius: BorderRadius.circular(1000),
                            ),
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
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(top: 150, left: 85),
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: kPrimaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: kWhiteColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        hintText: 'First Name',
                        maxLines: 1,
                        ctrl: firstNameController,
                        name: "firstUser",
                        formSubmitted: isFormSubmitted,
                        validationMsg: 'Please enter first name',
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        hintText: 'Last Name',
                        maxLines: 1,
                        ctrl: lastNameController,
                        name: "firstUser",
                        formSubmitted: isFormSubmitted,
                        validationMsg: 'Please enter last name',
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        hintText: 'Email',
                        maxLines: 1,
                        ctrl: emailController,
                        name: "email",
                        formSubmitted: isFormSubmitted,
                        validationMsg: 'Please enter email',
                      ),
                      const SizedBox(height: 15),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Container(
                          height: 45,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: kWhiteColor),
                              color: kButtonColor),
                          child: const Center(
                            child: Text(
                              "Update Profile",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
