import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class TrackLeaseExtensionPage extends StatefulWidget {
  const TrackLeaseExtensionPage({super.key});

  @override
  State<TrackLeaseExtensionPage> createState() =>
      _TrackLeaseExtensionPageState();
}

class _TrackLeaseExtensionPageState extends State<TrackLeaseExtensionPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Property Extension"),
//       ),
//     );
//   }
// }

  // Future<void> _refreshItems() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   setState(() {
  //     getAllPropertyExpensesController.getAllExpenses();
  //   });
  // }

  @override
  void initState() {
    // getAllPropertyExpensesController.getAllExpenses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Property Service Expense"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: Column(
            children: [
              leaseproperty(
                "assets/icons/1.png",
                "Address",
                "Name",
                "01 May 2024",
                "01 jul 2024",
              )
            ],
          ),
        ),
      ),
    );
  }

  leaseproperty(String image, address, name, previousDate, extendedDte) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  image != "null"
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                            scale: 1.2,
                            height: 65,
                            width: 65,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/icons/1.png",
                                fit: BoxFit.cover,
                                height: 65,
                                scale: 1.2,
                                width: 65,
                              );
                            },
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            "assets/images/noproperty.png",
                            fit: BoxFit.cover,
                            scale: 1.2,
                            height: 70,
                            width: 70,
                          ),
                        ),
                  const SizedBox(width: 15.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width - 170,
                        child: Text(
                          name,
                          style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 17,
                              fontFamily: kCircularStdMedium),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: address.toString() == "null" ? 0 : 5),
                      address.toString() == "null"
                          ? Container()
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: kButtonColor,
                                ),
                                const SizedBox(width: 5),
                                SizedBox(
                                  width: Get.width / 2.5,
                                  child: Text(
                                    address.toString(),
                                    style: const TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontSize: 13,
                                        fontFamily: kCircularStdMedium),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 10, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Previous end date",
                          style: TextStyle(
                              fontFamily: kCircularStdNormal,
                              fontSize: 12,
                              color: kPrimaryColor),
                        ),
                        Text(
                          previousDate,
                          style: const TextStyle(
                              fontFamily: kCircularStdMedium,
                              fontSize: 16,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/icons/line_vertical.png",
                      fit: BoxFit.cover,
                      scale: 1.8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Extended Date",
                          style: TextStyle(
                              fontFamily: kCircularStdNormal,
                              fontSize: 12,
                              color: kPrimaryColor),
                        ),
                        Text(
                          extendedDte,
                          style: const TextStyle(
                              fontFamily: kCircularStdMedium,
                              fontSize: 16,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
