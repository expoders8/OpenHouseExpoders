import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../widgets/custom_textfield.dart';
import '../../services/lookup_service.dart';
import '../../controller/tab_controller.dart';
import '../../services/requests_service.dart';
import '../../models/get_amenities_model.dart';
import '../../controller/request_controller.dart';
import '../../controller/property_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/loader_provider.dart';

class CreateMyRequestsPage extends StatefulWidget {
  const CreateMyRequestsPage({super.key});

  @override
  State<CreateMyRequestsPage> createState() => _CreateMyRequestsPageState();
}

class _CreateMyRequestsPageState extends State<CreateMyRequestsPage> {
  String pickedDate = "";
  String pickedTime = "";
  String amenitiesId = "";
  String selectTime = "Time";
  String selctesType = "normal";
  String selectdate = "YYYY/MM/DD";
  bool isTouched = false,
      timeError = false,
      dateError = false,
      isFormSubmitted = false;
  final _formKey = GlobalKey<FormState>();
  final GetAllRequestsController getAllRequestsController =
      Get.put(GetAllRequestsController());
  LookupService lookupService = LookupService();
  RequestsService requestsService = RequestsService();
  final tabController = Get.put(TabCountController());
  final TextEditingController amenityController = TextEditingController();
  final TextEditingController raisedFundsController = TextEditingController();
  final GetCurrentPropertyController getCurrentPropertyController =
      Get.put(GetCurrentPropertyController());
  String image = "",
      name = "",
      addres = "",
      propertyId = "",
      hostId = "",
      propertyName = "",
      proeprtyAddress = "",
      rentAmount = "",
      amenityName = "";
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      getpropertydata();
    });
  }

  getpropertydata() {
    var propertyData = getCurrentPropertyController.trtrrtrt[0].data!;
    setState(() {
      var data = propertyData;
      image = data.propertyImage.toString();
      name = data.name.toString();
      addres = data.address.toString();
      propertyId = data.id.toString();
      propertyName = data.name.toString();
      proeprtyAddress = data.address.toString();
      rentAmount = data.rentAmount.toString();
      hostId = data.hostUserId.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Request",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        backgroundColor: kBackGroundColor,
      ),
      body: getCurrentPropertyController.trtrrtrt.isNotEmpty
          ? Padding(
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
                      buildTextWidget("Property"),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                image,
                                fit: BoxFit.cover,
                                scale: 1.2,
                                height: 55,
                                width: 55,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/samplehouse.jpeg",
                                    fit: BoxFit.cover,
                                    scale: 1.2,
                                    height: 55,
                                    width: 55,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.home,
                                      size: 16,
                                      color: kButtonColor,
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: Get.width / 1.7,
                                      child: Text(
                                        addres,
                                        style: const TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 15,
                                            fontFamily: kCircularStdMedium),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      size: 16,
                                      color: kButtonColor,
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: Get.width - 220,
                                      child: Text(
                                        name,
                                        style: const TextStyle(
                                            color: kSecondaryPrimaryColor,
                                            fontSize: 13,
                                            fontFamily: kCircularStdBold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
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
                                      amenityController.text.isEmpty
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
                          suggestionsCallback: (pattern) async {
                            var amenities = await lookupService.getamenities();
                            return amenities
                                .where((country) =>
                                    country.title != null &&
                                    country.title!
                                        .toLowerCase()
                                        .contains(pattern.toLowerCase()))
                                .toList();
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
                              amenityController.text =
                                  suggestion.title.toString();
                              amenitiesId = suggestion.id.toString();
                            });
                          },
                          noItemsFoundBuilder: (context) => const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('No Amenity found'),
                          ),
                        ),
                      ),
                      buildTextWidget("Comment"),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        width: Get.width > 500 ? 600 : Get.width - 42,
                        child: CustomTextFormField(
                          hintText: 'Describe you request',
                          maxLines: 4,
                          ctrl: raisedFundsController,
                          name: "create",
                          formSubmitted: isFormSubmitted,
                          validationMsg: 'Please enter Comment',
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                selctesType = "normal";
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
                                        border:
                                            Border.all(color: kPrimaryColor),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Container(
                                      height: 5,
                                      width: 5,
                                      decoration: BoxDecoration(
                                          color: selctesType == "normal"
                                              ? kPrimaryColor
                                              : kWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  const Text(
                                    "Normal",
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
                                selctesType = "emergency";
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
                                          border:
                                              Border.all(color: kPrimaryColor),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: selctesType == "emergency"
                                                ? kPrimaryColor
                                                : kWhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    const Text(
                                      "Emergency",
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
                      buildTextWidget("Select Date"),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 45,
                                  width: Get.width - 35,
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      BottomPicker.date(
                                        pickerTitle: const Text(""),
                                        onSubmit: (index) {
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(index);

                                          if (mounted) {
                                            setState(() {
                                              selectdate = formattedDate;
                                              pickedDate = formattedDate;
                                              dateError = false;
                                            });
                                          }
                                        },
                                        dateOrder: DatePickerDateOrder.ymd,
                                        minDateTime:
                                            DateTime(2024, 1, 1, 17, 57, 25),
                                        maxDateTime: DateTime(2050, 1, 1),
                                        pickerTextStyle: const TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        onClose: () {
                                          Navigator.of(context).pop();
                                        },
                                        bottomPickerTheme:
                                            BottomPickerTheme.plumPlate,
                                        buttonAlignment:
                                            MainAxisAlignment.center,
                                        buttonContent: const Center(
                                            child: Text(
                                          "Save",
                                          style: TextStyle(color: kWhiteColor),
                                        )),
                                        buttonStyle: BoxDecoration(
                                            color: kButtonColor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        closeIconColor: kPrimaryColor,
                                        closeIconSize: 25,
                                      ).show(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectdate,
                                          style: const TextStyle(
                                            fontFamily: kCircularStdBook,
                                            fontWeight: FontWeight.w400,
                                            color: kPrimaryColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Image.asset(
                                          "assets/icons/polygon_down.png",
                                          scale: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (isFormSubmitted && dateError)
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 8.0, left: 20),
                                    child: Text(
                                      "Please select a date.",
                                      style: TextStyle(
                                        color: kErrorColor,
                                        fontFamily: kCircularStdNormal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
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
                                if (selectdate.isEmpty ||
                                    selectdate == "YYYY/MM/DD") {
                                  setState(() {
                                    dateError = true;
                                  });
                                }
                              });
                              FocusScope.of(context).requestFocus(FocusNode());

                              Future.delayed(const Duration(milliseconds: 100),
                                  () async {
                                if (_formKey.currentState!.validate()) {
                                  LoaderX.show(context, 60.0, 60.0);
                                  requestsService
                                      .addRequest(
                                          amenitiesId,
                                          raisedFundsController.text,
                                          selctesType,
                                          selectdate,
                                          propertyId,
                                          hostId,
                                          propertyName,
                                          proeprtyAddress,
                                          rentAmount,
                                          amenityController.text)
                                      .then((value) {
                                    if (value) {
                                      getAllRequestsController.getAllRequests();
                                      LoaderX.hide();
                                      amenityController.clear();
                                      raisedFundsController.clear();
                                      selectdate = "";
                                      tabController.changeTabIndex(0);
                                    }
                                  });
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
            )
          : Center(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Image.asset(
                    "assets/house101.png",
                    fit: BoxFit.cover,
                    scale: 2,
                  ),
                  const Text(
                    "You have no current leases so you can't make\nany Requests at this time.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                  CupertinoButton(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1, color: kButtonColor)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              "Explore more",
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 17),
                            )),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_right_alt,
                              size: 25,
                              color: kPrimaryColor,
                            )
                          ],
                        ),
                      ),
                      onPressed: () {
                        // Get.offAll(() => const TabPage(
                        //       selectedTabIndex: 1,
                        //     ));
                      }),
                ],
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
