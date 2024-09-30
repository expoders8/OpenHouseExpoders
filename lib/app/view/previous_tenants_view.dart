import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../controller/my_tenants_controller.dart';
import '../routes/app_pages.dart';

class PreviousTenantsView extends StatefulWidget {
  const PreviousTenantsView({super.key});

  @override
  State<PreviousTenantsView> createState() => _PreviousTenantsViewState();
}

class _PreviousTenantsViewState extends State<PreviousTenantsView> {
  final GetAllPreviousTenantsController getAllPreviousTenantsController =
      Get.put(GetAllPreviousTenantsController());
  final GetDetailTenantsController getDetailTenantsController =
      Get.put(GetDetailTenantsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getAllPreviousTenantsController.isLoading.value) {
          return Container();
        } else {
          if (getAllPreviousTenantsController.tenantsList.isNotEmpty) {
            if (getAllPreviousTenantsController.tenantsList[0].data!.isEmpty) {
              return const Center(
                child: Text(
                  "No Previous Tenants",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 12,
                      fontFamily: kCircularStdMedium),
                ),
              );
            } else {
              return Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: getAllPreviousTenantsController
                      .tenantsList[0].data!.length,
                  itemBuilder: (context, index) {
                    var requestData =
                        getAllPreviousTenantsController.tenantsList[0].data!;
                    if (requestData.isNotEmpty) {
                      var data = requestData[index];
                      return Column(
                        children: [
                          currentTenants(
                              data.tenantProfilePicture.toString(),
                              "${data.tenantFirstName} ${data.tenantLastName}",
                              data.address.toString(),
                              data.tenantPhoneNumber.toString(),
                              data.id.toString()),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "No Previous Tenants",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                              fontFamily: kCircularStdMedium),
                        ),
                      );
                    }
                  },
                ),
              );
            }
          } else {
            return const Center(
              child: Text(
                "No Previous Tenants",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                    fontFamily: kCircularStdMedium),
              ),
            );
          }
        }
      },
    );
  }

  Widget currentTenants(String? image, name, address, contact, id) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        getDetailTenantsController.tenantId(id);
        getDetailTenantsController.fetchTenantDetail();
        Get.toNamed(Routes.myTenantsDetailsPage);
      },
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  image != "null"
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            image!,
                            fit: BoxFit.cover,
                            scale: 1.2,
                            height: 70,
                            width: 70,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/blank_profile.png",
                                fit: BoxFit.cover,
                                height: 110,
                                width: 110,
                              );
                            },
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            "assets/images/blank_profile.png",
                            fit: BoxFit.cover,
                            scale: 1.2,
                            height: 70,
                            width: 70,
                          ),
                        ),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontFamily: kCircularStdMedium),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: kButtonColor,
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: Get.width / 2,
                            child: Text(
                              address,
                              style: const TextStyle(
                                  color: kSecondaryPrimaryColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdBook),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 16,
                            color: kButtonColor,
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: Get.width / 2,
                            child: Text(
                              contact,
                              style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdBook),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
