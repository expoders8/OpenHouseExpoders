import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/social_login_widget.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/provider/gradient_text.dart';
import '../../../../config/constant/color_constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isFormSubmitted = false;
  final _loginFormKey = GlobalKey<FormState>();
  bool selectEmail = true;
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
                      SizedBox(height: size.height > 500 ? 50 : 60),
                      GradientText(
                        text: "Login to Your Account",
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
                        selectEmail
                            ? "Enter your email to receive a one-time password (or use permanent password if you defined one)."
                            : "Enter your email and permanent password. If you didn't defined one, use one-time password instead.",
                        style: TextStyle(
                            color: kSecondaryPrimaryColor,
                            fontSize: size.width > 500 ? 25 : 14,
                            fontFamily: kCircularStdNormal),
                      ),
                      SizedBox(height: size.width > 500 ? 30 : 15),
                      buildTitleWidget("Email address:"),
                      SizedBox(height: size.width > 500 ? 30 : 10),
                      SizedBox(
                        width: size.width > 500 ? 600 : size.width,
                        child: CustomTextFormField(
                          hintText: 'your@email.com',
                          maxLines: 1,
                          ctrl: emailController,
                          name: "email",
                          formSubmitted: isFormSubmitted,
                          validationMsg: 'Please enter email',
                        ),
                      ),
                      SizedBox(height: selectEmail ? 0 : 15),
                      selectEmail ? Container() : buildTitleWidget("Password:"),
                      selectEmail
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Forgot your password? ",
                                      style: TextStyle(
                                        fontSize:
                                            size.width > 500 ? 17.5 : 12.5,
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdBook,
                                      ),
                                    ),
                                    CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      child: Text(
                                        "Reset it",
                                        style: TextStyle(
                                            fontSize:
                                                size.width > 500 ? 17.5 : 12.5,
                                            color: kPrimaryColor,
                                            fontFamily: kCircularStdBook,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                      const SizedBox(height: 20),
                      selectEmail
                          ? GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.email_rounded,
                                      color: kWhiteColor,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Use one-time password',
                                      style: TextStyle(
                                          color: kWhiteColor,
                                          letterSpacing: 1.5,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(
                              width: size.width > 500 ? 600 : size.width,
                              height: 48,
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                child: Container(
                                  width: size.width,
                                  height: 48,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                      'Sign in',
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
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          if (selectEmail) {
                            setState(() {
                              selectEmail = false;
                            });
                          } else {
                            setState(() {
                              selectEmail = true;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.0),
                              border: Border.all(
                                  width: 1, color: kSecondaryPrimaryColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                selectEmail
                                    ? Icons.fingerprint_rounded
                                    : Icons.email_rounded,
                                color: kPrimaryColor,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                selectEmail
                                    ? "Login with password"
                                    : 'Use one-time password',
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    letterSpacing: 1.5,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Not a member? ",
                              style: TextStyle(
                                fontSize: size.width > 500 ? 17.5 : 12.5,
                                color: kPrimaryColor,
                                fontFamily: kCircularStdBook,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Get.toNamed(Routes.signUpPage);
                              },
                              child: Text(
                                "Create an account",
                                style: TextStyle(
                                    fontSize: size.width > 500 ? 17.5 : 12.5,
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdBook,
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
