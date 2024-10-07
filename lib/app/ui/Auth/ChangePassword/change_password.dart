import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../services/auth_service.dart';
import '../../widgets/custom_textfield.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';
import '../../../../config/provider/loader_provider.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isFormSubmitted = false;
  AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
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
                  TextFormField(
                    controller: newPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Please enter New Password";
                      }
                      if (value!.length <= 5 || value.length >= 7) {
                        return 'Password Must be more than 6 characters.';
                      }
                      return null;
                    },
                    decoration: inputOfTextField("New Password"),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: confirmPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Please enter Confirm password";
                      }
                      if (newPasswordController.text !=
                          confirmPasswordController.text) {
                        return "Confirm Password does not match";
                      }
                      if (value!.length <= 5 || value.length >= 7) {
                        return 'Password Must be more than 6 characters.';
                      }
                      return null;
                    },
                    decoration: inputOfTextField("Confirm Password"),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 15),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        isFormSubmitted = true;
                      });
                      FocusScope.of(context).requestFocus(FocusNode());
                      Future.delayed(const Duration(milliseconds: 100),
                          () async {
                        if (_formKey.currentState!.validate()) {
                          LoaderX.show(context, 60.0, 60.0);
                          authService.changePassowrd(
                              "",
                              currentPasswordController.text,
                              newPasswordController.text);
                        }
                      });
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
    );
  }

  InputDecoration inputOfTextField(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: kBackGroundColor,
      contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      hintStyle: const TextStyle(color: kGreyColor),
      labelStyle: const TextStyle(color: kBlackColor),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(25.0),
        ),
        borderSide: BorderSide(
            color: hintText == "Confirm Password"
                ? newPasswordController.text != confirmPasswordController.text
                    ? kRedColor
                    : kSecondaryPrimaryColor
                : kSecondaryPrimaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
            color: hintText == "Confirm Password"
                ? newPasswordController.text != confirmPasswordController.text
                    ? kRedColor
                    : kSecondaryPrimaryColor
                : kSecondaryPrimaryColor,
            width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
            color: hintText == "Confirm Password"
                ? newPasswordController.text != confirmPasswordController.text
                    ? kRedColor
                    : kSecondaryPrimaryColor
                : kSecondaryPrimaryColor),
      ),
    );
  }
}
