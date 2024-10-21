import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/provider/loader_provider.dart';
import '../../services/checkout_service.dart';
import '../widgets/custom_textfield.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class TenantReviewPage extends StatefulWidget {
  final String? id;
  final String? name;
  final String? address;
  final String? propertyId;
  final String? tenantId;
  final String? hostId;
  const TenantReviewPage(
      {super.key,
      this.id,
      this.name,
      this.address,
      this.propertyId,
      this.tenantId,
      this.hostId});

  @override
  State<TenantReviewPage> createState() => _TenantReviewPageState();
}

class _TenantReviewPageState extends State<TenantReviewPage> {
  int _rating = 0;
  TextEditingController commentController = TextEditingController();
  CheckoutService checkoutService = CheckoutService();

  void _onStarTap(int index) {
    setState(() {
      _rating = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Feedback"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                int ratingIndex = index + 1; // Adjust index to start from 1
                return IconButton(
                  icon: Icon(
                    ratingIndex <= _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 40,
                  ),
                  onPressed: () {
                    _onStarTap(ratingIndex); // Pass the rating index directly
                  },
                );
              }),
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              hintText: 'Comment',
              maxLines: 3,
              ctrl: commentController,
              name: "create",
            ),
            const SizedBox(height: 10),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                LoaderX.show(context, 60.0, 60.0);
                double ratingAsDouble = _rating.toDouble();
                checkoutService.acceptCheckoutInvitation(
                    widget.id.toString(),
                    widget.name.toString(),
                    widget.address.toString(),
                    widget.propertyId.toString(),
                    widget.tenantId.toString(),
                    widget.hostId.toString(),
                    commentController.text,
                    ratingAsDouble);
              },
              child: Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: kWhiteColor),
                    color: kButtonColor),
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: kWhiteColor,
                        fontFamily: kCircularStdNormal,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
