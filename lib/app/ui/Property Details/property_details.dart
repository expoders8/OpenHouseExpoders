import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class PropertyDetailPage extends StatefulWidget {
  const PropertyDetailPage({super.key});

  @override
  State<PropertyDetailPage> createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: Get.height / 2.7,
              width: double.infinity,
              child: AnotherCarousel(
                images: const [
                  AssetImage("assets/icons/3.png"),
                  AssetImage("assets/icons/6.png"),
                  AssetImage("assets/icons/7.png"),
                ],
                dotSize: 6,
                autoplay: false,
                borderRadius: true,
                radius: const Radius.circular(0),
                dotPosition: DotPosition.bottomCenter,
                indicatorBgPadding: 27.0,
                dotBgColor: Colors.transparent,
              ),
            ),
            // Positioned(
            //   left: 20,
            //   top: 45,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8),
            //       color: kWhiteColor,
            //       boxShadow: const [
            //         BoxShadow(
            //           color: Color.fromARGB(80, 0, 0, 0),
            //           blurRadius: 10,
            //           offset: Offset(0, 2),
            //           spreadRadius: -6,
            //         ),
            //       ],
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: InkWell(
            //         onTap: () {},
            //         child: const ImageIcon(
            //           AssetImage("assets/icons/back.png"),
            //           size: 25,
            //           color: kPrimaryColor,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
                top: 40,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 9.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                )),
            Positioned(
              child: Container(
                height: Get.height / 1.54,
                margin: const EdgeInsets.only(top: 250),
                decoration: BoxDecoration(
                  color: kBackGroundColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: Get.width - 100,
                              child: const Text(
                                "3545 Robson St, Vancouver",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 18,
                                    fontFamily: kCircularStdMedium),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  "\$2513",
                                  style: TextStyle(
                                      color: kButtonColor,
                                      fontSize: 18,
                                      fontFamily: kCircularStdMedium),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "per month",
                                  style: TextStyle(
                                      color: kSecondaryPrimaryColor,
                                      fontSize: 13,
                                      fontFamily: kCircularStdMedium),
                                ),
                              ],
                            ),
                            Row(
                              children: List.generate(4, (index) {
                                return const Icon(Icons.star,
                                    color: Color.fromARGB(255, 255, 230, 0));
                              })
                                ..add(const Icon(Icons.star_half,
                                    color: Color.fromARGB(255, 255, 230, 0))),
                            ),
                            const SizedBox(height: 5),
                            const Divider(),
                            const SizedBox(height: 5),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Send Request",
                                  style: TextStyle(
                                      color: kBlueColor, fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    "assets/icons/boy 1.png",
                                    fit: BoxFit.cover,
                                    height: 65,
                                    width: 65,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Host Name",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 18,
                                          fontFamily: kCircularStdMedium),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          size: 15,
                                          color: kButtonColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "+91 9898567548",
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 13,
                                              fontFamily: kCircularStdNormal),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.email,
                                          size: 15,
                                          color: kButtonColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "test@google.com",
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 13,
                                              fontFamily: kCircularStdNormal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Property details",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 17,
                                  fontFamily: kCircularStdMedium),
                            ),
                            const Divider(),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Bedrooms",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 15,
                                          fontFamily: kCircularStdNormal),
                                    ),
                                    Text(
                                      "1 Single",
                                      style: TextStyle(
                                          color: kSecondaryPrimaryColor,
                                          fontSize: 12,
                                          fontFamily: kCircularStdBook),
                                    ),
                                    Text(
                                      "1 Double",
                                      style: TextStyle(
                                          color: kSecondaryPrimaryColor,
                                          fontSize: 12,
                                          fontFamily: kCircularStdBook),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Capacity",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 15,
                                          fontFamily: kCircularStdNormal),
                                    ),
                                    Text(
                                      "3 Person",
                                      style: TextStyle(
                                          color: kSecondaryPrimaryColor,
                                          fontSize: 12,
                                          fontFamily: kCircularStdBook),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  "assets/icons/line_vertical.png",
                                  fit: BoxFit.cover,
                                  scale: 0.7,
                                  color: kSecondaryColor,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Bathrooms",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 15,
                                          fontFamily: kCircularStdNormal),
                                    ),
                                    Text(
                                      "1 full bathroom",
                                      style: TextStyle(
                                          color: kSecondaryPrimaryColor,
                                          fontSize: 12,
                                          fontFamily: kCircularStdBook),
                                    ),
                                    Text(
                                      "1 toilet",
                                      style: TextStyle(
                                          color: kSecondaryPrimaryColor,
                                          fontSize: 12,
                                          fontFamily: kCircularStdBook),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Bills",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 15,
                                          fontFamily: kCircularStdNormal),
                                    ),
                                    Text(
                                      "included",
                                      style: TextStyle(
                                          color: kSecondaryPrimaryColor,
                                          fontSize: 12,
                                          fontFamily: kCircularStdBook),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Room & Property amenities",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 17,
                                  fontFamily: kCircularStdMedium),
                            ),
                            const Divider(),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    amenities("Parking"),
                                    amenities("Wifi"),
                                    amenities("Garden"),
                                    amenities("Washing machine"),
                                    amenities("TV"),
                                    amenities("Furnished"),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            tenantname(),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }

  tenantname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tenant details",
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: 17,
              fontFamily: kCircularStdMedium),
        ),
        const Divider(),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/icons/boy 2.png",
                fit: BoxFit.cover,
                height: 65,
                width: 65,
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tenant Name",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontFamily: kCircularStdMedium),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 15,
                      color: kButtonColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "+91 9898567548",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13,
                          fontFamily: kCircularStdNormal),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 15,
                      color: kButtonColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "test@google.com",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13,
                          fontFamily: kCircularStdNormal),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Monthly rent",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdNormal),
                ),
                Text(
                  "\$2540 / month",
                  style: TextStyle(
                      color: kSecondaryPrimaryColor,
                      fontSize: 12,
                      fontFamily: kCircularStdBook),
                ),
              ],
            ),
            Image.asset(
              "assets/icons/line_vertical.png",
              fit: BoxFit.cover,
              scale: 1.9,
              color: kSecondaryColor,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Deposit",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdNormal),
                ),
                Text(
                  "\$1800",
                  style: TextStyle(
                      color: kSecondaryPrimaryColor,
                      fontSize: 12,
                      fontFamily: kCircularStdBook),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  amenities(String text) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/correct.png",
          fit: BoxFit.cover,
          height: 15,
          width: 15,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 14,
              fontFamily: kCircularStdNormal),
        ),
      ],
    );
  }
}
