import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../controller/my_tenants_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';
import '../ui/My Tenants/my_tenants_detail.dart';

class PreviousTenantsView extends StatefulWidget {
  const PreviousTenantsView({super.key});

  @override
  State<PreviousTenantsView> createState() => _PreviousTenantsViewState();
}

class _PreviousTenantsViewState extends State<PreviousTenantsView> {
  TextEditingController searchController = TextEditingController();
  final GetAllPreviousTenantsController getAllPreviousTenantsController =
      Get.put(GetAllPreviousTenantsController());
  final GetDetailTenantsController getDetailTenantsController =
      Get.put(GetDetailTenantsController());

  Future<void> _refreshItems() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      getAllPreviousTenantsController.fetchAllTenants();
    });
  }

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
                child: Padding(
                  padding: EdgeInsets.only(bottom: 55.0),
                  child: Text(
                    "No Previous Tenants",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10.0),
                  //   child: TextFormField(
                  //     controller: searchController,
                  //     decoration: InputDecoration(
                  //       contentPadding: const EdgeInsets.fromLTRB(13, 0, 10, 0),
                  //       prefixIcon: const Icon(Icons.search),
                  //       filled: true,
                  //       fillColor: kWhiteColor,
                  //       hintText: 'Search',
                  //       hintStyle: const TextStyle(
                  //           color: kSecondaryPrimaryColor,
                  //           fontFamily: kCircularStdNormal,
                  //           fontWeight: FontWeight.w400,
                  //           fontSize: 16),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(25.0),
                  //         borderSide: const BorderSide(color: kWhiteColor),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(25.0),
                  //         borderSide: const BorderSide(color: kWhiteColor),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(25.0),
                  //         borderSide: const BorderSide(color: kWhiteColor),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: RefreshIndicator(
                      onRefresh: _refreshItems,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: getAllPreviousTenantsController
                            .tenantsList[0].data!.length,
                        itemBuilder: (context, index) {
                          var requestData = getAllPreviousTenantsController
                              .tenantsList[0].data!;
                          if (requestData.isNotEmpty) {
                            var data = requestData[index];
                            return Column(
                              children: [
                                previousTenants(
                                    data.tenantProfilePicture.toString(),
                                    "${data.tenantFirstName} ${data.tenantLastName}",
                                    data.address.toString(),
                                    data.tenantPhoneNumber.toString(),
                                    data.id.toString(),
                                    data.tenantrating!),
                                const SizedBox(height: 10),
                              ],
                            );
                          } else {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 55.0),
                                child: Text(
                                  "No Previous Tenants",
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
                  ),
                ],
              );
            }
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 55.0),
                child: Text(
                  "No Previous Tenants",
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

  previousTenants(String? image, name, address, contact, id, double? rating) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        getDetailTenantsController.tenantId(id);
        getDetailTenantsController.fetchTenantDetail();
        Get.to(() => const MyTenantsDetailsPage());
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
                  SizedBox(
                    width: Get.width - 140,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                            const SizedBox(height: 5),
                            Row(
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
                                  width: Get.width - 200,
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
                            SizedBox(height: contact != "null" ? 3 : 0),
                            contact != "null"
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.phone,
                                        size: 16,
                                        color: kButtonColor,
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        width: Get.width - 200,
                                        child: Text(
                                          contact,
                                          style: const TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 13,
                                              fontFamily: kCircularStdBook),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                        Image.asset(
                          rating! <= 2
                              ? "assets/images/bad.jpg"
                              : rating <= 3 && rating > 2
                                  ? "assets/images/good.jpg"
                                  : rating <= 4 && rating > 3
                                      ? "assets/images/average.jpg"
                                      : rating <= 5 && rating > 4
                                          ? "assets/images/excellent.jpg"
                                          : "",
                          height: 35,
                          width: 35,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
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
