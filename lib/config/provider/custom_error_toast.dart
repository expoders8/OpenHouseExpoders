import 'package:flutter/material.dart';

import '../constant/color_constant.dart';

class CustomEErrorToast extends StatelessWidget {
  final String message;
  final VoidCallback onCloseButtonPressed;

  const CustomEErrorToast(
      {super.key, required this.message, required this.onCloseButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 80,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xffF6743E),
            Color(0xffD42525),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.close,
                size: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "error",
                    style: TextStyle(color: kWhiteColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    message,
                    style: const TextStyle(color: kWhiteColor),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onCloseButtonPressed,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.topRight,
                color: Colors.transparent,
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
