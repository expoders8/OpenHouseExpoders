import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../widgets/custom_textfield.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/loader_provider.dart';

class PayRentPage extends StatefulWidget {
  final String? propertyId;
  final String? propertyAmount;
  final String? propertyName;
  final String? propertyAddress;
  final String? propertyImage;
  // final GetAllCampaignDataModel data;

  const PayRentPage({
    Key? key,
    this.propertyId,
    this.propertyAmount,
    this.propertyName,
    this.propertyAddress,
    this.propertyImage,
  }) : super(key: key);

  @override
  State<PayRentPage> createState() => _PayRentPageState();
}

class _PayRentPageState extends State<PayRentPage> {
  int _value = 0;
  String userId = "";
  String cardId = "";
  String cardToken = "";
  String donationAmount = "5";
  bool checkedValue = false;
  TextEditingController amountController = TextEditingController();
  CardFormEditController controller = CardFormEditController();
  CardFieldInputDetails? creditCard;
  // String _publishableKey = '';

  @override
  void initState() {
    super.initState();
    amountController.text =
        widget.propertyAmount! == "" ? "" : widget.propertyAmount!;
  }

  // getPublishableKeyFromApi() async {
  //   await getSettings().then((key) {
  //     setState(() {
  //       _publishableKey = key.data.stripePublishableApiKey;
  //     });
  //   });
  //   Stripe.publishableKey = _publishableKey;
  //   await Stripe.instance.applySettings();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pay Rent"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: kWhiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(80, 0, 0, 0),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                        spreadRadius: -8,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            widget.propertyImage!,
                            fit: BoxFit.cover,
                            scale: 1.2,
                            height: 75,
                            width: 75,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/samplehouse.jpeg",
                                fit: BoxFit.cover,
                                height: 75,
                                scale: 1.2,
                                width: 75,
                              );
                            },
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.propertyName!,
                              style: const TextStyle(
                                fontFamily: kCircularStdMedium,
                                fontSize: 16,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.propertyAddress!,
                              style: const TextStyle(
                                fontFamily: kCircularStdBook,
                                fontSize: 12,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: '\$ Amount',
                  maxLines: 1,
                  ctrl: amountController,
                  keyboardType: TextInputType.number,
                  name: "iamount",
                  validationMsg: 'Please enter amount',
                ),
                buildTextWidget("Donation Amount"),
                buildDonationTypeList(0, "Saved Cards"),
                const SizedBox(height: 10),
                buildDonationTypeList(1, "Credit Card & Debit Card"),
                const SizedBox(height: 10),
                // buildDonationTypeList(2, "PayPal"),
                _value == 2 ? Container() : buildTextWidget("Payment Details"),
                // _value == 0
                //     // ? Container()
                //     // // ? PaymentTypeSavedCard(callbackSelectedCardId: (val) {
                //     // //     Future.delayed(const Duration(seconds: 3), () {
                //     // //       if (mounted) {
                //     // //         setState(() {
                //     // //           cardId = val;
                //     // //         });
                //     // //       }
                //     // //     });
                //     // //   })
                //     // : _value == 1
                CardFormField(
                  controller: controller,
                  style: CardFormStyle(
                    backgroundColor: kWhiteColor,
                    textColor: kPrimaryColor,
                    textErrorColor: kErrorColor,
                    borderRadius: 10,
                    cursorColor: kPrimaryColor,
                    placeholderColor: kPrimaryColor,
                    fontSize: 14,
                  ),
                  dangerouslyGetFullCardDetails: true,
                  onCardChanged: (card) {
                    if (mounted) {
                      setState(() {
                        creditCard = card;
                      });
                    }
                  },
                ),
                //     //     : Container(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: CheckboxListTile(
                    tileColor: kWhiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    title: const Text("Hide your Name"),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue!;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () async {
                        LoaderX.show(context, 50.0, 50.0);
                      },
                      child: const Text(
                        "Pay Rent",
                        style: TextStyle(color: kWhiteColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showSnackbar(msg) {
    LoaderX.hide();
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(
          msg,
          textAlign: TextAlign.start,
        ),
        backgroundColor: kErrorColor,
        behavior: SnackBarBehavior.floating,
        width: MediaQuery.of(context).size.width - 50,
      ));
  }

  Widget buildTextWidget(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(7, 20, 0, 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontFamily: kCircularStdBold,
        ),
      ),
    );
  }

  Widget buildDonationTypeList(int value, String name) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() => _value = value);
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          border:
              Border.all(color: _value == value ? kButtonColor : kWhiteColor),
          borderRadius: BorderRadius.circular(8),
          color: kWhiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    _value == value
                        ? Image.asset(
                            "assets/icons/ellipse_selected.png",
                            scale: 2,
                          )
                        : Image.asset(
                            "assets/icons/ellipse.png",
                            scale: 2,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: kCircularStdNormal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    value == 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                "assets/icons/payment_card4.png",
                                scale: 1.7,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                "assets/icons/payment_card3.png",
                                scale: 1.7,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                "assets/icons/payment_card2.png",
                                scale: 1.7,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                "assets/icons/payment_card1.png",
                                scale: 1.7,
                              )
                            ],
                          )
                        : value == 2
                            ? Image.asset(
                                "assets/icons/payment_card5.png",
                                scale: 2,
                              )
                            : value == 3
                                ? Image.asset(
                                    "assets/icons/payment_card6.png",
                                    scale: 2,
                                  )
                                : Container(),
                    const SizedBox(width: 10)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: hintText == "CVV" ? TextInputType.number : null,
            maxLength: hintText == "CVV" ? 3 : null,
            decoration: InputDecoration(
              counterText: '',
              errorMaxLines: 1,
              hintText: hintText,
              contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              hintStyle: const TextStyle(
                fontFamily: kCircularStdBook,
                fontWeight: FontWeight.w400,
                color: kPrimaryColor,
                fontSize: 14,
              ),
              filled: true,
              fillColor: kWhiteColor,
              errorStyle: const TextStyle(fontSize: 10),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                borderSide: BorderSide(color: kWhiteColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: kWhiteColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
