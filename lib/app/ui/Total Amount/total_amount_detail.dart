import 'package:flutter/material.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class TotalAmountDetailPage extends StatefulWidget {
  const TotalAmountDetailPage({super.key});

  @override
  State<TotalAmountDetailPage> createState() => _TotalAmountDetailPageState();
}

class _TotalAmountDetailPageState extends State<TotalAmountDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Property Amount",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        centerTitle: true,
        backgroundColor: kBackGroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            amount("Himalaya property", "assets/icons/1.png", "\$25460"),
            const SizedBox(height: 20),
            amount("Capricon property", "assets/icons/2.png", "\$47020"),
            const SizedBox(height: 20),
            amount("Himalaya property 101", "assets/icons/3.png", "\$21300"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  amount(String title, image, detail) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: 45,
            width: 45,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 12,
                  fontFamily: kCircularStdMedium),
            ),
            Text(
              detail,
              style: const TextStyle(
                  color: kSecondaryPrimaryColor,
                  fontSize: 15,
                  fontFamily: kCircularStdMedium),
            ),
          ],
        ),
      ],
    );
  }
}
