import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Login/login.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/social_login_widget.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/provider/gradient_text.dart';
import '../../../../config/constant/color_constant.dart';
import '../../../../config/provider/loader_provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isFormSubmitted = false;
  final _loginFormKey = GlobalKey<FormState>();
  bool selectEmail = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                      const SizedBox(height: 90),
                      GradientText(
                        text: "Signup for a new a account",
                        style: TextStyle(
                          fontSize: size.width > 500 ? 25 : 20,
                          fontFamily:
                              'CircularStdBold', // Make sure this font is added in your pubspec.yaml
                        ),
                        gradient: const LinearGradient(
                            colors: [
                              kAppBackGround1Color,
                              kAppBackGround2Color
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            tileMode: TileMode.repeated),
                      ),
                      SizedBox(height: size.height > 500 ? 10 : 5),
                      Text(
                        "Enter your email and first name to create an account.",
                        style: TextStyle(
                            color: kSecondaryPrimaryColor,
                            fontSize: size.width > 500 ? 25 : 14,
                            fontFamily: kCircularStdNormal),
                      ),
                      const SizedBox(height: 35),
                      SizedBox(
                        width: Get.width > 500 ? 600 : Get.width,
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildTitleWidget("First Name:"),
                                    SizedBox(height: size.width > 500 ? 30 : 5),
                                    CustomTextFormField(
                                      hintText: '',
                                      maxLines: 1,
                                      ctrl: firstNameController,
                                      name: "name",
                                      formSubmitted: isFormSubmitted,
                                      validationMsg: 'Please enter first name',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildTitleWidget("Last Name:"),
                                    SizedBox(height: size.width > 500 ? 30 : 5),
                                    CustomTextFormField(
                                      hintText: '',
                                      maxLines: 1,
                                      ctrl: lastNameController,
                                      name: "name",
                                      formSubmitted: isFormSubmitted,
                                      validationMsg: 'Please enter last name',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      buildTitleWidget("Email address:"),
                      SizedBox(height: size.width > 500 ? 30 : 5),
                      SizedBox(
                        width: size.width > 500 ? 600 : size.width,
                        child: CustomTextFormField(
                          hintText: 'Jone@gmail.com',
                          maxLines: 1,
                          ctrl: emailController,
                          name: "email",
                          formSubmitted: isFormSubmitted,
                          validationMsg: 'Please enter email',
                        ),
                      ),
                      const SizedBox(height: 15),
                      buildTitleWidget("Password:"),
                      SizedBox(height: size.width > 500 ? 30 : 5),
                      SizedBox(
                        width: size.width > 500 ? 600 : size.width,
                        child: CustomTextFormField(
                          hintText: '***********',
                          maxLines: 1,
                          ctrl: passwordController,
                          name: "password",
                          formSubmitted: isFormSubmitted,
                          validationMsg: 'Please enter password',
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: size.width > 500 ? 600 : size.width,
                        height: 48,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Container(
                            width: size.width,
                            height: 48,
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                              color: kButtonColor,
                              borderRadius: BorderRadius.circular(9.0),
                              gradient: const LinearGradient(
                                  colors: [
                                    kAppBackGround1Color,
                                    kAppBackGround2Color
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  tileMode: TileMode.repeated),
                            ),
                            child: const Center(
                              child: Text(
                                'Create account',
                                style: TextStyle(
                                    color: kWhiteColor,
                                    letterSpacing: 1.5,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              fontSize: size.width > 500 ? 17.5 : 12.5,
                              color: kPrimaryColor,
                              fontFamily: kCircularStdBook,
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Get.offAll(() => const LoginPage());
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: size.width > 500 ? 17.5 : 12.5,
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdBook,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
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
                            "or continue with",
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
                      const SizedBox(height: 25),
                      const SocialLoginPage(checkRowOrColumn: "row"),
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

  buildTitleWidget(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: kPrimaryColor, fontSize: 16, fontFamily: kCircularStdMedium),
    );
  }
}
