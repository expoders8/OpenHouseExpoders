import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';

import '../../models/state_model.dart';
import '../../view/amenities_view.dart';
import '../../models/country_model.dart';
import '../widgets/custom_textfield.dart';
import '../../services/lookup_service.dart';
import '../../services/properties_service.dart';
import '../../controller/amenities_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/loader_provider.dart';

class CreatePropertyPage extends StatefulWidget {
  final String? checkEdit;
  const CreatePropertyPage({super.key, this.checkEdit});

  @override
  State<CreatePropertyPage> createState() => _CreatePropertyPageState();
}

class _CreatePropertyPageState extends State<CreatePropertyPage> {
  String amenities = "";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController personController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController facilitiesController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController propertyPriceController = TextEditingController();
  PropertiesService propertiesService = PropertiesService();
  final GetAllAmenitiesController getAllAmenitiesController =
      Get.put(GetAllAmenitiesController());
  List<File> fileList = [];
  bool isImagePickerError = false;
  String countryId = "", stateid = "";
  final TextEditingController countryController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController washRoomsController = TextEditingController();
  final TextEditingController bedRoomsController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  LookupService lookupService = LookupService();
  bool isFormSubmitted = false;
  List<Asset> images = <Asset>[];
  String error = 'No Error Dectected';
  List<Asset> imageList = <Asset>[];
  List selctedImages = [];
  String selctesType = "included";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.checkEdit == "edit" ? "Edit Property" : "Create Property",
          style: const TextStyle(fontFamily: kCircularStdBook),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kBackGroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: propertyNameController,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kIconColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kIconColor),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kRedColor),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kRedColor),
                              ),
                              contentPadding: EdgeInsets.only(top: 5),
                              hintText: 'Property Name',
                              hintStyle: TextStyle(
                                fontFamily: kCircularStdNormal,
                                fontWeight: FontWeight.w400,
                                color: kPrimaryColor,
                                fontSize: 14,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter property name';
                              }
                              return null;
                            },
                          ),
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
                                borderSide: BorderSide(color: kIconColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kIconColor),
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Description';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15)
                        ],
                      ),
                    ),
                  ),
                ),
                buildTextWidget("Property Details"),
                SizedBox(
                  width: Get.width,
                  height: 65,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            flex: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: TypeAheadField<int>(
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: bedRoomsController,
                                  decoration: InputDecoration(
                                    fillColor: kWhiteColor,
                                    filled: true,
                                    hintText: "Bedrooms",
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        15, 15, 15, 0),
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
                                      borderSide: BorderSide(
                                          color: kWhiteColor, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          color: kWhiteColor, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: kWhiteColor,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          color: kWhiteColor, width: 1.0),
                                    ),
                                    errorText: isFormSubmitted &&
                                            bedRoomsController.text.isEmpty
                                        ? 'Please select a Bedroom'
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
                                  // Create a static list of numbers from 1 to 10
                                  List<int> numbers = List<int>.generate(
                                      10, (index) => index + 1);

                                  // Filter the list based on the user input
                                  return numbers
                                      .where((number) => number
                                          .toString()
                                          .contains(
                                              pattern)) // Filter suggestion
                                      .toList();
                                },
                                itemBuilder: (context, int suggestion) {
                                  return ListTile(
                                    title: Text(suggestion.toString()),
                                  );
                                },
                                onSuggestionSelected: (int suggestion) {
                                  setState(() {
                                    bedRoomsController.text =
                                        suggestion.toString();
                                  });
                                },
                                noItemsFoundBuilder: (context) => const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('No Bedrooms found'),
                                ),
                              ),
                            )),
                        const SizedBox(width: 10),
                        Flexible(
                            flex: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: TypeAheadField<int>(
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: washRoomsController,
                                  decoration: InputDecoration(
                                    fillColor: kWhiteColor,
                                    filled: true,
                                    hintText: "Washrooms",
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        15, 15, 15, 0),
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
                                      borderSide: BorderSide(
                                          color: kWhiteColor, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          color: kWhiteColor, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: kWhiteColor,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          color: kWhiteColor, width: 1.0),
                                    ),
                                    errorText: isFormSubmitted &&
                                            washRoomsController.text.isEmpty
                                        ? 'Please select a Washrooms'
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
                                  List<int> numbers = List<int>.generate(
                                      10, (index) => index + 1);
                                  return numbers
                                      .where((number) =>
                                          number.toString().contains(pattern))
                                      .toList();
                                },
                                itemBuilder: (context, int suggestion) {
                                  return ListTile(
                                    title: Text(suggestion.toString()),
                                  );
                                },
                                onSuggestionSelected: (int suggestion) {
                                  setState(() {
                                    washRoomsController.text =
                                        suggestion.toString();
                                  });
                                },
                                noItemsFoundBuilder: (context) => const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('No Washrooms found'),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: TypeAheadField<int>(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: capacityController,
                      decoration: InputDecoration(
                        fillColor: kWhiteColor,
                        filled: true,
                        hintText: "Capacity",
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
                            isFormSubmitted && capacityController.text.isEmpty
                                ? 'Please select a Capacity'
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
                      List<int> numbers =
                          List<int>.generate(10, (index) => index + 1);
                      return numbers
                          .where(
                              (number) => number.toString().contains(pattern))
                          .toList();
                    },
                    itemBuilder: (context, int suggestion) {
                      return ListTile(
                        title: Text(suggestion.toString()),
                      );
                    },
                    onSuggestionSelected: (int suggestion) {
                      setState(() {
                        capacityController.text = suggestion.toString();
                      });
                    },
                    noItemsFoundBuilder: (context) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('No Capacity found'),
                    ),
                  ),
                ),
                buildTextWidget("Property Bills"),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          selctesType = "included";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  border: Border.all(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    color: selctesType == "included"
                                        ? kPrimaryColor
                                        : kWhiteColor,
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Text(
                              "Included",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          selctesType = "notincluded";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3),
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    border: Border.all(color: kPrimaryColor),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                      color: selctesType == "notincluded"
                                          ? kPrimaryColor
                                          : kWhiteColor,
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Text(
                                "Not Included",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdMedium),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                buildTextWidget("Property Price"),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      width: constraints.maxWidth > 500
                          ? 600
                          : constraints.maxWidth,
                      child: CustomTextFormField(
                        hintText: '\$100',
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        ctrl: propertyPriceController,
                        name: "create",
                        formSubmitted: isFormSubmitted,
                        validationMsg: 'Please enter Property Price',
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      width: constraints.maxWidth > 500
                          ? 600
                          : constraints.maxWidth,
                      child: CustomTextFormField(
                        hintText: 'Facilities',
                        maxLines: 1,
                        ctrl: facilitiesController,
                        name: "create",
                        formSubmitted: isFormSubmitted,
                        validationMsg: 'Please enter facilities',
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      width: constraints.maxWidth > 500
                          ? 600
                          : constraints.maxWidth,
                      child: CustomTextFormField(
                        hintText: 'Person',
                        maxLines: 1,
                        ctrl: personController,
                        name: "create",
                        formSubmitted: isFormSubmitted,
                        validationMsg: 'Please enter Person',
                      ),
                    );
                  },
                ),
                buildTextWidget("Address"),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      width: constraints.maxWidth > 500
                          ? 600
                          : constraints.maxWidth,
                      child: CustomTextFormField(
                        hintText: 'Flat / House No / Building',
                        maxLines: 1,
                        ctrl: addressController,
                        name: "create",
                        formSubmitted: isFormSubmitted,
                        validationMsg: 'Please enter Address',
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: TypeAheadField<GetAllCountryDataModel>(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: countryController,
                      decoration: InputDecoration(
                        fillColor: kWhiteColor,
                        filled: true,
                        hintText: "Contry",
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
                            isFormSubmitted && countryController.text.isEmpty
                                ? 'Please select a country'
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
                      return lookupService.getcountries();
                    },
                    itemBuilder: (context, GetAllCountryDataModel suggestion) {
                      return ListTile(
                        title: Text(suggestion.name.toString()),
                      );
                    },
                    onSuggestionSelected: (GetAllCountryDataModel suggestion) {
                      setState(() {
                        countryController.text = suggestion.name.toString();
                        countryId = suggestion.id.toString();
                      });
                    },
                    noItemsFoundBuilder: (context) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('No country found'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: TypeAheadField<GetAllStateDataModel>(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: stateController,
                      enabled: countryId != "",
                      decoration: InputDecoration(
                        fillColor: kWhiteColor,
                        filled: true,
                        hintText: "State",
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
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: kWhiteColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: kWhiteColor, width: 1.0),
                        ),
                        errorBorder: OutlineInputBorder(
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
                        errorText:
                            isFormSubmitted && stateController.text.isEmpty
                                ? 'Please select a state'
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
                      return lookupService.getState(countryId);
                    },
                    itemBuilder: (context, GetAllStateDataModel suggestion) {
                      return ListTile(
                        title: Text(suggestion.name.toString()),
                      );
                    },
                    onSuggestionSelected: (GetAllStateDataModel suggestion) {
                      setState(() {
                        stateController.text = suggestion.name.toString();
                        stateid = suggestion.id.toString();
                      });
                    },
                    noItemsFoundBuilder: (context) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('No state found'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: size.width > 500 ? 600 : size.width,
                  child: CustomTextFormField(
                    hintText: 'city',
                    maxLines: 1,
                    ctrl: cityController,
                    name: "create",
                    formSubmitted: isFormSubmitted,
                    validationMsg: 'Please enter city',
                  ),
                ),
                const SizedBox(height: 10),
                AmenitiesView(
                  initialvalue: amenities,
                ),
                const SizedBox(height: 10),
                imageList.isEmpty
                    ? GestureDetector(
                        onTap: pickImage,
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
                                padding: const EdgeInsets.all(15.0),
                                child: DottedBorder(
                                  color: kBorderColor,
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(8),
                                  strokeWidth: 1,
                                  dashPattern: const [6, 6],
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/icons/upload_image.png",
                                          scale: 1.5,
                                        ),
                                        const SizedBox(height: 10),
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
                      )
                    : SizedBox(
                        height: imageList.length == 1 || imageList.length == 2
                            ? 120
                            : 240,
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          children: List.generate(6, (index) {
                            if (index < imageList.length) {
                              Asset asset = imageList[index];
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: AssetThumb(
                                            asset: asset,
                                            width: 120,
                                            height: 120,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              const Color.fromARGB(92, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 10,
                                      top: 10,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            imageList.removeAt(index);
                                            if (imageList.isEmpty) {
                                              isImagePickerError = true;
                                            }
                                          });
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: kWhiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (index == imageList.length) {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: GestureDetector(
                                  onTap: pickImage,
                                  child: DottedBorder(
                                    color: kRedColor,
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(8),
                                    strokeWidth: 1,
                                    dashPattern: const [6, 6],
                                    child: Center(
                                      child: Image.asset(
                                        "assets/icons/shareImage.png",
                                        color: kPrimaryColor,
                                        scale: 1.2,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                        ),
                      ),
                if (isImagePickerError)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      "Please upload at least one image",
                      style: TextStyle(
                          color: kErrorColor,
                          fontSize: 13,
                          fontFamily: kCircularStdNormal),
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
                        if (_formKey.currentState?.validate() ?? false) {
                          if (!isImagePickerError) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Future.delayed(const Duration(milliseconds: 100),
                                () async {
                              // ignore: use_build_context_synchronously
                              LoaderX.show(context, 60.0, 60.0);
                              // ignore: avoid_function_literals_in_foreach_calls
                              imageList.forEach((i) =>
                                  selctedImages.add(i.identifier.toString()));
                              getAllAmenitiesController.selectedImages(
                                selctedImages,
                              );
                              propertiesService.createProperties(
                                  propertyNameController.text,
                                  descriptionController.text,
                                  propertyPriceController.text,
                                  facilitiesController.text,
                                  personController.text,
                                  addressController.text,
                                  countryId,
                                  stateid,
                                  cityController.text,
                                  "",
                                  "",
                                  capacityController.text,
                                  bedRoomsController.text,
                                  washRoomsController.text,
                                  selctesType,
                                  fileList.first);
                            });
                          }
                        } else {
                          setState(() {
                            isFormSubmitted = true;
                            isImagePickerError = imageList.isEmpty;
                          });
                        }
                      },
                      child: const Text(
                        "Create a Property",
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

  pickImage() async {
    try {
      imageList = await MultiImagePicker.pickImages(
        selectedAssets: imageList.isEmpty ? images : imageList,
        iosOptions: const IOSOptions(
          doneButton: UIBarButtonItem(title: 'Confirm', tintColor: kRedColor),
          cancelButton:
              UIBarButtonItem(title: 'Cancel', tintColor: kRedAccentColor),
          albumButtonColor: kPrimaryColor,
          // settings: iosSettings,
        ),
        androidOptions: const AndroidOptions(
          actionBarColor: kRedColor,
          actionBarTitleColor: kWhiteColor,
          maxImages: 5,
          hasCameraInPickerPage: false,
          statusBarColor: kBlack26Color,
          actionBarTitle: "Select Photo",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: kRedColor,
        ),
      );

      for (var asset in imageList) {
        final filePath = await getFilePathFromAsset(asset);
        fileList.add(File(filePath));
      }
      setState(() {
        if (imageList.isNotEmpty) {
          isImagePickerError = false;
        }
      });
    } on Exception catch (e) {
      error = e.toString();
    }
  }

  Future<String> getFilePathFromAsset(Asset asset) async {
    final byteData = await asset.getByteData();
    final buffer = byteData.buffer;

    // Generate a unique temporary file path
    String tempPath = (await getTemporaryDirectory()).path;
    String filePath = '$tempPath/${asset.name}';

    // Write the file
    File file = File(filePath);
    await file.writeAsBytes(
      buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
    );

    return filePath;
  }
}
