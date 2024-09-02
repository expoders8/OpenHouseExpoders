import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/social_login_widget.dart';
import '../../../controller/auth_controller.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';
import '../../../../config/provider/loader_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool selectEmail = true;
  bool isFormSubmitted = false;
  final _loginFormKey = GlobalKey<FormState>();
  final loginController = Get.put(LoginController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        const Center(
                          child: Text(
                            "OpenHouse",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 35,
                                fontFamily: kCircularStdBold,
                                color: kPrimaryColor),
                          ),
                        ),
                        const SizedBox(height: 50),
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: kCircularStdMedium,
                              color: kPrimaryColor),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Welcome back! Please enter your details.",
                          style: TextStyle(
                              color: kSecondaryPrimaryColor,
                              fontSize: 13,
                              fontFamily: kCircularStdNormal),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: size.width > 500 ? 600 : size.width,
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
                        SizedBox(
                          width: size.width > 500 ? 600 : size.width,
                          child: CustomTextFormField(
                            hintText: "Password",
                            maxLines: 1,
                            prefixIcon: "assets/icons/padlock.png",
                            ctrl: passwordController,
                            name: "password",
                            formSubmitted: isFormSubmitted,
                            validationMsg: 'Please enter password',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CupertinoButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgotPasswordPage);
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 13,
                                    fontFamily: kCircularStdNormal),
                              ),
                            ),
                          ],
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            onLoginButtonPress();
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
                                "Log In",
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don’t  have an account? ",
                                style: TextStyle(
                                  fontSize: size.width > 500 ? 17.5 : 12,
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdNormal,
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Get.toNamed(Routes.signUpPage);
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: size.width > 500 ? 17.5 : 14,
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 80,
                              child: Divider(
                                thickness: 1,
                                color: kSecondaryPrimaryColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Or",
                              style: TextStyle(
                                  color: kSecondaryPrimaryColor,
                                  fontSize: size.width > 500 ? 25 : 15,
                                  fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(width: 10),
                            const SizedBox(
                              width: 80,
                              child: Divider(
                                thickness: 1,
                                color: kSecondaryPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const SocialLoginPage(checkRowOrColumn: "row"),
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

  onLoginButtonPress() {
    setState(() {
      isFormSubmitted = true;
    });
    FocusScope.of(context).requestFocus(FocusNode());
    Future.delayed(const Duration(milliseconds: 100), () async {
      if (_loginFormKey.currentState!.validate()) {
        loginController.email(emailController.text);
        loginController.password(passwordController.text);
        LoaderX.show(context, 60.0, 60.0);

        loginController.login();
      }
    });
  }

  buildTitleWidget(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: kPrimaryColor, fontSize: 16, fontFamily: kCircularStdMedium),
    );
  }
}
