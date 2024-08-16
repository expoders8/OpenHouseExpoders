import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/constant/color_constant.dart';
import '../../config/constant/font_constant.dart';
import '../routes/app_pages.dart';

class NotLeasePropertyView extends StatelessWidget {
  const NotLeasePropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 85),
      ],
    );
  }

  Widget notLeaseProperty(
    String image,
    price,
    address,
    person,
  ) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.notLeasePropertyDetailPage);
      },
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
            ],
          ),
        ),
      ),
    );
  }
}
