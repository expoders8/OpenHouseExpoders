import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/amenities_model.dart';
import '../controller/amenities_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

typedef StringCallback = void Function(String val);

class AmenitiesView extends StatefulWidget {
  final String? initialvalue;
  const AmenitiesView({
    super.key,
    this.initialvalue = "",
  });

  @override
  State<AmenitiesView> createState() => _AmenitiesViewState();
}

class _AmenitiesViewState extends State<AmenitiesView> {
  final GetAllAmenitiesController getAllAmenitiesController =
      Get.put(GetAllAmenitiesController());
  List<AmenitiesModel> amenitiesModel = [];
  var selectedValues = [];
  List<dynamic> separatedList = [];

  @override
  void initState() {
    getAllAmenitiesController.fetchAllAmenites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (getAllAmenitiesController.isLoading.value) {
        return Container(
          height: 45,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            color: kWhiteColor,
            border: Border.all(
              color: kPrimaryColor,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 14, left: 10),
            child: Text(
              "Select Hashtags",
              style: TextStyle(fontSize: 14, color: kWhiteColor),
            ),
          ),
        );
      } else {
        if (getAllAmenitiesController.amenitisList.isNotEmpty) {
          var data = getAllAmenitiesController.amenitisList[0];
          return MultiSelectDialogField(
            initialValue: separatedList,
            items: data
                .map(
                  (category) => MultiSelectItem(
                      category.id.toString(), category.title.toString()),
                )
                .toList(),
            searchable: true,
            selectedColor: kButtonColor,
            checkColor: kWhiteColor,
            selectedItemsTextStyle: const TextStyle(
                color: kWhiteColor, fontFamily: kCircularStdBook),
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
              getAllAmenitiesController.selectedAmenitis(values);
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
            validator: (values) {
              if (values == null || values.isEmpty) {
                return "Please select at least one Amenity";
              }
              return null;
            },
          );
        } else {
          return const Center(
            child: Text(
              "No Tag found",
              style: TextStyle(color: kWhiteColor),
            ),
          );
        }
      }
    });
  }
}
