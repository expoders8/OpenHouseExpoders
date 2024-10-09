// import 'package:flutter/material.dart';

// import '../../../config/constant/color_constant.dart';
// import '../../../config/constant/font_constant.dart';

// typedef StringCallback = void Function(String val);

// class PaymentTypeSavedCard extends StatefulWidget {
//   final StringCallback callbackSelectedCardId;
//   const PaymentTypeSavedCard({Key? key, required this.callbackSelectedCardId})
//       : super(key: key);

//   @override
//   State<PaymentTypeSavedCard> createState() => _PaymentTypeSavedCardState();
// }

// enum Menu { delete }

// class _PaymentTypeSavedCardState extends State<PaymentTypeSavedCard> {
//   int selectedCardValue = 0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 220,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (BuildContext context, int index) {
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedCardValue = index;
//                 });
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 3),
//                 child: Card(
//                   elevation: 2.0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(8)),
//                       gradient: LinearGradient(
//                         colors: [
//                           kWhiteColor,
//                           kSecondaryColor,
//                         ],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                     ),
//                     height: 200,
//                     padding: const EdgeInsets.only(
//                         left: 16.0, right: 16.0, bottom: 22.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Stack(
//                           children: <Widget>[
//                             Container(
//                               margin: const EdgeInsets.only(top: 10),
//                               child: Row(
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.fromLTRB(0, 5, 7, 7),
//                                     child: CircleAvatar(
//                                       backgroundColor: kWhiteColor,
//                                       radius: 18,
//                                       child: Image.asset(
//                                         cardBrand == "masterCard"
//                                             ? "assets/icons/payment_card1.png"
//                                             : cardBrand == "visa"
//                                                 ? "assets/icons/payment_card2.png"
//                                                 : cardBrand == "discover"
//                                                     ? "assets/icons/payment_card4.png"
//                                                     : cardBrand == "amex"
//                                                         ? "assets/icons/payment_card3.png"
//                                                         : "assets/icons/payment_card1.png",
//                                         height: 33,
//                                         width: 33,
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "222 card",
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       color: kWhiteColor,
//                                       fontFamily: kCircularStdBook,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Positioned(
//                               top: 0,
//                               right: 15,
//                               child: Theme(
//                                 data: ThemeData(
//                                   splashColor: kTransparentColor,
//                                 ),
//                                 child: Radio(
//                                   value: index,
//                                   groupValue: selectedCardValue,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       selectedCardValue = value!;
//                                     });
//                                   },
//                                   activeColor:
//                                       const Color.fromARGB(225, 255, 255, 255),
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: 5,
//                               right: 0,
//                               child: Theme(
//                                 data: ThemeData(
//                                   splashColor: kTransparentColor,
//                                 ),
//                                 child: PopupMenuButton<Menu>(
//                                   position: PopupMenuPosition.under,
//                                   color: kBackGroundColor,
//                                   onSelected: (Menu item) {
//                                     setState(() {});
//                                   },
//                                   itemBuilder: (BuildContext context) =>
//                                       <PopupMenuEntry<Menu>>[
//                                     // PopupMenuItem<Menu>(
//                                     //   height: 30,
//                                     //   value: Menu.edit,
//                                     //   textStyle: const TextStyle(
//                                     //     color: kPrimaryColor,
//                                     //     fontSize: 15,
//                                     //   ),
//                                     //   onTap: () {},
//                                     //   child: const Text('Edit'),
//                                     // ),
//                                     PopupMenuItem<Menu>(
//                                       height: 30,
//                                       value: Menu.delete,
//                                       textStyle: const TextStyle(
//                                         color: kPrimaryColor,
//                                         fontSize: 15,
//                                       ),
//                                       onTap: () {
//                                         // deleteSavedCard(context,data[index].id);
//                                       },
//                                       child: const Text('Delete'),
//                                     ),
//                                   ],
//                                   child: Container(
//                                     height: 30,
//                                     alignment: Alignment.centerRight,
//                                     child: Image.asset(
//                                       "assets/icons/elipse_icon.png",
//                                       scale: 1.7,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'CARD NUMBER',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: kWhiteColor,
//                                 fontFamily: kRoboto,
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.only(top: 6),
//                               child: Text(
//                                 "**** **** **** 111",
//                                 style: const TextStyle(
//                                   fontSize: 19,
//                                   letterSpacing: 0.5,
//                                   color: kWhiteColor,
//                                   fontFamily: kCircularStdBold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: <Widget>[
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   "EXPIRES",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: kWhiteColor,
//                                     fontFamily: kCircularStdBook,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 3,
//                                 ),
//                                 Text(
//                                   "100",
//                                   style: const TextStyle(
//                                     fontSize: 15,
//                                     color: kWhiteColor,
//                                     fontFamily: kCircularStdMedium,
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }

//   deleteSavedCard(context, cardId) {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Alert !"),
//         elevation: 5,
//         titleTextStyle: const TextStyle(fontSize: 18, color: kRedColor),
//         content: const Text("Are you sure want to delete this card?"),
//         contentPadding: const EdgeInsets.only(left: 25, top: 10),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () async {},
//             child: const Text(
//               'Yes',
//               style: TextStyle(fontSize: 16, color: kPrimaryColor),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text(
//               'No',
//               style: TextStyle(fontSize: 16, color: kPrimaryColor),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
