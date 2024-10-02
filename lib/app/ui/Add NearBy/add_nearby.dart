import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';
import '../../services/nearby_service.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/loader_provider.dart';

class AddNearByPage extends StatefulWidget {
  final String? propertyId;
  const AddNearByPage({super.key, this.propertyId});

  @override
  State<AddNearByPage> createState() => _AddNearByPageState();
}

class _AddNearByPageState extends State<AddNearByPage> {
  String amenitiesId = "";
  bool isFormSubmitted = false;
  final _formKey = GlobalKey<FormState>();
  NearByService nearByService = NearByService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Nearby",
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
                  buildTextWidget("Name"),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    width: Get.width > 500 ? 600 : Get.width - 42,
                    child: CustomTextFormField(
                      hintText: 'Name',
                      maxLines: 1,
                      ctrl: nameController,
                      name: "name",
                      formSubmitted: isFormSubmitted,
                      validationMsg: 'Please enter Name',
                    ),
                  ),
                  buildTextWidget("Type"),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    width: Get.width > 500 ? 600 : Get.width - 42,
                    child: CustomTextFormField(
                      hintText: 'Type Name',
                      maxLines: 1,
                      ctrl: typeController,
                      name: "name",
                      formSubmitted: isFormSubmitted,
                      validationMsg: 'Please enter Type Name',
                    ),
                  ),
                  buildTextWidget("Address"),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    width: Get.width > 500 ? 600 : Get.width - 42,
                    child: CustomTextFormField(
                      hintText: 'Flat / House No / Building',
                      maxLines: 1,
                      ctrl: addressController,
                      name: "address",
                      formSubmitted: isFormSubmitted,
                      validationMsg: 'Please enter Address',
                    ),
                  ),
                  const SizedBox(height: 25),
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
                              nearByService.add(
                                  nameController.text,
                                  typeController.text,
                                  addressController.text,
                                  widget.propertyId!);
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
