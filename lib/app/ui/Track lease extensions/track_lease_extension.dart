import 'package:accordion/accordion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class TrackLeaseExtensionPage extends StatefulWidget {
  const TrackLeaseExtensionPage({super.key});

  @override
  State<TrackLeaseExtensionPage> createState() =>
      _TrackLeaseExtensionPageState();
}

class _TrackLeaseExtensionPageState extends State<TrackLeaseExtensionPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Property Extension"),
//       ),
//     );
//   }
// }

  // Future<void> _refreshItems() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   setState(() {
  //     getAllPropertyExpensesController.getAllExpenses();
  //   });
  // }

  bool isView = false;

  @override
  void initState() {
    // getAllPropertyExpensesController.getAllExpenses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Property Service Extensions"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Column(
            children: [
              cardDesign(),
              const SizedBox(height: 5),
              cardDesign(),
              const SizedBox(height: 5),
              cardDesign(),
            ],
          ),
        ),
      ),
    );
  }

  cardDesign() {
    return Card(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            width: Get.width,
            decoration: BoxDecoration(
                color: kButtonColor, borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Property Name',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontFamily: kCircularStdMedium,
                          fontSize: 15)),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: kWhiteColor,
                      ),
                      SizedBox(width: 5),
                      Text('Property address',
                          style: TextStyle(
                              color: kWhiteColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 11)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 130,
                height: 50,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    border: Border.all(color: kButtonColor, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Previous end date",
                      style: TextStyle(
                          fontFamily: kCircularStdNormal,
                          fontSize: 12,
                          color: kPrimaryColor),
                    ),
                    Text(
                      "10 May 2024",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: kCircularStdMedium,
                          fontSize: 14),
                    ),
                  ],
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 130,
                    width: 2,
                    decoration: BoxDecoration(
                        border: Border.all(color: kButtonColor, width: 0.8)),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/blank_profile.png",
                              fit: BoxFit.cover,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "Tenant Name",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdMedium,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: Get.width - 85,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rent Paid",
                              style: TextStyle(
                                  color: kGreenColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                            Text(
                              "\$ 2500",
                              style: TextStyle(
                                  color: kGreenColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width - 85,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Extended rent",
                              style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                            Text(
                              "\$ 1500",
                              style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width - 85,
                        child: const Divider(
                          color: kRedColor,
                          thickness: 0.5,
                          height: 5,
                        ),
                      ),
                      SizedBox(
                        width: Get.width - 85,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                            Text(
                              "\$ 1500",
                              style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        border: Border.all(color: kButtonColor, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Extended Date",
                          style: TextStyle(
                              fontFamily: kCircularStdNormal,
                              fontSize: 12,
                              color: kPrimaryColor),
                        ),
                        Text(
                          "10 May 2024",
                          style: TextStyle(
                              fontFamily: kCircularStdMedium,
                              fontSize: 16,
                              color: kPrimaryColor),
                        ),
                      ],
                    )),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (isView == true) {
                          isView = false;
                        } else {
                          isView = true;
                        }
                      });
                    },
                    child: const Text(
                      "View all",
                      style: TextStyle(
                          fontFamily: kCircularStdMedium,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          decorationColor: kBlueColor,
                          color: kBlueColor),
                    ),
                  ),
                ],
              ),
              // isView == true
              //     ? Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Container(
              //             margin: const EdgeInsets.only(left: 10),
              //             height: 130,
              //             width: 2,
              //             decoration: BoxDecoration(
              //                 border:
              //                     Border.all(color: kButtonColor, width: 0.8)),
              //           ),
              //           const SizedBox(width: 10),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               const SizedBox(height: 10),
              //               Row(
              //                 children: [
              //                   ClipRRect(
              //                     borderRadius: BorderRadius.circular(10),
              //                     child: Image.asset(
              //                       "assets/images/blank_profile.png",
              //                       fit: BoxFit.cover,
              //                       height: 30,
              //                       width: 30,
              //                     ),
              //                   ),
              //                   const SizedBox(width: 5),
              //                   const Text(
              //                     "Tenant Name",
              //                     style: TextStyle(
              //                         color: kPrimaryColor,
              //                         fontFamily: kCircularStdMedium,
              //                         fontSize: 15),
              //                   ),
              //                 ],
              //               ),
              //               const SizedBox(height: 10),
              //               SizedBox(
              //                 width: Get.width - 85,
              //                 child: const Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Rent Paid",
              //                       style: TextStyle(
              //                           color: kGreenColor,
              //                           fontSize: 15,
              //                           fontFamily: kCircularStdMedium),
              //                     ),
              //                     Text(
              //                       "\$ 2500",
              //                       style: TextStyle(
              //                           color: kGreenColor,
              //                           fontSize: 15,
              //                           fontFamily: kCircularStdMedium),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: Get.width - 85,
              //                 child: const Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Extended rent",
              //                       style: TextStyle(
              //                           color: kRedColor,
              //                           fontSize: 15,
              //                           fontFamily: kCircularStdMedium),
              //                     ),
              //                     Text(
              //                       "\$ 1500",
              //                       style: TextStyle(
              //                           color: kRedColor,
              //                           fontSize: 15,
              //                           fontFamily: kCircularStdMedium),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: Get.width - 85,
              //                 child: const Divider(
              //                   color: kRedColor,
              //                   thickness: 0.5,
              //                   height: 5,
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: Get.width - 85,
              //                 child: const Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Total Amount",
              //                       style: TextStyle(
              //                           color: kRedColor,
              //                           fontSize: 15,
              //                           fontFamily: kCircularStdMedium),
              //                     ),
              //                     Text(
              //                       "\$ 1500",
              //                       style: TextStyle(
              //                           color: kRedColor,
              //                           fontSize: 15,
              //                           fontFamily: kCircularStdMedium),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           )
              //         ],
              //       )
              //     : Container(),
              // isView == true
              //     ? Container(
              //         width: 130,
              //         height: 50,
              //         decoration: BoxDecoration(
              //             color: kWhiteColor,
              //             border: Border.all(color: kButtonColor, width: 1),
              //             borderRadius: BorderRadius.circular(12)),
              //         child: const Center(
              //             child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               "Extended Date",
              //               style: TextStyle(
              //                   fontFamily: kCircularStdNormal,
              //                   fontSize: 12,
              //                   color: kPrimaryColor),
              //             ),
              //             Text(
              //               "10 May 2024",
              //               style: TextStyle(
              //                   fontFamily: kCircularStdMedium,
              //                   fontSize: 16,
              //                   color: kPrimaryColor),
              //             ),
              //           ],
              //         )),
              //       )
              //     : Container()
            ]),
          ),
        ],
      ),
    );
  }
}
