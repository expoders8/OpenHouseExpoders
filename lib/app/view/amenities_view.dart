import 'package:flutter/material.dart';
import '../models/amenities_model.dart';
import '../services/lookup_service.dart';
import '../models/get_amenities_model.dart';
import '../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

typedef StringCallback = void Function(String val);

class AmenitiesView extends StatefulWidget {
  final StringCallback nameCallback;
  final StringCallback idCallback;
  final String? initialvalue;
  const AmenitiesView({
    super.key,
    required this.nameCallback,
    required this.idCallback,
    this.initialvalue = "",
  });

  @override
  State<AmenitiesView> createState() => _AmenitiesViewState();
}

class _AmenitiesViewState extends State<AmenitiesView> {
  List<AmenitiesModel> amenitiesModel = [];
  var selectedValues = [];
  List<dynamic> separatedList = [];

  @override
  void initState() {
    super.initState();
    selectedValues = widget.initialvalue != null ? [widget.initialvalue!] : [];
    if (selectedValues.isNotEmpty) {
      separatedList = selectedValues[0].split(",");
    } else {
      separatedList = [];
    }

    _fetchAmenities();
  }

  Future<void> _fetchAmenities() async {
    try {
      List<GetAllAmenitiesDataModel>? apiAmenities =
          (await LookupService.getamenities());

      setState(() {
        amenitiesModel = apiAmenities
            .map((item) => AmenitiesModel(
                  name: item.title!,
                  id: item.id.toString(),
                ))
            .toList();
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching amenities: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField(
      initialValue: separatedList,
      items: amenitiesModel
          .map(
            (category) => MultiSelectItem(
                category.id.toString(), category.name.toString()),
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
        List<String> selectedIds = [];
        List<String> selectedNames = [];
        for (var value in values) {
          try {
            var item =
                amenitiesModel.firstWhere((element) => element.id == value);
            selectedIds.add(item.id);
            selectedNames.add(item.name);
          } catch (e) {
            // ignore: avoid_print
            print("No matching element found for value: $value");
          }
        }
        widget.idCallback(selectedIds.join(','));
        widget.nameCallback(selectedNames.join(','));
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
