import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';

class HouseKeeperView extends StatefulWidget {
  const HouseKeeperView({super.key});

  @override
  State<HouseKeeperView> createState() => _HouseKeeperViewState();
}

class _HouseKeeperViewState extends State<HouseKeeperView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Current Housekeeper",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 14,
              fontFamily: kCircularStdMedium,
            ),
          ),
          const Divider(),
          const SizedBox(height: 5),
          tenanthistory(),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40,
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(15),
                    padding: EdgeInsets.zero,
                    color: kButtonColor,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Remove",
                        style: TextStyle(
                            color: kWhiteColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 12),
                      ),
                    ),
                    onPressed: () {}),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: kButtonColor),
                    borderRadius: BorderRadius.circular(15)),
                height: 40,
                child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.circular(15),
                    color: kBackGroundColor,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        "Add",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 12),
                      ),
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Previous Housekeeper",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 14,
              fontFamily: kCircularStdMedium,
            ),
          ),
          const Divider(),
          const SizedBox(height: 5),
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
