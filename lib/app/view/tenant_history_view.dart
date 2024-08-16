import 'package:flutter/material.dart';

import '../../config/constant/color_constant.dart';
import '../../config/constant/font_constant.dart';

class TenantHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Previous Tenants",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 17,
              fontFamily: kCircularStdMedium,
            ),
          ),
          const Divider(),
          const SizedBox(height: 5),
          tenanthistory(),
          tenanthistory(),
          tenanthistory(),
          tenanthistory(),
          tenanthistory(),
        ],
      ),
    );
  }

  Widget tenanthistory() {
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
                  "Tenant Name",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14,
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
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 15,
                          color: kButtonColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "01-7-24 to 30-10-24",
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
