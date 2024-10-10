import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';

import '../widgets/custom_textfield.dart';
import '../../services/tenant_service.dart';
import '../../controller/tab_controller.dart';
import '../../controller/tenants_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/loader_provider.dart';

class InviteTenantDetailPage extends StatefulWidget {
  const InviteTenantDetailPage({super.key});

  @override
  State<InviteTenantDetailPage> createState() => _InviteTenantDetailPageState();
}

class _InviteTenantDetailPageState extends State<InviteTenantDetailPage> {
  bool checkedValue = false,
      isFormSubmitted = false,
      endDateError = false,
      startDateError = false;
  final tabController = Get.put(TabCountController());
  TextEditingController amountController = TextEditingController();
  final GetAllTenantController getAllTenantController =
      Get.put(GetAllTenantController());
  TenantService tenantService = TenantService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String pickedStartDate = "";
  String selectedStartDate = "";
  String pickedEndDate = "";
  String selectedEndDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Invite Tenant",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        backgroundColor: kBackGroundColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: Get.width - 35,
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: startDateError ? kErrorColor : kWhiteColor)),
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        BottomPicker.date(
                          pickerTitle: const Text(""),
                          onSubmit: (index) {
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(index);
                            String formattedstartDate =
                                DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                                    .format(index);
                            if (mounted) {
                              setState(() {
                                selectedStartDate = formattedDate;
                                pickedStartDate = formattedstartDate;
                                startDateError = false;
                              });
                            }
                          },
                          dateOrder: DatePickerDateOrder.ymd,
                          minDateTime: DateTime(2024, 1, 1, 17, 57, 25),
                          maxDateTime: DateTime(2050, 1, 1),
                          pickerTextStyle: const TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          onClose: () {
                            Navigator.of(context).pop();
                          },
                          bottomPickerTheme: BottomPickerTheme.plumPlate,
                          buttonAlignment: MainAxisAlignment.center,
                          buttonContent: const Center(
                              child: Text(
                            "Save",
                            style: TextStyle(color: kWhiteColor),
                          )),
                          buttonStyle: BoxDecoration(
                              color: kButtonColor,
                              borderRadius: BorderRadius.circular(15)),
                          closeIconColor: kPrimaryColor,
                          closeIconSize: 25,
                        ).show(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedStartDate == ""
                                ? "Start Date"
                                : selectedStartDate,
                            style: const TextStyle(
                              fontFamily: kCircularStdBook,
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor,
                              fontSize: 14,
                            ),
                          ),
                          const Icon(
                            Icons.calendar_month,
                            size: 18.0,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isFormSubmitted && startDateError)
                    const Padding(
                      padding: EdgeInsets.only(top: 6.0, left: 12),
                      child: Text(
                        "Please select Start Date",
                        style: TextStyle(
                          color: kErrorColor,
                          fontFamily: kCircularStdNormal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: Get.width - 35,
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: endDateError ? kErrorColor : kWhiteColor)),
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        BottomPicker.date(
                          pickerTitle: const Text(""),
                          onSubmit: (index) {
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(index);
                            String formattedEndDate =
                                DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                                    .format(index);
                            if (mounted) {
                              setState(() {
                                selectedEndDate = formattedDate;
                                pickedEndDate = formattedEndDate;
                                endDateError = false;
                              });
                            }
                          },
                          dateOrder: DatePickerDateOrder.ymd,
                          minDateTime: DateTime(2024, 1, 1, 17, 57, 25),
                          maxDateTime: DateTime(2050, 1, 1),
                          pickerTextStyle: const TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          onClose: () {
                            Navigator.of(context).pop();
                          },
                          bottomPickerTheme: BottomPickerTheme.plumPlate,
                          buttonAlignment: MainAxisAlignment.center,
                          buttonContent: const Center(
                              child: Text(
                            "Save",
                            style: TextStyle(color: kWhiteColor),
                          )),
                          buttonStyle: BoxDecoration(
                              color: kButtonColor,
                              borderRadius: BorderRadius.circular(15)),
                          closeIconColor: kPrimaryColor,
                          closeIconSize: 25,
                        ).show(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedEndDate == ""
                                ? "End Date"
                                : selectedEndDate,
                            style: const TextStyle(
                              fontFamily: kCircularStdBook,
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor,
                              fontSize: 14,
                            ),
                          ),
                          const Icon(
                            Icons.calendar_month,
                            size: 18.0,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isFormSubmitted && endDateError)
                    const Padding(
                      padding: EdgeInsets.only(top: 6.0, left: 12),
                      child: Text(
                        "Please select End Date",
                        style: TextStyle(
                          color: kErrorColor,
                          fontFamily: kCircularStdNormal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                hintText: '\$ Amount',
                maxLines: 1,
                ctrl: amountController,
                keyboardType: TextInputType.number,
                name: "iamount",
                validationMsg: 'Please enter amount',
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Checkbox(
                    checkColor: kWhiteColor,
                    activeColor: kButtonColor,
                    value: checkedValue,
                    onChanged: (value) {
                      setState(() {
                        checkedValue = value!;
                      });
                    },
                  ),
                  const Text(
                    "The property shall be used solely\nfor residential purposes.",
                    style: TextStyle(color: kBlackColor),
                  )
                ],
              ),
              const SizedBox(height: 15),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    isFormSubmitted = true;
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                  Future.delayed(const Duration(milliseconds: 100), () async {
                    if (_formKey.currentState!.validate() &&
                        pickedStartDate != "" &&
                        pickedEndDate != "") {
                      getAllTenantController.startDate(pickedStartDate);
                      getAllTenantController.endDate(pickedEndDate);
                      getAllTenantController.rentAmount(amountController.text);
                      LoaderX.show(context, 60.0, 60.0);
                      tenantService.inviteTenant();
                    } else {
                      if (pickedStartDate == "") {
                        setState(() {
                          startDateError = true;
                        });
                      } else {
                        setState(() {
                          startDateError = false;
                        });
                      }

                      if (pickedEndDate == "") {
                        setState(() {
                          endDateError = true;
                        });
                      } else {
                        setState(() {
                          endDateError = false;
                        });
                      }
                    }
                  });
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: kWhiteColor),
                      color: kButtonColor),
                  child: const Center(
                    child: Text(
                      "Next",
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
      ),
    );
  }
}
