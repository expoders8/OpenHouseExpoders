import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../config/provider/loader_provider.dart';
import '../../services/properties_service.dart';
import '../widgets/custom_textfield.dart';
import '../../services/lookup_service.dart';
import '../../models/get_amenities_model.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class AddExpensePage extends StatefulWidget {
  final String? propertyId;
  const AddExpensePage({super.key, this.propertyId});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  String amenitiesId = "";
  bool isFormSubmitted = false;
  final _formKey = GlobalKey<FormState>();
  LookupService lookupService = LookupService();
  PropertiesService propertiesService = PropertiesService();
  final TextEditingController amenityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Expenses",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        backgroundColor: kBackGroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextWidget("Amenity"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: TypeAheadField<GetAllAmenitiesDataModel>(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: amenityController,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'^ ')),
                      ],
                      decoration: InputDecoration(
                        fillColor: kWhiteColor,
                        filled: true,
                        hintText: "Amenity",
                        contentPadding:
                            const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        hintStyle: const TextStyle(
                          fontFamily: kCircularStdBook,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor,
                          fontSize: 14,
                        ),
                        hintMaxLines: 1,
                        suffixIcon: Image.asset(
                          "assets/icons/polygon_down.png",
                          scale: 2,
                          width: 5,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide:
                              BorderSide(color: kWhiteColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: kWhiteColor, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: kWhiteColor,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: kWhiteColor, width: 1.0),
                        ),
                        errorText:
                            isFormSubmitted && amenityController.text.isEmpty
                                ? 'Please select a Amenities'
                                : null,
                      ),
                      style: const TextStyle(
                        fontFamily: kCircularStdBook,
                        fontWeight: FontWeight.w400,
                        color: kPrimaryColor,
                        fontSize: 14,
                      ),
                      autocorrect: true,
                      cursorColor: kPrimaryColor,
                    ),
                    suggestionsCallback: (pattern) {
                      return lookupService.getamenities();
                    },
                    itemBuilder:
                        (context, GetAllAmenitiesDataModel suggestion) {
                      return ListTile(
                        title: Text(suggestion.title.toString()),
                      );
                    },
                    onSuggestionSelected:
                        (GetAllAmenitiesDataModel suggestion) {
                      setState(() {
                        amenityController.text = suggestion.title.toString();
                        amenitiesId = suggestion.id.toString();
                      });
                    },
                    noItemsFoundBuilder: (context) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('No Amenity found'),
                    ),
                  ),
                ),
                amenityController.text == "other"
                    ? Container(
                        margin: const EdgeInsets.only(left: 5),
                        width: Get.width > 500 ? 600 : Get.width - 42,
                        child: CustomTextFormField(
                          hintText: 'Amenities title',
                          maxLines: 1,
                          ctrl: priceController,
                          name: "title",
                          formSubmitted: isFormSubmitted,
                          validationMsg: 'Please enter Price',
                        ),
                      )
                    : Container(),
                buildTextWidget("Price"),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  width: Get.width > 500 ? 600 : Get.width - 42,
                  child: CustomTextFormField(
                    hintText: 'Price',
                    maxLines: 1,
                    ctrl: priceController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(5),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    name: "price",
                    formSubmitted: isFormSubmitted,
                    validationMsg: 'Please enter Price',
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
                            if (amenityController.value.text != "" &&
                                priceController.value.text != "") {
                              LoaderX.show(context, 60.0, 60.0);
                              propertiesService.addExpense(amenitiesId,
                                  priceController.text, widget.propertyId);
                            }
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
                const SizedBox(height: 90)
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
}
