import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../widgets/custom_textfield.dart';

class SendCheckoutRequest extends StatefulWidget {
  const SendCheckoutRequest({super.key});

  @override
  State<SendCheckoutRequest> createState() => _SendCheckoutRequestState();
}

class _SendCheckoutRequestState extends State<SendCheckoutRequest> {
  bool pendingbill = false,
      electricity = false,
      amenities = false,
      payment = false,
      other = false;
  String comments = '';
  TextEditingController commentController = TextEditingController();

  void createJson() {
    Map<String, dynamic> jsonData = {
      'electricity': electricity,
      'pendingbill': pendingbill,
      'amenities': amenities,
      'payment': payment,
      'comments': comments,
    };
    print(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Checkout Request",
            style: TextStyle(fontFamily: kCircularStdBook),
          ),
          backgroundColor: kBackGroundColor,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
            child: Column(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (electricity == true) {
                      setState(() {
                        electricity = false;
                      });
                    } else {
                      setState(() {
                        electricity = true;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: kPrimaryColor)),
                            child: const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.electric_bolt_sharp,
                                size: 18,
                                color: kButtonColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Electricity",
                            style: TextStyle(
                              fontFamily: kWorkSans,
                              fontSize: 15,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      electricity == true
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: kGreenColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.check,
                                  size: 18,
                                  color: kGreenColor,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: kButtonColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.close,
                                  size: 18,
                                  color: kButtonColor,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (pendingbill == true) {
                      setState(() {
                        pendingbill = false;
                      });
                    } else {
                      setState(() {
                        pendingbill = true;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: kPrimaryColor)),
                            child: const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.paypal_sharp,
                                size: 18,
                                color: kButtonColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Pending Bill",
                            style: TextStyle(
                              fontFamily: kWorkSans,
                              fontSize: 15,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      pendingbill == true
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: kGreenColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.check,
                                  size: 18,
                                  color: kGreenColor,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: kButtonColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.close,
                                  size: 18,
                                  color: kButtonColor,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (amenities == true) {
                      setState(() {
                        amenities = false;
                      });
                    } else {
                      setState(() {
                        amenities = true;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: kPrimaryColor)),
                            child: const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.line_style_outlined,
                                size: 18,
                                color: kButtonColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Pipe Fitting",
                            style: TextStyle(
                              fontFamily: kWorkSans,
                              fontSize: 15,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      amenities == true
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: kGreenColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.check,
                                  size: 18,
                                  color: kGreenColor,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: kButtonColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.close,
                                  size: 18,
                                  color: kButtonColor,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (payment == true) {
                      setState(() {
                        payment = false;
                      });
                    } else {
                      setState(() {
                        payment = true;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: kPrimaryColor)),
                            child: const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.receipt_long_rounded,
                                size: 18,
                                color: kButtonColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Rent payment",
                            style: TextStyle(
                              fontFamily: kWorkSans,
                              fontSize: 15,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      payment == true
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: kGreenColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.check,
                                  size: 18,
                                  color: kGreenColor,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: kButtonColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.close,
                                  size: 18,
                                  color: kButtonColor,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Comment',
                  maxLines: 1,
                  ctrl: commentController,
                  name: "create",
                ),
                const SizedBox(height: 15),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      comments = commentController.text;
                      // isFormSubmitted = true;
                    });
                    FocusScope.of(context).requestFocus(FocusNode());
                    createJson();
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: kWhiteColor),
                        color: kButtonColor),
                    child: const Center(
                      child: Text(
                        "Send request",
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
        )
        // Column(
        //   children: [
        //     const Text("checkout request send"),
        //     ElevatedButton(
        //         onPressed: () {
        //           createJson();
        //         },
        //         child: const Text("click"))
        //   ],
        // ),
        );
  }
}
