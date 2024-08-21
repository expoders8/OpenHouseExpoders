import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';

class PreviousPropertyView extends StatefulWidget {
  const PreviousPropertyView({super.key});

  @override
  State<PreviousPropertyView> createState() => _PreviousPropertyViewState();
}

class _PreviousPropertyViewState extends State<PreviousPropertyView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height - 210,
      child: SingleChildScrollView(
        child: Column(
          children: [
            notLeaseProperty(
              "assets/icons/1.png",
              "\$2550",
              "101 Main Street",
              "2",
            ),
            const SizedBox(height: 15),
            notLeaseProperty(
              "assets/icons/2.png",
              "\$1520",
              "3545 Robson St, Vancouver",
              "1",
            ),
            const SizedBox(height: 15),
            notLeaseProperty(
              "assets/icons/3.png",
              "\$1850",
              "224 Robson St, Vancouver",
              "2",
            ),
            const SizedBox(height: 65)
          ],
        ),
      ),
    );
  }

  Widget notLeaseProperty(
    String image,
    price,
    address,
    person,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      image,
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
                      Text(
                        price,
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                            fontFamily: kCircularStdMedium),
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
                            child: Text(
                              address,
                              style: const TextStyle(
                                  color: kSecondaryPrimaryColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.bed_outlined,
                            size: 16,
                            color: kButtonColor,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: Get.width - 220,
                            child: Text(
                              person,
                              style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdBold),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.wifi,
                            size: 16,
                            color: kSecondaryPrimaryColor,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.gas_meter_rounded,
                            size: 16,
                            color: kSecondaryPrimaryColor,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.electric_bolt_sharp,
                            size: 16,
                            color: kSecondaryPrimaryColor,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.local_parking,
                            size: 16,
                            color: kSecondaryPrimaryColor,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.nest_cam_wired_stand_sharp,
                            size: 16,
                            color: kSecondaryPrimaryColor,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Container(
                        height: 38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: kWhiteColor),
                            color: kButtonColor),
                        child: const Center(
                          child: Text(
                            "Request",
                            style: TextStyle(
                                color: kWhiteColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Container(
                        height: 38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: kWhiteColor),
                            color: kPrimaryColor),
                        child: const Center(
                          child: Text(
                            "Book Now",
                            style: TextStyle(
                                color: kWhiteColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
