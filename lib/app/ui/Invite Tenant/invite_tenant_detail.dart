import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/custom_textfield.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/custom_datepicker.dart';

class InviteTenantDetailPage extends StatefulWidget {
  const InviteTenantDetailPage({super.key});

  @override
  State<InviteTenantDetailPage> createState() => _InviteTenantDetailPageState();
}

class _InviteTenantDetailPageState extends State<InviteTenantDetailPage> {
  TextEditingController amountController = TextEditingController();
  int userAge = 0;
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
              selectedAgeYear: (newValue) {
                setState(() {
                  userAge = newValue;
                });
              },
              birthDateError: false,
            ),
            const SizedBox(height: 15),
            CustomDatePicker(
              hintText: "End date",
              selectedAgeYear: (newValue) {
                setState(() {
                  userAge = newValue;
                });
              },
              birthDateError: false,
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
              hintText: 'Amount',
              maxLines: 1,
              ctrl: amountController,
              name: "email",
              validationMsg: 'Please enter email',
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: kBorderColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 9.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
