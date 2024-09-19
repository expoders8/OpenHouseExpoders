import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/custom_textfield.dart';
import '../../services/tenant_service.dart';
import '../../controller/tab_controller.dart';
import '../../controller/tenants_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/custom_datepicker.dart';

class InviteTenantDetailPage extends StatefulWidget {
  const InviteTenantDetailPage({super.key});

  @override
  State<InviteTenantDetailPage> createState() => _InviteTenantDetailPageState();
}

class _InviteTenantDetailPageState extends State<InviteTenantDetailPage> {
  DateTime? startdate;
  DateTime? enddate;
  bool checkedValue = false;
  final tabController = Get.put(TabCountController());
  TextEditingController amountController = TextEditingController();
  final GetAllTenantController getAllTenantController =
      Get.put(GetAllTenantController());
  TenantService tenantService = TenantService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              const CustomDatePicker(
                hintText: "Start date",
                name: "start",
                birthDateError: false,
              ),
              const SizedBox(height: 15),
              const CustomDatePicker(
                hintText: "End date",
                name: "end",
                birthDateError: false,
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                hintText: 'Amount',
                maxLines: 1,
                ctrl: amountController,
                name: "",
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
                  if (_formKey.currentState!.validate()) {}
                  getAllTenantController.rentAmount(amountController.text);
                  tenantService.inviteTenant();
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
