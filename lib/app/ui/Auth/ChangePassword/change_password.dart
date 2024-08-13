import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/custom_textfield.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isFormSubmitted = false;
  bool selectEmail = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      "Change\nPassword",
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: kCircularStdBold,
                          color: kPrimaryColor),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Please enter your current password to change the\npasswrod.",
                      style: TextStyle(
                          color: kSecondaryPrimaryColor,
                          fontSize: 13,
                          fontFamily: kCircularStdNormal),
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      hintText: 'Current Password',
                      maxLines: 1,
                      ctrl: currentPasswordController,
                      name: "currentpassword",
                      formSubmitted: isFormSubmitted,
                      validationMsg: 'Please enter Current Password',
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      hintText: 'New Password',
                      maxLines: 1,
                      ctrl: newPasswordController,
                      name: "newpassword",
                      formSubmitted: isFormSubmitted,
                      validationMsg: 'Please enter New Password',
                      confirmPasswordController: confirmPasswordController,
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      hintText: 'Confirm Password',
                      maxLines: 1,
                      ctrl: confirmPasswordController,
                      name: "confirmpassword",
                      formSubmitted: isFormSubmitted,
                      validationMsg: 'Please enter Confirm Password',
                      confirmPasswordController: newPasswordController,
                    ),
                    const SizedBox(height: 15),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          isFormSubmitted = true;
                        });
                        if (_formKey.currentState?.validate() ?? false) {
                          print("Form is valid");
                        } else {
                          print("Form is invalid");
                        }
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
                            "Change Password",
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
        ),
      ),
    );
  }
}
