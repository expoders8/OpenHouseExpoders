import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';

import '../../view/amenities_view.dart';
import 'package:http/http.dart' as http;
import '../../models/country_model.dart';
import '../widgets/custom_textfield.dart';
import '../../services/lookup_service.dart';
import '../../services/properties_service.dart';
import '../../controller/property_controller.dart';
import '../../controller/amenities_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/loader_provider.dart';

class CreatePropertyPage extends StatefulWidget {
  final String? checkEdit;
  final String? proeprtyId;
  final String? proeprtyName;
  final String? description;
  final String? bedrooms;
  final String? whoshrooms;
  final String? capacity;
  final String? selctesType;
  final String? price;
  final String? facilities;
  final String? person;
  final String? address;
  final String? country;
  final String? countryId;
  final String? state;
  final String? stateId;
  final String? city;
  final List? amenitiesid;
  final List? imagelist;

  const CreatePropertyPage({
    super.key,
    this.checkEdit,
    this.proeprtyId,
    this.proeprtyName,
    this.description,
    this.bedrooms,
    this.whoshrooms,
    this.capacity,
    this.selctesType,
    this.price,
    this.facilities,
    this.person,
    this.address,
    this.country,
    this.countryId,
    this.state,
    this.stateId,
    this.city,
    this.amenitiesid,
    this.imagelist,
  });

  @override
  State<CreatePropertyPage> createState() => _CreatePropertyPageState();
}

class _CreatePropertyPageState extends State<CreatePropertyPage> {
  String amenities = "";
  List selctedImages = [];
  List<File> fileList = [];
  bool isFormSubmitted = false;
  List<Asset> images = <Asset>[];
  String selctesType = "included";
  bool isImagePickerError = false;
  List<Asset> imageList = <Asset>[];
  String error = 'No Error Dectected';
  String countryId = "", stateid = "", propertyId = "";
  final _formKey = GlobalKey<FormState>();
  LookupService lookupService = LookupService();
  PropertiesService propertiesService = PropertiesService();
  final GetAllAmenitiesController getAllAmenitiesController =
      Get.put(GetAllAmenitiesController());
  final GetCurrentPropertyController getCurrentPropertyController =
      Get.put(GetCurrentPropertyController());
  final TextEditingController cityController = TextEditingController();
  final TextEditingController personController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController bedRoomsController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController washRoomsController = TextEditingController();
  final TextEditingController facilitiesController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController propertyPriceController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.checkEdit == "edit") {
        setState(() {
          initialImagePaths = widget.imagelist!;
          loadInitialImages();
        });
        getPropertyData();
      }
    });
  }

  @override
  void dispose() {
    LoaderX.hide();
    super.dispose();
  }

  List<dynamic> initialImagePaths = [];

  getPropertyData() {
    LoaderX.show(context, 60.0, 60.0);
    propertyId = widget.proeprtyId.toString() == "null"
        ? ""
        : widget.proeprtyId.toString();
    propertyNameController.text = widget.proeprtyName.toString() == "null"
        ? ""
        : widget.proeprtyName.toString();
    descriptionController.text = widget.description.toString() == "null"
        ? ""
        : widget.description.toString();
    propertyPriceController.text =
        widget.price.toString() == "null" ? "" : widget.price.toString();
    facilitiesController.text = widget.facilities.toString() == "null"
        ? ""
        : widget.facilities.toString();
    personController.text =
        widget.person.toString() == "null" ? "" : widget.person.toString();
    addressController.text =
        widget.address.toString() == "null" ? "" : widget.address.toString();
    countryController.text =
        widget.country.toString() == "null" ? "" : widget.country.toString();
    countryId = widget.countryId.toString() == "null"
        ? ""
        : widget.countryId.toString();

    stateid =
        widget.stateId.toString() == "null" ? "" : widget.stateId.toString();
    cityController.text =
        widget.city.toString() == "null" ? "" : widget.city.toString();
    capacityController.text =
        widget.capacity.toString() == "null" ? "" : widget.capacity.toString();
    bedRoomsController.text =
        widget.bedrooms.toString() == "null" ? "" : widget.bedrooms.toString();
    washRoomsController.text = widget.whoshrooms.toString() == "null"
        ? ""
        : widget.whoshrooms.toString();
    // selctesType = widget.selctesType.toString() == "null"
    //     ? ""
    //     : widget.selctesType.toString();
    selctesType = "included";
    amenities = widget.amenitiesid.toString() == "null"
        ? ""
        : widget.selctesType.toString();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.checkEdit == "edit" ? "Edit Property" : "Create Property",
          style: const TextStyle(fontFamily: kCircularStdBook),
        ),
        automaticallyImplyLeading: widget.checkEdit == "edit" ? true : false,
        centerTitle: true,
        backgroundColor: kBackGroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextWidget("Property Name"),
                CustomTextFormField(
                  hintText: 'Property Name',
                  maxLines: 1,
                  ctrl: propertyNameController,
                  name: "create",
                  formSubmitted: isFormSubmitted,
                  validationMsg: 'Please enter property name',
                ),
                buildTextWidget("Description"),
                CustomTextFormField(
                  hintText: 'Description',
                  maxLines: 1,
                  ctrl: descriptionController,
                  name: "create",
                  formSubmitted: isFormSubmitted,
                  validationMsg: 'Please enter Description',
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
                buildTextWidget("Rent per month"),
                CustomTextFormField(
                  hintText: '\$100',
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  ctrl: propertyPriceController,
                  name: "iamount",
                  formSubmitted: isFormSubmitted,
                  validationMsg: 'Please enter Property Price',
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Notes..',
                  maxLines: 1,
                  ctrl: facilitiesController,
                  name: "create",
                  formSubmitted: isFormSubmitted,
                  validationMsg: 'Please enter facilities',
                ),
                buildTextWidget("Address"),
                CustomTextFormField(
                  hintText: 'Flat / House No / Building',
                  maxLines: 1,
                  ctrl: addressController,
                  name: "create",
                  formSubmitted: isFormSubmitted,
                  validationMsg: 'Please enter Address',
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
                SizedBox(
                  width: size.width > 500 ? 600 : size.width,
                  child: CustomTextFormField(
                    hintText: 'City',
                    maxLines: 1,
                    ctrl: cityController,
                    name: "create",
                    formSubmitted: isFormSubmitted,
                    validationMsg: 'Please enter city',
                  ),
                ),
                const SizedBox(height: 10),
                AmenitiesView(
                  initialAmenitiesIds: widget.amenitiesid,
                ),
                const SizedBox(height: 10),
                imageList.isEmpty && fileList.isEmpty
                    ? GestureDetector(
                        onTap: pickImage,
                        child: SizedBox(
                          height: 150,
                          child: Card(
                            shadowColor: const Color.fromARGB(20, 0, 0, 0),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: const BorderSide(color: Colors.white)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: DottedBorder(
                                  color: Colors.grey,
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
                            if (index < fileList.length) {
                              File file = fileList[index];
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
                                          child: Image.file(file),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 10,
                                      top: 10,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            fileList.removeAt(index);
                                            if (fileList.isEmpty) {
                                              isImagePickerError = true;
                                            }
                                          });
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (index == fileList.length) {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: GestureDetector(
                                  onTap: pickImage,
                                  child: DottedBorder(
                                    color: Colors.red,
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(8),
                                    strokeWidth: 1,
                                    dashPattern: const [6, 6],
                                    child: Center(
                                      child: Image.asset(
                                        "assets/icons/shareImage.png",
                                        color: Colors.red,
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
                      style: TextStyle(color: Colors.red, fontSize: 13),
                    ),
                  ),
                const SizedBox(height: 20),
                widget.checkEdit == "edit"
                    ? Padding(
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
                                if (!isImagePickerError &&
                                    bedRoomsController.value.text != "" &&
                                    capacityController.value.text != "" &&
                                    countryController.value.text != "" &&
                                    washRoomsController.value.text != "") {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  Future.delayed(
                                      const Duration(milliseconds: 100),
                                      () async {
                                    // ignore: use_build_context_synchronously
                                    LoaderX.show(context, 60.0, 60.0);
                                    // ignore: avoid_function_literals_in_foreach_calls
                                    imageList.forEach((i) => selctedImages
                                        .add(i.identifier.toString()));
                                    getAllAmenitiesController.selectedImages(
                                      selctedImages,
                                    );
                                    propertiesService
                                        .editProperties(
                                            propertyNameController.text,
                                            descriptionController.text,
                                            propertyPriceController.text,
                                            facilitiesController.text,
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
                                            propertyId,
                                            fileList)
                                        .then((value) {
                                      if (value) {
                                        propertyNameController.clear();
                                        descriptionController.clear();
                                        propertyPriceController.clear();
                                        facilitiesController.clear();
                                        personController.clear();
                                        addressController.clear();
                                        countryId = "";
                                        stateid = "";
                                        cityController.clear();
                                        countryController.clear();
                                        capacityController.clear();
                                        bedRoomsController.clear();
                                        washRoomsController.clear();
                                        selctesType = "";
                                        fileList = [];
                                      }
                                    });
                                  });
                                } else {
                                  setState(() {
                                    isFormSubmitted = true;
                                    isImagePickerError = fileList.isEmpty;
                                  });
                                }
                              } else {
                                setState(() {
                                  isFormSubmitted = true;
                                  isImagePickerError = fileList.isEmpty;
                                });
                              }
                            },
                            child: const Text(
                              "Edit Property",
                              style: TextStyle(color: kWhiteColor),
                            ),
                          ),
                        ),
                      )
                    : Padding(
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
                                if (!isImagePickerError &&
                                    bedRoomsController.value.text != "" &&
                                    capacityController.value.text != "" &&
                                    countryController.value.text != "" &&
                                    washRoomsController.value.text != "") {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  Future.delayed(
                                      const Duration(milliseconds: 100),
                                      () async {
                                    // ignore: use_build_context_synchronously
                                    LoaderX.show(context, 60.0, 60.0);
                                    // ignore: avoid_function_literals_in_foreach_calls
                                    imageList.forEach((i) => selctedImages
                                        .add(i.identifier.toString()));
                                    getAllAmenitiesController.selectedImages(
                                      selctedImages,
                                    );
                                    propertiesService
                                        .createProperties(
                                            propertyNameController.text,
                                            descriptionController.text,
                                            propertyPriceController.text,
                                            facilitiesController.text,
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
                                            "null",
                                            fileList)
                                        .then((value) {
                                      if (value) {
                                        propertyNameController.clear();
                                        descriptionController.clear();
                                        propertyPriceController.clear();
                                        facilitiesController.clear();
                                        personController.clear();
                                        addressController.clear();
                                        countryId = "";
                                        stateid = "";
                                        cityController.clear();
                                        countryController.clear();
                                        capacityController.clear();
                                        bedRoomsController.clear();
                                        washRoomsController.clear();
                                        selctesType = "";
                                        fileList = [];
                                      }
                                    });
                                  });
                                } else {
                                  setState(() {
                                    isFormSubmitted = true;
                                    isImagePickerError = fileList.isEmpty;
                                  });
                                }
                              } else {
                                setState(() {
                                  isFormSubmitted = true;
                                  isImagePickerError = fileList.isEmpty;
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
                SizedBox(height: widget.checkEdit == "edit" ? 10 : 90)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loadInitialImages() async {
    try {
      for (var path in initialImagePaths) {
        if (path.startsWith('http')) {
          File file = await _downloadImageFromUrl(path);
          setState(() {
            fileList.add(file);
          });
        } else {
          File file = File(path);
          if (await file.exists()) {
            setState(() {
              fileList.add(file);
            });
          } else {
            print('Local file does not exist: $path');
          }
        }
      }
      setState(() {
        isImagePickerError = false;
      });
      LoaderX.hide();
    } catch (e) {
      LoaderX.hide();
      setState(() {
        isImagePickerError = true;
        error = e.toString();
      });
    }
  }

  Future<File> _downloadImageFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String tempPath = (await getTemporaryDirectory()).path;
        String fileName = url.split('/').last;
        String filePath = '$tempPath/$fileName';
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return file;
      } else {
        throw Exception("Failed to download image: ${response.statusCode}");
      }
    } catch (e) {
      print('Error downloading image: $e');
      return File('');
    }
  }

  Widget buildTextWidget(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(7, 20, 0, 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontFamily: 'kCircularStdBold',
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    try {
      List<Asset> pickedImages = await MultiImagePicker.pickImages(
        selectedAssets: imageList.isEmpty ? [] : imageList,
        iosOptions: const IOSOptions(
          doneButton: UIBarButtonItem(title: 'Confirm', tintColor: Colors.red),
          cancelButton:
              UIBarButtonItem(title: 'Cancel', tintColor: Colors.redAccent),
          albumButtonColor: Colors.blue,
        ),
        androidOptions: const AndroidOptions(
          actionBarColor: Colors.red,
          actionBarTitleColor: Colors.white,
          maxImages: 5,
          hasCameraInPickerPage: false,
          statusBarColor: Colors.black26,
          actionBarTitle: "Select Photo",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: Colors.red,
        ),
      );

      if (pickedImages.isNotEmpty) {
        imageList = pickedImages;
        // fileList.clear(); // Clear previous files and re-add initial paths
        // loadInitialImages(); // Reload initial images

        for (var asset in imageList) {
          final filePath = await getFilePathFromAsset(asset);
          setState(() {
            fileList.add(File(filePath));
          });
        }
        setState(() {
          isImagePickerError = false;
        });
      }
    } on Exception catch (e) {
      setState(() {
        error = e.toString();
        isImagePickerError = true;
      });
    }
  }

  Future<String> getFilePathFromAsset(Asset asset) async {
    final byteData = await asset.getByteData();
    final buffer = byteData.buffer;
    String tempPath = (await getTemporaryDirectory()).path;
    String filePath = '$tempPath/${asset.name}';
    File file = File(filePath);
    await file.writeAsBytes(
      buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
    );
    return filePath;
  }
}
