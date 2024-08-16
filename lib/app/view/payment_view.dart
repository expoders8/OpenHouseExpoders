// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:openhome/config/constant/color_constant.dart';

// class PaymentView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             payment(
//               "assets/icons/boy 1.png",
//               "\$1850",
//               "224 Robson St, Vancouver",
//               "Paid",
//               "Tenant Name",
//               "+91 1234567890",
//               "\$0",
//               "12-06-2025",
//             ),
//             const SizedBox(height: 12),
//             payment(
//               "assets/icons/boy 2.png",
//               "\$1850",
//               "101 Main Street",
//               "Pending",
//               "Tenant Name",
//               "+91 9898758462",
//               "\$250",
//               "25-06-2025",
//             ),
//             const SizedBox(height: 12),
//             payment(
//               "assets/icons/boy 3.png",
//               "\$1850",
//               "206 / B , Main Street",
//               "Paid",
//               "Tenant Name",
//               "+91 7859642316",
//               "\$250",
//               "25-06-2025",
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget payment(
//       String userimage,
//       String totalamount,
//       String address,
//       String status,
//       String tenantname,
//       String contact,
//       String pendingpayment,
//       String duedate) {
//     return Container(
//       width: Get.width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         color: kWhiteColor,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.pending_actions_rounded,
//                           size: 18,
//                           color: status != "Paid" ? kRedColor : kGreenColor,
//                         ),
//                         const SizedBox(width: 10),
//                         SizedBox(
//                           width: Get.width - 220,
//                           child: Text(
//                             status,
//                             style: TextStyle(
//                               color: status != "Paid" ? kRedColor : kGreenColor,
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 5),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.location_on,
//                           size: 16,
//                           color: kButtonColor,
//                         ),
//                         const SizedBox(width: 10),
//                         SizedBox(
//                           width: Get.width / 2,
//                           child: Text(
//                             address,
//                             style: const TextStyle(
//                               color: kSecondaryPrimaryColor,
//                               fontSize: 13,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 5),
//                     Row(
//                       children: [
//                         const Icon(Icons.person, size: 16, color: Colors.blue),
//                         const SizedBox(width: 10),
//                         SizedBox(
//                           width: Get.width - 220,
//                           child: Text(
//                             tenantname,
//                             style: const TextStyle(
//                               color: kPrimaryColor,
//                               fontSize: 13,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 5),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.phone,
//                           size: 16,
//                           color: kButtonColor,
//                         ),
//                         const SizedBox(width: 10),
//                         SizedBox(
//                           width: Get.width - 220,
//                           child: Text(
//                             contact,
//                             style: const TextStyle(
//                               color: kPrimaryColor,
//                               fontSize: 13,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(50),
//                   child: Image.asset(
//                     userimage,
//                     fit: BoxFit.cover,
//                     height: 65,
//                     width: 65,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             status == "Paid"
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       details("Payment", totalamount),
//                       Image.asset("assets/icons/line_vertical.png",
//                           fit: BoxFit.cover, scale: 1.8),
//                       details("Payment Date", duedate),
//                     ],
//                   )
//                 : Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       details("Payment", totalamount),
//                       Image.asset("assets/icons/line_vertical.png",
//                           fit: BoxFit.cover, scale: 1.8),
//                       details("Pending Payment", pendingpayment),
//                       Image.asset("assets/icons/line_vertical.png",
//                           fit: BoxFit.cover, scale: 1.8),
//                       details("Due Date", duedate),
//                     ],
//                   ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget details(String title, String detail) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 12,
//             color: kPrimaryColor,
//           ),
//         ),
//         Text(
//           detail,
//           style: const TextStyle(
//             color: kPrimaryColor,
//             fontSize: 17,
//           ),
//         ),
//       ],
//     );
//   }
// }
