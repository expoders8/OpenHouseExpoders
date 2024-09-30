import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class MyHostsDetailsPage extends StatefulWidget {
  const MyHostsDetailsPage({super.key});

  @override
  State<MyHostsDetailsPage> createState() => _MyHostsDetailsPageState();
}

class _MyHostsDetailsPageState extends State<MyHostsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Host",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        backgroundColor: kBackGroundColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: kWhiteColor, width: 2),
                      borderRadius: BorderRadius.circular(1000)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "https//tenant",
                      fit: BoxFit.cover,
                      height: 110,
                      width: 110,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/blank_profile.png",
                          fit: BoxFit.cover,
                          height: 110,
                          width: 110,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Host Name",
                  style: TextStyle(
                      fontFamily: kCircularStdBold,
                      fontSize: 20,
                      color: kPrimaryColor),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kButtonColor),
                      child: const Icon(
                        Icons.phone,
                        color: kWhiteColor,
                        size: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "+91 9898102325",
                      style: TextStyle(
                          fontSize: 17,
                          color: kPrimaryColor,
                          fontFamily: kCircularStdNormal),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kButtonColor),
                      child: const Icon(
                        Icons.email,
                        color: kWhiteColor,
                        size: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "tirth12@gmail.com",
                      style: TextStyle(
                          fontSize: 17,
                          color: kPrimaryColor,
                          fontFamily: kCircularStdNormal),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kWhiteColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/icons/1.png",
                                  fit: BoxFit.cover,
                                  scale: 1.2,
                                  height: 95,
                                  width: 95,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width - 170,
                                    child: const Text(
                                      "Ashadeep Society",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: kPrimaryColor,
                                          fontSize: 17,
                                          fontFamily: kCircularStdMedium),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.request_page_sharp,
                                        size: 16,
                                        color: kButtonColor,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "\$2500",
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: kPrimaryColor,
                                            fontSize: 17,
                                            fontFamily: kCircularStdMedium),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: kButtonColor,
                                      ),
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        width: Get.width / 2.5,
                                        child: const Text(
                                          "101 main street",
                                          style: TextStyle(
                                              color: kSecondaryPrimaryColor,
                                              fontSize: 13,
                                              fontFamily: kCircularStdMedium),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.bed_outlined,
                                        size: 16,
                                        color: kButtonColor,
                                      ),
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        width: Get.width - 220,
                                        child: const Text(
                                          "5",
                                          style: TextStyle(
                                              color: kSecondaryPrimaryColor,
                                              fontSize: 13,
                                              fontFamily: kCircularStdBold),
                                        ),
                                      ),
                                    ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
