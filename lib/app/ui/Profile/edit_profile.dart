import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../services/user_service.dart';
import '../widgets/custom_textfield.dart';
import '../../../config/constant/constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/loader_provider.dart';
import '../../../config/provider/imagepicker_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool selectEmail = true;
  bool isFormSubmitted = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  UserService userService = UserService();
  File? imagefile;
  @override
  void initState() {
    getuser();
    super.initState();
  }

  getuser() {
    var user = getStorage.read('user');
    var userData = jsonDecode(user);
    if (userData != null) {
      firstNameController.text = userData["first_name"] ?? "";
      lastNameController.text = userData["last_name"] ?? "";
      emailController.text = userData["email"] ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
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
                          child: imagefile != null
                              ? Container(
                                  margin: const EdgeInsets.only(top: 75),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kWhiteColor, width: 2),
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      imagefile!,
                                      fit: BoxFit.cover,
                                      scale: 1.2,
                                      height: 110,
                                      width: 110,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          "assets/images/blank_profile.png",
                                          fit: BoxFit.cover,
                                          height: 110,
                                          width: 110,
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(top: 75),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kWhiteColor, width: 2),
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      "assets/images/blank_profile.png",
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
                            onTap: () {
                              pickImage();
                            },
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
                        onPressed: () {
                          setState(() {
                            isFormSubmitted = true;
                          });
                          FocusScope.of(context).requestFocus(FocusNode());
                          LoaderX.show(context, 60.0, 60.0);
                          userService.updateProfile(
                              firstNameController.text,
                              lastNameController.text,
                              emailController.text,
                              imagefile);
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

  Future pickImage() async {
    await PickerUtils.pickImageFromGallery().then(
      (pickedFile) async {
        if (pickedFile == null) return;
        await PickerUtils.cropSelectedImage(pickedFile.path).then(
          (croppedFile) {
            if (croppedFile == null) return;
            setState(
              () {
                imagefile = File(croppedFile.path);
              },
            );
          },
        );
      },
    );
  }
}
