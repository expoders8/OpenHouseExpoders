import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Login/login.dart';
import '../../../services/auth_service.dart';
import '../../widgets/custom_textfield.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';
import '../../../../config/provider/loader_provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool selectEmail = true;
  bool isFormSubmitted = false;
  AuthService authService = AuthService();
  final _forgotpasswordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _forgotpasswordFormKey,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                          "Forgot\nPassword",
                          style: TextStyle(
                              fontSize: 35,
                              fontFamily: kCircularStdBold,
                              color: kPrimaryColor),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Please enter your email address to receive\nyour password",
                          style: TextStyle(
                              color: kSecondaryPrimaryColor,
                              fontSize: 13,
                              fontFamily: kCircularStdNormal),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: Get.width,
                          child: CustomTextFormField(
                            hintText: 'Email',
                            maxLines: 1,
                            prefixIcon: "assets/icons/email.png",
                            ctrl: emailController,
                            name: "email",
                            formSubmitted: isFormSubmitted,
                            validationMsg: 'Please enter email',
                          ),
                        ),
                        const SizedBox(height: 15),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              isFormSubmitted = true;
                            });
                            if (_forgotpasswordFormKey.currentState!
                                .validate()) {
                              LoaderX.show(context, 60.0, 60.0);
                              authService.forgotPassword(emailController.text);
                            }
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
                                "Forgot password",
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Back to",
                                style: TextStyle(
                                  fontSize: 12.5,
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdBook,
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Get.offAll(() => const LoginPage());
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdBook,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
