// import 'package:bottom_picker/bottom_picker.dart';
// import 'package:bottom_picker/resources/arrays.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// import '../../../../config/constant/color_constant.dart';
// import '../../../../config/constant/font_constant.dart';
// import '../../../../config/provider/loader_provider.dart';
// import '../../../services/lease_service.dart';
// import '../../widgets/custom_textfield.dart';

// class LeaseExtendPropertyPage extends StatefulWidget {
//   final String? id;
//   const LeaseExtendPropertyPage({super.key, this.id});

//   @override
//   State<LeaseExtendPropertyPage> createState() =>
//       _LeaseExtendPropertyPageState();
// }

// class _LeaseExtendPropertyPageState extends State<LeaseExtendPropertyPage> {
//   String pickedDate = "";
//   String selectTime = "Time";
//   String selectdate = "YYYY/MM/DD";
//   LeaseService leaseService = LeaseService();
//   String pickedEndDate = "";
//   String selectedEndDate = "";
//   bool isTouched = false, dateError = false, isFormSubmitted = false;
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController amountController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Property extend",
//           style: TextStyle(fontFamily: kCircularStdBook),
//         ),
//         backgroundColor: kBackGroundColor,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 IntrinsicHeight(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 45,
//                             width: Get.width - 35,
//                             padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//                             decoration: BoxDecoration(
//                               color: kWhiteColor,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: InkWell(
//                               onTap: () {
//                                 FocusScope.of(context)
//                                     .requestFocus(FocusNode());
//                                 BottomPicker.date(
//                                   pickerTitle: const Text(""),
//                                   onSubmit: (index) {
//                                     String formattedDate =
//                                         DateFormat('dd-MM-yyyy').format(index);
//                                     String formattedEndDate = DateFormat(
//                                             "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
//                                         .format(index);
//                                     if (mounted) {
//                                       setState(() {
//                                         selectedEndDate = formattedDate;
//                                         pickedEndDate = formattedEndDate;
//                                       });
//                                     }
//                                   },
//                                   dateOrder: DatePickerDateOrder.ymd,
//                                   minDateTime: DateTime(2024, 1, 1, 17, 57, 25),
//                                   maxDateTime: DateTime(2050, 1, 1),
//                                   pickerTextStyle: const TextStyle(
//                                     color: kPrimaryColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14,
//                                   ),
//                                   onClose: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   bottomPickerTheme:
//                                       BottomPickerTheme.plumPlate,
//                                   buttonAlignment: MainAxisAlignment.center,
//                                   buttonContent: const Center(
//                                       child: Text(
//                                     "Save",
//                                     style: TextStyle(color: kWhiteColor),
//                                   )),
//                                   buttonStyle: BoxDecoration(
//                                       color: kButtonColor,
//                                       borderRadius: BorderRadius.circular(15)),
//                                   closeIconColor: kPrimaryColor,
//                                   closeIconSize: 25,
//                                 ).show(context);
//                               },
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     selectdate,
//                                     style: const TextStyle(
//                                       fontFamily: kCircularStdBook,
//                                       fontWeight: FontWeight.w400,
//                                       color: kPrimaryColor,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                   Image.asset(
//                                     "assets/icons/polygon_down.png",
//                                     scale: 2,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           if (isFormSubmitted && dateError)
//                             const Padding(
//                               padding: EdgeInsets.only(top: 8.0, left: 20),
//                               child: Text(
//                                 "Please select a date.",
//                                 style: TextStyle(
//                                   color: kErrorColor,
//                                   fontFamily: kCircularStdNormal,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 CustomTextFormField(
//                   hintText: '\$ Amount',
//                   maxLines: 1,
//                   ctrl: amountController,
//                   keyboardType: TextInputType.number,
//                   name: "iamount",
//                   validationMsg: 'Please enter amount',
//                 ),
//                 const SizedBox(height: 15),
//                 CupertinoButton(
//                   padding: EdgeInsets.zero,
//                   onPressed: () {
//                     setState(() {
//                       isFormSubmitted = true;
//                     });
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     Future.delayed(const Duration(milliseconds: 100), () async {
//                       if (_formKey.currentState!.validate() &&
//                           pickedDate != "") {
//                         LoaderX.show(context, 60.0, 60.0);
//                         leaseService.extendProperty(
//                             pickedEndDate, amountController.text, widget.id!);
//                       } else {
//                         if (pickedDate == "") {
//                           setState(() {
//                             dateError = true;
//                           });
//                         } else {
//                           setState(() {
//                             dateError = false;
//                           });
//                         }
//                       }
//                     });
//                   },
//                   child: Container(
//                     height: 45,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                         border: Border.all(color: kWhiteColor),
//                         color: kButtonColor),
//                     child: const Center(
//                       child: Text(
//                         "Next",
//                         style: TextStyle(
//                             color: kWhiteColor,
//                             fontFamily: kCircularStdNormal,
//                             fontSize: 18),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
