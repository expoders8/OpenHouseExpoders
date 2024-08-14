import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant/color_constant.dart';
import '../constant/font_constant.dart';

class CustomDatePicker extends StatefulWidget {
  final Function? selectedAgeYear;
  final Function? selectedAgeMonth;
  final Function? selectedDate;
  final DateTime? initialvalue;
  final String? checktext;
  final Function? selectedFormateDate;
  final bool birthDateError;
  final String? hintText;

  const CustomDatePicker({
    Key? key,
    this.selectedAgeYear,
    this.selectedAgeMonth,
    this.selectedDate,
    this.selectedFormateDate,
    required this.birthDateError,
    this.initialvalue,
    this.checktext,
    this.hintText,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  int ageYear = 0;
  int ageMonth = 0;
  String selectedDate = "dd/mm/yyyy";
  String selectedFormateDate = "yyyy-mm-dd";
  DateTime currentDate = DateTime.now();
  @override
  void initState() {
    if (widget.checktext == "edit") {
      selectedDate = DateFormat('dd/MM/yyyy').format(widget.initialvalue!);
    }
    super.initState();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        // initialDatePickerMode: DatePickerMode.year,
        firstDate: DateTime(1901),
        lastDate: DateTime.now());
    if (picked != null && picked != currentDate) {
      setState(() {
        currentDate = picked;
        selectedDate = DateFormat('dd/MM/yyyy').format(picked);

        selectedFormateDate = DateFormat('yyyy-MM-dd').format(picked);
        ageYear = calculateAgeYear(DateTime.now(), picked);
        ageMonth = calculateAgeMonth(DateTime.now(), picked);
      });
      widget.selectedAgeYear!(ageYear);
      widget.selectedAgeMonth!(ageMonth);
      widget.selectedFormateDate!(selectedFormateDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _selectDate(),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all<Color>(kBackGroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: kSecondaryPrimaryColor),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedDate == "dd/mm/yyyy" ? widget.hintText! : selectedDate,
            style: TextStyle(
              color: selectedDate == "dd/mm/yyyy"
                  ? kSecondaryPrimaryColor
                  : kPrimaryColor,
              fontSize: 15,
              fontFamily: kCircularStdNormal,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.calendar_month,
            size: 18.0,
            color: kSecondaryPrimaryColor,
          ),
        ],
      ),
    );
  }

  calculateAgeYear(currentDate, birthDate) {
    final year = currentDate.year - birthDate.year;
    return year;
  }

  calculateAgeMonth(currentDate, birthDate) {
    final month = currentDate.month - birthDate.month;
    return month;
  }

  // calculateAgeDays(currentDate, birthDate) {
  //   final days = currentDate.day - birthDate.day;
  //   print("day $days");
  //   return days;
  // }
}
