import 'package:flutter/material.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class TenantHouseKeeperView extends StatefulWidget {
  const TenantHouseKeeperView({super.key});

  @override
  State<TenantHouseKeeperView> createState() => _TenantHouseKeeperViewState();
}

class _TenantHouseKeeperViewState extends State<TenantHouseKeeperView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Housekeeper",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 14,
              fontFamily: kCircularStdMedium,
            ),
          ),
          const Divider(),
          const SizedBox(height: 5),
          housekeeperhistory(),
        ],
      ),
    );
  }

  housekeeperhistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/icons/boy 2.png",
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Housekeeper Name",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 15,
                          color: kButtonColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "+91 9898567548",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 11,
                              fontFamily: kCircularStdNormal),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
