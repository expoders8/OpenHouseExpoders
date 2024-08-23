import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../config/constant/color_constant.dart';
import '../../config/constant/font_constant.dart';
import '../models/amenities_model.dart';

typedef StringCallback = void Function(String val);

class AmenitiesView extends StatefulWidget {
  final StringCallback callbacklist;
  final String? initialvalue;
  const AmenitiesView({
    super.key,
    required this.callbacklist,
    this.initialvalue = "",
  });

  @override
  State<AmenitiesView> createState() => _AmenitiesViewState();
}

class _AmenitiesViewState extends State<AmenitiesView> {
  List<AmenitiesModel> amenitiesModel = [
    AmenitiesModel(
      name: "Electricity",
      id: "0",
    ),
    AmenitiesModel(
      name: "Gas",
      id: "1",
    ),
    AmenitiesModel(
      name: "Water",
      id: "2",
    ),
    AmenitiesModel(
      name: "Wifi",
      id: "3",
    ),
    AmenitiesModel(
      name: "Parking",
      id: "4",
    ),
    AmenitiesModel(
      name: "Washing Machine",
      id: "5",
    ),
    AmenitiesModel(
      name: "CCTV Camera",
      id: "6",
    ),
    AmenitiesModel(
      name: "Housekeeping",
      id: "7",
    ),
    AmenitiesModel(
      name: "Smart TV",
      id: "8",
    ),
  ];
  var selectedValues = [];
  List<dynamic> separatedList = [];
  @override
  void initState() {
    selectedValues = widget.initialvalue != null ? [widget.initialvalue!] : [];
    if (selectedValues.isNotEmpty) {
      separatedList = selectedValues[0].split(",");
    } else {
      separatedList = [];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField(
      initialValue: separatedList,
      items: amenitiesModel
          .map(
            (category) => MultiSelectItem(
                category.name.toString(), category.name.toString()),
          )
          .toList(),
      searchable: true,
      selectedColor: kButtonColor,
      checkColor: kWhiteColor,
      selectedItemsTextStyle:
          const TextStyle(color: kWhiteColor, fontFamily: kCircularStdBook),
      chipDisplay: MultiSelectChipDisplay(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          chipColor: kButtonColor,
          height: 60,
          textStyle: const TextStyle(color: kWhiteColor),
          icon: null),
      cancelText: const Text(
        "CANCEL",
        style: TextStyle(
          fontFamily: kCircularStdBook,
          fontWeight: FontWeight.w400,
          color: kPrimaryColor,
          fontSize: 14,
        ),
      ),
      confirmText: const Text(
        "OK",
        style: TextStyle(
          fontFamily: kCircularStdBook,
          fontWeight: FontWeight.w400,
          color: kPrimaryColor,
          fontSize: 14,
        ),
      ),
      separateSelectedItems: true,
      onConfirm: (values) {
        selectedValues = values;
        String numbersAsString = values.map((e) => e.toString()).join(',');
        widget.callbacklist(numbersAsString);
      },
      title: const Text(
        "House Amenities",
        style: TextStyle(
          fontFamily: kCircularStdBook,
          fontWeight: FontWeight.w400,
          color: kPrimaryColor,
          fontSize: 18,
        ),
      ),
      listType: MultiSelectListType.CHIP,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(9)),
        border: Border.all(
          color: kWhiteColor,
        ),
      ),
      buttonIcon: const Icon(
        Icons.arrow_drop_down_rounded,
        color: kPrimaryColor,
        size: 35,
      ),
      buttonText: const Text(
        "House Amenities",
        style: TextStyle(
          fontFamily: kCircularStdBook,
          fontWeight: FontWeight.w400,
          color: kPrimaryColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
