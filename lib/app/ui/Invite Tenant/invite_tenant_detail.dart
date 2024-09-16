import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../controller/tab_controller.dart';
import '../widgets/custom_textfield.dart';
import '../../services/tenant_service.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/custom_datepicker.dart';

class InviteTenantDetailPage extends StatefulWidget {
  const InviteTenantDetailPage({super.key});

  @override
  State<InviteTenantDetailPage> createState() => _InviteTenantDetailPageState();
}

class _InviteTenantDetailPageState extends State<InviteTenantDetailPage> {
  String startdate = "";
  String enddate = "";
  bool checkedValue = false;
  final tabController = Get.put(TabCountController());
  TextEditingController amountController = TextEditingController();
  TenantService tenantService = TenantService();
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
        child: Column(
          children: [
            const SizedBox(height: 40),
            CustomDatePicker(
              hintText: "Start date",
              selectedDate: (newValue) {
                setState(() {
                  startdate = newValue;
                });
              },
              birthDateError: false,
            ),
            const SizedBox(height: 15),
            CustomDatePicker(
              hintText: "End date",
              selectedDate: (newValue) {
                setState(() {
                  startdate = newValue;
                });
              },
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
                tabController.changeTabIndex(2);
                // tenantService.inviteTenant(startdate.toString(),
                //     enddate.toString(), amountController.value.text);
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
    );
  }
}
