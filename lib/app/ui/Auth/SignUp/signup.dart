import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:country_list_pick/country_list_pick.dart';

import '../Login/login.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/social_login_widget.dart';
import '../../../controller/auth_controller.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool selectEmail = true;
  bool isFormSubmitted = false;
  String selectedCountrydialCode = "+91";
  final _signupFormKey = GlobalKey<FormState>();
  final signUpController = Get.put(SignUpController());
  TextEditingController emailController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
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
              key: _signupFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
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
                        const SizedBox(height: 40),
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: kCircularStdMedium,
                              color: kPrimaryColor),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Welcome! Please enter your details.",
                          style: TextStyle(
                              color: kSecondaryPrimaryColor,
                              fontSize: size.width > 500 ? 25 : 14,
                              fontFamily: kCircularStdNormal),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: Get.width > 500 ? 600 : Get.width,
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextFormField(
                                        hintText: 'First Name',
                                        maxLines: 1,
                                        ctrl: firstNameController,
                                        prefixIcon: "assets/icons/user.png",
                                        name: "firstUser",
                                        formSubmitted: isFormSubmitted,
                                        validationMsg:
                                            'Please enter first name',
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextFormField(
                                        hintText: 'Last Name',
                                        maxLines: 1,
                                        prefixIcon: "assets/icons/user.png",
                                        ctrl: lastNameController,
                                        name: "firstUser",
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
                        SizedBox(
                          width: Get.width > 500 ? 600 : Get.width,
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: kBackGroundColor,
                                      border: Border.all(
                                          color: kSecondaryPrimaryColor),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextFormField(
                                        hintText: 'PhoneNo',
                                        maxLines: 1,
                                        ctrl: mobilenoController,
                                        keyboardType: TextInputType.phone,
                                        name: "phoneno",
                                        formSubmitted: isFormSubmitted,
                                        validationMsg: 'Please enter phoneNo',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
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
                        SizedBox(height: size.width > 500 ? 30 : 5),
                        SizedBox(
                          width: size.width > 500 ? 600 : size.width,
                          child: CustomTextFormField(
                            hintText: 'Password',
                            maxLines: 1,
                            ctrl: passwordController,
                            prefixIcon: "assets/icons/padlock.png",
                            name: "password",
                            formSubmitted: isFormSubmitted,
                            validationMsg: 'Please enter password',
                          ),
                        ),
                        const SizedBox(height: 20),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            onSignUpButtonPress();
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
                                "Sign Up",
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 18),
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
                                fontSize: size.width > 500 ? 17.5 : 12,
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
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
                                    fontSize: size.width > 500 ? 17.5 : 14,
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdMedium,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
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
                        const SizedBox(height: 20),
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

  onSignUpButtonPress() {
    setState(() {
      isFormSubmitted = true;
    });
    FocusScope.of(context).requestFocus(FocusNode());
    Future.delayed(const Duration(milliseconds: 100), () async {
      if (_signupFormKey.currentState!.validate()) {
        signUpController.firstname(firstNameController.text);
        signUpController.lastname(lastNameController.text);
        signUpController.email(emailController.text);
        signUpController
            .mobileNo("$selectedCountrydialCode${mobilenoController.text}");
        signUpController.password(passwordController.text);
        Get.toNamed(Routes.selectRollPage);
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
