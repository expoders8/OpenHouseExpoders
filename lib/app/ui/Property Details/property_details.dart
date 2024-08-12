import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openhome/config/constant/color_constant.dart';

import '../../../config/constant/font_constant.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: AnotherCarousel(
                  images: const [
                    AssetImage("assets/icons/1.png"),
                    AssetImage("assets/icons/2.png"),
                    AssetImage("assets/icons/3.png"),
                  ],
                  dotSize: 6,
                  autoplay: false,
                  borderRadius: true,
                  radius: const Radius.circular(0),
                  dotPosition: DotPosition.bottomCenter,
                  indicatorBgPadding: 25.0,
                  dotBgColor: Colors.transparent,
                ),
              ),
              Positioned(
                top: 230,
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(25)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width - 100,
                            child: const Text(
                              "3545 Robson St, Vancouver",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 22,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ),
                          const Row(
                            children: [
                              Text(
                                "\$2513",
                                style: TextStyle(
                                    color: kButtonColor,
                                    fontSize: 20,
                                    fontFamily: kCircularStdMedium),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "per month",
                                style: TextStyle(
                                    color: kSecondaryPrimaryColor,
                                    fontSize: 15,
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
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Send Request",
                                style:
                                    TextStyle(color: kBlueColor, fontSize: 12),
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
                                  scale: 1.2,
                                  height: 65,
                                  width: 65,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
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
                                      SizedBox(
                                        width: 10,
                                      ),
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
                                      SizedBox(
                                        width: 10,
                                      ),
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
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Property details",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 22,
                                fontFamily: kCircularStdMedium),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bedrooms",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                        fontFamily: kCircularStdNormal),
                                  ),
                                  Text(
                                    "1 Single",
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 14,
                                        fontFamily: kCircularStdBook),
                                  ),
                                  Text(
                                    "1 Double",
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 14,
                                        fontFamily: kCircularStdBook),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Capacity",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                        fontFamily: kCircularStdNormal),
                                  ),
                                  Text(
                                    "3 Person",
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 14,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bathrooms",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                        fontFamily: kCircularStdNormal),
                                  ),
                                  Text(
                                    "1 full bathroom",
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 14,
                                        fontFamily: kCircularStdBook),
                                  ),
                                  Text(
                                    "1 toilet",
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 14,
                                        fontFamily: kCircularStdBook),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Bills",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                        fontFamily: kCircularStdNormal),
                                  ),
                                  Text(
                                    "included",
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 14,
                                        fontFamily: kCircularStdBook),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Property details",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 22,
                                fontFamily: kCircularStdMedium),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bedrooms",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                        fontFamily: kCircularStdNormal),
                                  ),
                                  Text(
                                    "1 Single",
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 14,
                                        fontFamily: kCircularStdBook),
                                  ),
                                  Text(
                                    "1 Double",
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 14,
                                        fontFamily: kCircularStdBook),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Capacity",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                        fontFamily: kCircularStdNormal),
                                  ),
                                  Text(
                                    "3 Person",
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 14,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bathrooms",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                        fontFamily: kCircularStdNormal),
                                  ),
                                  Text(
                                    "1 full bathroom",
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 14,
                                        fontFamily: kCircularStdBook),
                                  ),
                                  Text(
                                    "1 toilet",
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 14,
                                        fontFamily: kCircularStdBook),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Bills",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                        fontFamily: kCircularStdNormal),
                                  ),
                                  Text(
                                    "included",
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 14,
                                        fontFamily: kCircularStdBook),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//           child: Column(
//             children: [
//               // ClipRRect(
//               //   borderRadius: BorderRadius.circular(25),
//               //   child: Image.asset(
//               //     "assets/icons/1.png",
//               //     fit: BoxFit.cover,
//               //     scale: 0.5,
//               //   ),
//               // ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

Widget _buildFacilityIcon(IconData icon, String label) {
  return Container(
    width: 75,
    height: 75,
    decoration: BoxDecoration(
        color: kBorderColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: kPrimaryColor)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 18),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: kPrimaryColor, fontSize: 15),
        ),
      ],
    ),
  );
}
