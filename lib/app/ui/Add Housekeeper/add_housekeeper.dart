import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/provider/loader_provider.dart';
import '../../services/house_keeper_service.dart';
import '../widgets/custom_textfield.dart';

class AddHousekeeperPage extends StatefulWidget {
  final String? propertyId;
  const AddHousekeeperPage({super.key, this.propertyId});

  @override
  State<AddHousekeeperPage> createState() => _AddHousekeeperPageState();
}

class _AddHousekeeperPageState extends State<AddHousekeeperPage> {
  bool isFormSubmitted = false;
  String selectedCountrydialCode = "+91";
  final _formKey = GlobalKey<FormState>();
  HouseKeeperService houseKeeperService = HouseKeeperService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Housekeeper",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        backgroundColor: kBackGroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: SizedBox(
              height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextWidget("First Name"),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: CustomTextFormField(
                      hintText: 'First Name',
                      maxLines: 1,
                      ctrl: firstnameController,
                      name: "name",
                      formSubmitted: isFormSubmitted,
                      validationMsg: 'Please enter First Name',
                    ),
                  ),
                  buildTextWidget("Last Name"),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: CustomTextFormField(
                      hintText: 'Last Name',
                      maxLines: 1,
                      ctrl: lastNameController,
                      name: "name",
                      formSubmitted: isFormSubmitted,
                      validationMsg: 'Please enter Last Name',
                    ),
                  ),
                  buildTextWidget("Email"),
                  CustomTextFormField(
                    hintText: 'Email',
                    maxLines: 1,
                    prefixIcon: "assets/icons/email.png",
                    ctrl: emailController,
                    name: "email",
                    formSubmitted: isFormSubmitted,
                    validationMsg: 'Please enter email',
                  ),
                  buildTextWidget("Phone no."),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: kBackGroundColor,
                                  border:
                                      Border.all(color: kSecondaryPrimaryColor),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  children: [
                                    CountryListPick(
                                      theme: CountryTheme(
                                        isShowFlag: true,
                                        isShowTitle: false,
                                        isShowCode: false,
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
                                    Text(
                                      selectedCountrydialCode,
                                      style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 10)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                hintText: 'PhoneNo',
                                maxLines: 1,
                                ctrl: contactController,
                                keyboardType: TextInputType.phone,
                                name: "phoneno",
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                formSubmitted: isFormSubmitted,
                                validationMsg: 'Please enter mobile number',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
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
                        onPressed: () {
                          setState(() {
                            isFormSubmitted = true;
                          });
                          FocusScope.of(context).requestFocus(FocusNode());
                          Future.delayed(const Duration(milliseconds: 100),
                              () async {
                            if (_formKey.currentState!.validate()) {
                              LoaderX.show(context, 60.0, 60.0);
                              houseKeeperService.add(
                                  firstnameController.text,
                                  lastNameController.text,
                                  emailController.text,
                                  "$selectedCountrydialCode${contactController.text}",
                                  widget.propertyId.toString());
                            }
                          });
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: kWhiteColor),
                        ),
                      ),
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
}
