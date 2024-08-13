import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';
// import '../../services/auth_service.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: <String>[
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

class SocialLoginPage extends StatefulWidget {
  final String checkRowOrColumn;
  final int? selectscreenIndex;
  const SocialLoginPage(
      {super.key, required this.checkRowOrColumn, this.selectscreenIndex});

  @override
  State<SocialLoginPage> createState() => _SocialLoginPageState();
}

class _SocialLoginPageState extends State<SocialLoginPage> {
  String idToken = "", fcmToken = "";
  // GoogleSignInAccount? user;
  // AuthService authService = AuthService();
  // final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // _googleSignIn.onCurrentUserChanged
    //     .listen((GoogleSignInAccount? account) {});
    // _googleSignIn.signInSilently();
  }

  // Future<void> handleGoogleSignIn() async {
  //   try {
  //     final GoogleSignIn googleSignIn = GoogleSignIn();
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await googleSignIn.signIn();
  //     if (googleSignInAccount != null) {
  //       // ignore: use_build_context_synchronously
  //       LoaderX.show(context, 60.0, 60.0);
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;
  //       setState(() {
  //         idToken = googleSignInAuthentication.idToken.toString();
  //       });
  //       final AuthCredential authCredential = GoogleAuthProvider.credential(
  //           idToken: googleSignInAuthentication.idToken,
  //           accessToken: googleSignInAuthentication.accessToken);

  //       UserCredential result = await auth.signInWithCredential(authCredential);
  //       User? user = result.user;
  //       var userName = user?.displayName;
  //       List<String> substrings = userName.toString().split(' ');
  //       await authService
  //           .socialLogin(substrings[0], substrings[1], user!.email.toString(),
  //               user.photoURL.toString(), idToken, "Google")
  //           .then(
  //         (value) async {
  //           if (value) {
  //             LoaderX.hide();
  //             Get.offAll(() => const TabPage());
  //           } else {
  //             getStorage.write("index", widget.selectscreenIndex);
  //             LoaderX.hide();
  //             SnackbarUtils.showErrorSnackbar(
  //                 "Failed to Login", value.message.toString());
  //           }
  //           return null;
  //         },
  //       );
  //     }
  //   } catch (error) {
  //     LoaderX.hide();
  //     SnackbarUtils.showErrorSnackbar("Failed to Login", error.toString());
  //     throw error.toString();
  //   }
  // }

  // appleSignin() async {
  //   final credential = await SignInWithApple.getAppleIDCredential(
  //     scopes: [
  //       AppleIDAuthorizationScopes.email,
  //       AppleIDAuthorizationScopes.fullName,
  //     ],
  //   );

  //   Future.delayed(const Duration(milliseconds: 100), () async {
  //     LoaderX.show(context, 50.0, 50.0);
  //     await authService
  //         .socialLogin(
  //             credential.givenName.toString(),
  //             credential.familyName.toString(),
  //             credential.email.toString(),
  //             "",
  //             credential.userIdentifier.toString(),
  //             "Apple")
  //         .then(
  //       (value) async {
  //         if (value) {
  //           LoaderX.hide();
  //           Get.offAll(() => const HomePage());
  //         } else {
  //           LoaderX.hide();
  //           SnackbarUtils.showErrorSnackbar(
  //               "Failed to Login", value.message.toString());
  //         }
  //         return null;
  //       },
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: Platform.isIOS
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.center,
      children: [
        Center(
          child: widget.checkRowOrColumn == "row"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: Platform.isIOS ? 10 : 0),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Container(
                        width: size.width > 500
                            ? 600
                            : Platform.isAndroid
                                ? Get.width - 60
                                : Get.width / 2.350,
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                                color: kSecondaryPrimaryColor, width: 0.7)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/Google.png",
                              height: 26,
                              width: 26,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              Platform.isAndroid
                                  ? "Continue with Google"
                                  : "Google",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: size.width > 500 ? 20 : 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Platform.isIOS ? 10 : 0),
                    Platform.isIOS
                        ? CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Container(
                              width: size.width > 500
                                  ? 600
                                  : Platform.isAndroid
                                      ? Get.width - 60
                                      : Get.width / 2.350,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: kPrimaryColor, width: 1)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.apple_outlined,
                                    size: 29,
                                    color: kBlackColor,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Apple",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: size.width > 500 ? 20 : 16),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      width: Get.width - 50,
                      height: 50,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Container(
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
                              'Continue with Google',
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Platform.isIOS ? const SizedBox(height: 20) : Container(),
                    Platform.isIOS
                        ? SizedBox(
                            width: Get.width - 50,
                            height: 50,
                            child: CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: Container(
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
                                    'Continue with Apple',
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
        ),
      ],
    );
  }
}
