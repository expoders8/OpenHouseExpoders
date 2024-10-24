import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/custom_textfield.dart';
import '../../controller/property_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/loader_provider.dart';
import '../../controller/checkout_lookup_controller.dart';

class SendCheckoutRequest extends StatefulWidget {
  final String? propertyId;
  final String? rentalId;
  const SendCheckoutRequest({super.key, this.propertyId, this.rentalId});

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
  final _formKey = GlobalKey<FormState>();
  TextEditingController commentController = TextEditingController();
  final PropertyCheckoutController propertyCheckoutController =
      Get.put(PropertyCheckoutController());
  final GetAllCheckoutLookupController getAllCheckoutLookupController =
      Get.put(GetAllCheckoutLookupController());
  bool isFormSubmitted = false;
  List<bool> toggleStates = [];
  bool isLoading = true;
  List<Map<String, dynamic>> jsonData = [];
  var updatedJson;
  List<String> selectedNames = [];

  @override
  void initState() {
    super.initState();
    getAllCheckoutLookupController.fetchAllcheckoutlookup();
    Future.delayed(const Duration(seconds: 3), () async {
      setState(() {
        isLoading = false;
        toggleStates = List<bool>.filled(
          getAllCheckoutLookupController.lookupdataList[0].length,
          false,
        );
      });
    });
  }

  List<Map<String, dynamic>> generateJson() {
    var requestData = getAllCheckoutLookupController.lookupdataList[0];
    if (jsonData.isEmpty) {
      for (int i = 0; i < requestData.length; i++) {
        String key = requestData[i].name!;
        jsonData.add({key: false});
      }
    }
    for (int i = 0; i < requestData.length; i++) {
      String key = requestData[i].name!;
      bool value = toggleStates[i];
      jsonData[i] = {key: value};
    }

    return jsonData;
  }

  IconData getIconFromString(String? iconName) {
    switch (iconName) {
      case 'Icons.inventory':
        return Icons.inventory;
      case 'Icons.warning':
        return Icons.warning;
      case 'Icons.key':
        return Icons.key;
      case 'Icons.pool':
        return Icons.pool;
      case 'Icons.description':
        return Icons.description;
      case 'Icons.cleaning_services':
        return Icons.cleaning_services;
      case 'Icons.flash_on':
        return Icons.flash_on;
      default:
        return Icons.help;
    }
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
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ))
                  : Column(
                      children: [
                        Obx(
                          () {
                            if (getAllCheckoutLookupController
                                .isLoading.value) {
                              return Container(
                                color: kBackGroundColor,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  ),
                                ),
                              );
                            } else {
                              if (getAllCheckoutLookupController
                                  .lookupdataList.isNotEmpty) {
                                if (getAllCheckoutLookupController
                                    .lookupdataList[0].isEmpty) {
                                  return Container();
                                } else {
                                  return Flexible(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: getAllCheckoutLookupController
                                          .lookupdataList[0].length,
                                      itemBuilder: (context, index) {
                                        var requestData =
                                            getAllCheckoutLookupController
                                                .lookupdataList[0];
                                        if (requestData.isNotEmpty) {
                                          var data = requestData[index];
                                          bool isToggled = toggleStates[index];
                                          return Column(
                                            children: [
                                              CupertinoButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {
                                                  setState(() {
                                                    toggleStates[index] =
                                                        !toggleStates[index];
                                                    if (toggleStates[index]) {
                                                      if (!selectedNames
                                                          .contains(data.name!
                                                              .toString())) {
                                                        selectedNames.add(data
                                                            .name!
                                                            .toString());
                                                      }
                                                    } else {
                                                      selectedNames.remove(data
                                                          .name!
                                                          .toString());
                                                    }
                                                    updatedJson =
                                                        generateJson();
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            border: Border.all(
                                                                color:
                                                                    kPrimaryColor),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: Icon(
                                                              getIconFromString(
                                                                  data.icon),
                                                              size: 18,
                                                              color:
                                                                  kButtonColor,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          data.name!.toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                kWorkSans,
                                                            fontSize: 15,
                                                            color:
                                                                kPrimaryColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    isToggled
                                                        ? Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                              border: Border.all(
                                                                  color:
                                                                      kGreenColor),
                                                            ),
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(3.0),
                                                              child: Icon(
                                                                Icons.check,
                                                                size: 18,
                                                                color:
                                                                    kGreenColor,
                                                              ),
                                                            ),
                                                          )
                                                        : Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                              border: Border.all(
                                                                  color:
                                                                      kButtonColor),
                                                            ),
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(3.0),
                                                              child: Icon(
                                                                Icons.close,
                                                                size: 18,
                                                                color:
                                                                    kButtonColor,
                                                              ),
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return const Center(
                                            child: Text(
                                              "No Requests",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 15,
                                                  fontFamily:
                                                      kCircularStdMedium),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  );
                                }
                              } else {
                                return const Center(
                                  child: Text(
                                    "No Requests",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 15,
                                        fontFamily: kCircularStdMedium),
                                  ),
                                );
                              }
                            }
                          },
                        ),
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
                              isFormSubmitted = true;
                            });
                            FocusScope.of(context).requestFocus(FocusNode());
                            Future.delayed(const Duration(milliseconds: 100),
                                () async {
                              if (_formKey.currentState!.validate()) {
                                String comment = commentController.text;
                                jsonData.add({'Comment': comment});
                                LoaderX.show(context, 60.0, 60.0);
                                // print(updatedJson);
                                propertyCheckoutController
                                    .sendCheckoutProperties(updatedJson);
                              }
                            });
                            // createJson();
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
                        SizedBox(height: Platform.isAndroid ? 0 : 25,)
                      ],
                    ),
            ),
          ),
        ));
  }
}
