import 'package:flutter/material.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../view/chechout_request.dart';

class CheckoutRequestsPage extends StatefulWidget {
  const CheckoutRequestsPage({super.key});

  @override
  State<CheckoutRequestsPage> createState() => _CheckoutRequestsPageState();
}

class _CheckoutRequestsPageState extends State<CheckoutRequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Checkout Requests",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        backgroundColor: kBackGroundColor,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: CheckOutRequestView(),
      ),
    );
  }
}
