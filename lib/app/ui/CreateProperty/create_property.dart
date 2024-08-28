import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
import 'package:openhome/app/view/amenities_view.dart';
import 'package:path_provider/path_provider.dart';

import '../../controller/amenities_controller.dart';
import '../../models/country_model.dart';
import '../../models/state_model.dart';
import '../../services/lookup_service.dart';
import '../../services/properties_service.dart';
import '../widgets/custom_textfield.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class CreatePropertyPage extends StatefulWidget {
  final String? checkEdit;
  const CreatePropertyPage({super.key, this.checkEdit});

  @override
  State<CreatePropertyPage> createState() => _CreatePropertyPageState();
}

class _CreatePropertyPageState extends State<CreatePropertyPage> {
  String amenities = "", amenitiesid = "";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController sellController = TextEditingController();
  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController personController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController propertyPriceController = TextEditingController();
  PropertiesService propertiesService = PropertiesService();
  // final GetAllAmenitiesController getAllAmenitiesController =
  //     Get.put(GetAllAmenitiesController());
  List<File> fileList = [];

  String countryId = "", stateid = "";
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  bool isTouched = false;
  bool isFormSubmitted = false;
  List<Asset> images = <Asset>[];
  String error = 'No Error Dectected';
  List<Asset> imageList = <Asset>[];
  List selctedImages = [];
  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Philadelphia',
    'San Antonio',
    'San Diego',
    'Dallas',
    'San Jose',
  ];
  final List<String> states = [
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'Florida',
    'Georgia',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
  ];
  final List<String> countries = [
    'United States',
    'Canada',
    'Mexico',
    'United Kingdom',
    'Germany',
    'France',
    'India',
    'China',
    'Japan',
    'Australia',
  ];
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: propertyNameController,
                                    textInputAction: TextInputAction.next,
                                    onChanged: ((value) {}),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kIconColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kIconColor),
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
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                        borderSide:
                                            BorderSide(color: kIconColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kIconColor),
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
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 25)
                      ],
                    ),
                  ),
                ),
                buildTextWidget("Property Price"),
                SizedBox(
                  width: size.width > 500 ? 600 : size.width,
                  child: CustomTextFormField(
                    hintText: '\$100',
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    ctrl: propertyPriceController,
                    name: "create",
                    formSubmitted: isFormSubmitted,
                    validationMsg: 'Please enter Property Price',
                  ),
                ),
                const SizedBox(height: 10),
                // SizedBox(
                //   width: size.width > 500 ? 600 : size.width,
                //   child: CustomTextFormField(
                //     hintText: 'Facilities',
                //     maxLines: 1,
                //     ctrl: ,
                //     name: "create",
                //     formSubmitted: isFormSubmitted,
                //     validationMsg: 'Please enter facilities',
                //   ),
                // ),
                // const SizedBox(height: 10),
                SizedBox(
                  width: size.width > 500 ? 600 : size.width,
                  child: CustomTextFormField(
                    hintText: 'Person',
                    maxLines: 1,
                    ctrl: personController,
                    name: "create",
                    formSubmitted: isFormSubmitted,
                    validationMsg: 'Please enter Person',
                  ),
                ),
                buildTextWidget("Address"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (isTouched || isFormSubmitted) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Address';
                            }
                          }
                          return null;
                        },
                        controller: addressController,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) => {
                          isTouched = true,
                        },
                        decoration: InputDecoration(
                          hintText: "Flat / House No / Building",
                          counterText: "",
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          hintStyle: const TextStyle(
                            fontFamily: kCircularStdBook,
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: kWhiteColor,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide:
                                BorderSide(color: kWhiteColor, width: 1.0),
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
                        ),
                      ),
                    ],
                  ),
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
                      return LookupService.getcountries();
                    },
                    itemBuilder: (context, GetAllCountryDataModel suggestion) {
                      return ListTile(
                        title: Text(suggestion.name.toString()),
                      );
                    },
                    onSuggestionSelected: (GetAllCountryDataModel suggestion) {
                      // ignore: avoid_print
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
                      return LookupService.getState(countryId);
                    },
                    itemBuilder: (context, GetAllStateDataModel suggestion) {
                      return ListTile(
                        title: Text(suggestion.name.toString()),
                      );
                    },
                    onSuggestionSelected: (GetAllStateDataModel suggestion) {
                      // ignore: avoid_print
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
                    validationMsg: 'Please enter Person',
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
                        height: imageList.length == 2 ? 150 : 260,
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
                                      borderRadius: BorderRadius.circular(10),
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
                                        height: 130,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
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
                        // imageList.forEach(
                        //     (i) => selctedImages.add(i.identifier.toString()));
                        // getAllAmenitiesController.selectedImages(
                        //   selctedImages,
                        // );
                        // propertiesService.createProperties(
                        //     propertyNameController.text,
                        //     descriptionController.text,
                        //     propertyPriceController.text,
                        //     amenities,
                        //     personController.text,
                        //     addressController.text,
                        //     countryId,
                        //     stateid,
                        //     cityController.text,
                        //     "",
                        //     "",
                        //     imageList);
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
      setState(() {});
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
