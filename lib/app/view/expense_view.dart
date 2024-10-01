import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../services/properties_service.dart';
import '../controller/property_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../../config/provider/loader_provider.dart';

class ExpenseView extends StatefulWidget {
  const ExpenseView({super.key});

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  final GetAllExpenseController getAllExpenseController =
      Get.put(GetAllExpenseController());
  PropertiesService propertiesService = PropertiesService();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getAllExpenseController.isLoading.value) {
          return Container();
        } else {
          if (getAllExpenseController.expensetList.isNotEmpty) {
            if (getAllExpenseController.expensetList[0].data!.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text(
                    "No Expenses",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                ),
              );
            } else {
              return SizedBox(
                height: Get.height,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount:
                      getAllExpenseController.expensetList[0].data!.length,
                  itemBuilder: (context, index) {
                    var requestData =
                        getAllExpenseController.expensetList[0].data!;
                    if (requestData.isNotEmpty) {
                      var data = requestData[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          slidableExpenseItem(
                            data.amenityname.toString(),
                            data.price.toString(),
                            // Icons.electric_bolt_sharp,
                            data.id.toString(),
                          ),
                        ],
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Center(
                          child: Text(
                            "No Expenses",
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
              );
            }
          } else {
            return const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(
                child: Text(
                  "No Expenses",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                ),
              ),
            );
          }
        }
      },
    );
  }

  slidableExpenseItem(
    String title,
    String amount,
    // IconData icons,
    String id,
  ) {
    return Slidable(
      key: ValueKey(title),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              LoaderX.show(context, 60.0, 60.0);
              propertiesService.deleteExpense(id);
            },
            backgroundColor: kRedColor,
            foregroundColor: kWhiteColor,
            icon: Icons.delete,
            label: 'Delete',
            autoClose: true,
            spacing: 2.5,
          )
        ],
      ),
      child: routingmaintanance(title, amount),
    );
  }

  routingmaintanance(
    String title,
    String amount,
    // IconData icons,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title[0].toUpperCase() + title.substring(1),
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
                fontFamily: kCircularStdMedium,
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                color: kButtonColor,
                fontSize: 16,
                fontFamily: kCircularStdMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
