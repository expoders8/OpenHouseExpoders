import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/amenities_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

typedef StringCallback = void Function(String val);

class AmenitiesView extends StatefulWidget {
  final List? initialAmenitiesIds;
  const AmenitiesView({
    super.key,
    this.initialAmenitiesIds,
  });

  @override
  State<AmenitiesView> createState() => _AmenitiesViewState();
}

class _AmenitiesViewState extends State<AmenitiesView> {
  var selectedValues = [];
  final GetAllAmenitiesController getAllAmenitiesController =
      Get.put(GetAllAmenitiesController());

  @override
  void initState() {
    super.initState();
    getAllAmenitiesController.fetchAllAmenites();

    // selectedValues =
    //     widget.initialAmenitiesIds.split(',').map((id) => id.trim()).toList();
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
          List<MultiSelectItem<dynamic>> items = data
              .map((category) => MultiSelectItem(
                  category.id.toString(), category.title.toString()))
              .toList();
          return MultiSelectDialogField(
            initialValue: getAllAmenitiesController.selectedAmenitis1.toList(),
            items: items,
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
              List<String> liststring =
                  values != null ? List<String>.from(values) : [];
              List<String> formattedIds =
                  liststring.map((id) => '"$id"').toList();
              String result = '[${formattedIds.join(", ")}]';
              getAllAmenitiesController.selectedAmenitis.value = result;
              getAllAmenitiesController.selectedAmenitis1(values);

              print(getAllAmenitiesController.selectedAmenitis);
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
