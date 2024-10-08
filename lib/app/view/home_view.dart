import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:openhome/app/routes/app_pages.dart';
import 'package:openhome/config/constant/font_constant.dart';
import 'package:openhome/config/constant/color_constant.dart';

import '../controller/tab_controller.dart';

class ResponsiveGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of columns based on screen size
    int gridColumns;
    if (screenWidth <= 600) {
      gridColumns = 2; // For small screens, show 2 columns
    } else if (screenWidth <= 900) {
      gridColumns = 3; // For medium screens, show 3 columns
    } else {
      gridColumns = 4; // For large screens, show 4 columns
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridColumns,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio:
                1, // Set this ratio based on your design preference
          ),
          itemCount: 10, // Example item count
          itemBuilder: (context, index) {
            return ResponsiveContainer(
              icon: Icons.home, // Example icon
              name: 'Item $index', // Example name
            );
          },
        ),
      ),
    );
  }
}

class ResponsiveContainer extends StatelessWidget {
  final IconData icon;
  final String name;

  const ResponsiveContainer({required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    final tabController = Get.put(TabCountController());
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        if (name == "Manage All\nYour Properties") {
          tabController.changeTabIndex(1);
        } else if (name == "Manage Tenants' Service Requests") {
          Get.toNamed(Routes.tenantRequestAllView);
        } else if (name == "Track Check-Out Requests") {
          Get.toNamed(Routes.checkoutRequestsPage);
        } else if (name == "Tenant Service\nRequest") {
          Get.toNamed(Routes.myRequestViewAllView);
        } else if (name == "Property Invitations") {
          Get.toNamed(Routes.invitationshowPage);
        } else if (name == "Track Lease\nExtensions") {
          Get.toNamed(Routes.trackLeaseExtensionPage);
        } else if (name == "Track Property\nExpenses") {
          Get.toNamed(Routes.trackLeaseExpensesPage);
        } else if (name == "Track Property\nIncome") {
          Get.toNamed(Routes.trackPropertyIncomePage);
        } else if (name == "Chat with Host") {
          Get.toNamed(Routes.messagePage);
        }
      },
      child: Card(
        elevation: 5,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: kButtonColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 31,
                color: kButtonColor,
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: kCircularStdMedium,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
