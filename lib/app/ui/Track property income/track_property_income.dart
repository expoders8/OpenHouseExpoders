import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../controller/get_property_income_track_controller.dart';

class TrackPropertyIncomePage extends StatefulWidget {
  const TrackPropertyIncomePage({super.key});

  @override
  State<TrackPropertyIncomePage> createState() =>
      _TrackPropertyIncomePageState();
}

class _TrackPropertyIncomePageState extends State<TrackPropertyIncomePage> {
  final GetAllIncomeTrackController getAllIncomeTrackController =
      Get.put(GetAllIncomeTrackController());
  int totalExpense = 0;
  int totalPenddingrent = 0;
  int totalAmount = 0;
  DateTime? dateTime;
  String formattedDate = '';
  Future<void> _refreshItems() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      getAllIncomeTrackController.getAllProperties();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Income Track"),
      ),
      body: Obx(
        () {
          if (getAllIncomeTrackController.isLoading.value) {
            return Container(
              color: kBackGroundColor,
              child: const Center(
                child: CircularProgressIndicator(
                  color: kSelectedIconColor,
                ),
              ),
            );
          } else {
            if (getAllIncomeTrackController.propertyList.isNotEmpty) {
              if (getAllIncomeTrackController.propertyList[0].data == null) {
                return const Center(
                  child: Text(
                    "No property",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                );
              } else {
                return Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        itemCount: getAllIncomeTrackController
                            .propertyList[0].data!.length,
                        itemBuilder: (context, index) {
                          var requestData =
                              getAllIncomeTrackController.propertyList[0].data!;
                          if (requestData.isNotEmpty) {
                            var data = requestData[index];
                            if (requestData[index].totalExpenses!.isNotEmpty) {
                              totalExpense = data.totalExpenses!
                                  .map((expense) =>
                                      int.parse(expense.propertyExpense!))
                                  .reduce((sum, price) => sum + price);
                            }
                            if (requestData[index].pending!.isNotEmpty) {
                              totalPenddingrent = data.pending!
                                  .map((expense) =>
                                      int.parse(expense.pendingAmount!))
                                  .reduce((sum, price) => sum + price);

                              int currentPendingRent =
                                  int.tryParse(totalPenddingrent.toString()) ??
                                      0;
                              int totalAmount =
                                  int.tryParse(data.totalAmount.toString()) ??
                                      0;
                              totalPenddingrent =
                                  totalAmount - currentPendingRent;
                            }
                            totalAmount = totalPenddingrent - totalExpense;
                            return Column(
                              children: [
                                leaseproperty(
                                  data.propertyImage.toString(),
                                  data.propertyAddress.toString(),
                                  data.propertyName.toString(),
                                  "\$ ${data.totalAmount.toString()}",
                                  "\$ $totalPenddingrent",
                                  "\$ $totalExpense",
                                  "\$ $totalAmount",
                                )
                              ],
                            );
                          } else {
                            return SizedBox(
                              height: Get.height - 100,
                              child: const Center(
                                child: Text(
                                  "No property",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 15,
                                      fontFamily: kCircularStdMedium),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              }
            } else {
              return const Center(
                child: Text(
                  "No requests",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
              );
            }
          }
        },
      ),
    );
  }

  leaseproperty(String image, address, name, rentIncome, pendingRentIncome,
      expenseAmount, totalAmount) {
    return Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Rent Income",
                  style: TextStyle(
                      color: kGreenColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
                Text(
                  rentIncome,
                  style: const TextStyle(
                      color: kGreenColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pending Rent Income",
                  style: TextStyle(
                      color: kRedColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
                Text(
                  pendingRentIncome,
                  style: const TextStyle(
                      color: kRedColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Expenses amount",
                  style: TextStyle(
                      color: kRedColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
                Text(
                  expenseAmount,
                  style: const TextStyle(
                      color: kRedColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
              ],
            ),
            const Divider(
              color: kRedColor,
              thickness: 0.5,
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Amount",
                  style: TextStyle(
                      color: kGreenColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
                Text(
                  totalAmount,
                  style: const TextStyle(
                      color: kGreenColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
