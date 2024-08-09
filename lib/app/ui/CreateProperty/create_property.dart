import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class CreatePropertyPage extends StatefulWidget {
  const CreatePropertyPage({super.key});

  @override
  State<CreatePropertyPage> createState() => _CreatePropertyPageState();
}

class _CreatePropertyPageState extends State<CreatePropertyPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController raisedFundsController = TextEditingController();
  final TextEditingController sellController = TextEditingController();
  final TextEditingController street1Controller = TextEditingController();
  final TextEditingController street2Controller = TextEditingController();
  final TextEditingController orgNamecontroller = TextEditingController();
  bool isTouched = false;
  bool isFormSubmitted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Card(
                  shadowColor: const Color.fromARGB(10, 0, 0, 0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: kWhiteColor),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: titleController,
                                    textInputAction: TextInputAction.next,
                                    onChanged: ((value) {}),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kIconColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kIconColor),
                                      ),
                                      contentPadding: EdgeInsets.only(top: 5),
                                      hintText: 'Title',
                                      hintStyle: TextStyle(
                                        fontFamily: kCircularStdNormal,
                                        fontWeight: FontWeight.w400,
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                    minLines: 1,
                                    // inputFormatters: [
                                    //   LengthLimitingTextInputFormatter(40),
                                    // ],
                                    controller: descriptionController,

                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kIconColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kIconColor),
                                      ),
                                      contentPadding: EdgeInsets.only(top: 5),
                                      hintText: 'Description',
                                      hintStyle: TextStyle(
                                        fontFamily: kCircularStdNormal,
                                        fontWeight: FontWeight.w400,
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 25)
                      ],
                    ),
                  ),
                ),
                buildTextWidget("Raising Funds"),
                buildTextField("\$100", raisedFundsController, true,
                    isFormSubmitted, isTouched, "Please enter some text"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        // validator: (value) {
                        //   if (isTouched || isFormSubmitted) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter a price';
                        //     }
                        //   }
                        //   return null;
                        // },
                        controller: sellController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) => {
                          isTouched = true,
                        },
                        decoration: InputDecoration(
                          hintText: "\$",
                          counterText: "",
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          hintStyle: const TextStyle(
                            fontFamily: kCircularStdBook,
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: kWhiteColor,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide:
                                BorderSide(color: kWhiteColor, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                color: kWhiteColor, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                buildTextWidget("Last "),
                buildTextField("Enter", orgNamecontroller, false,
                    isFormSubmitted, isTouched, "Please enter name"),
                buildTextWidget("Address"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (isTouched || isFormSubmitted) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Address';
                            }
                          }
                          return null;
                        },
                        controller: street1Controller,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) => {
                          isTouched = true,
                        },
                        decoration: InputDecoration(
                          hintText: "Flat / House No / Building",
                          counterText: "",
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          hintStyle: const TextStyle(
                            fontFamily: kCircularStdBook,
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: kWhiteColor,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide:
                                BorderSide(color: kWhiteColor, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                color: kWhiteColor, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 150,
                    child: Card(
                      shadowColor: const Color.fromARGB(20, 0, 0, 0),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(color: kWhiteColor)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DottedBorder(
                            color: kBorderColor,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            strokeWidth: 1,
                            dashPattern: const [6, 6],
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/upload_image.png",
                                    scale: 1.5,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Upload Cover photo",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: kCircularStdBook,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Create a Campaign",
                        style: TextStyle(color: kWhiteColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextWidget(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(7, 20, 0, 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontFamily: kCircularStdBold,
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, TextEditingController controller,
      bool value, bool isFormSubmitted, bool isTouched, validatedmsg) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (isTouched || isFormSubmitted) {
                if (value == null || value.isEmpty) {
                  return validatedmsg;
                }
              }
              return null;
            },
            keyboardType: value == true ? TextInputType.number : null,
            controller: controller,
            textInputAction: TextInputAction.next,
            onChanged: (value) => {
              isTouched = true,
            },
            decoration: InputDecoration(
              hintText: hintText,
              counterText: "",
              contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              hintStyle: const TextStyle(
                fontFamily: kCircularStdBook,
                fontWeight: FontWeight.w400,
                color: kPrimaryColor,
                fontSize: 14,
              ),
              filled: true,
              fillColor: kWhiteColor,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                borderSide: BorderSide(color: kWhiteColor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: kWhiteColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
