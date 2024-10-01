import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../controller/my_tenants_controller.dart';

class MyTenantsDetailsPage extends StatefulWidget {
  const MyTenantsDetailsPage({super.key});

  @override
  State<MyTenantsDetailsPage> createState() => _MyTenantsDetailsPageState();
}

class _MyTenantsDetailsPageState extends State<MyTenantsDetailsPage> {
  final GetDetailTenantsController getDetailTenantsController =
      Get.put(GetDetailTenantsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Tenant",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        backgroundColor: kBackGroundColor,
      ),
      body: Obx(() {
        if (getDetailTenantsController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(color: kSelectedIconColor));
        } else {
          var tenantsdata = getDetailTenantsController.detailModel!.data!;
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: kWhiteColor, width: 2),
                          borderRadius: BorderRadius.circular(1000)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: tenantsdata.tenant!.profilePicture.toString() !=
                                "null"
                            ? Image.network(
                                tenantsdata.tenant!.profilePicture.toString(),
                                fit: BoxFit.cover,
                                height: 110,
                                width: 110,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/blank_profile.png",
                                    fit: BoxFit.cover,
                                    height: 110,
                                    width: 110,
                                  );
                                },
                              )
                            : Image.asset(
                                "assets/images/blank_profile.png",
                                fit: BoxFit.cover,
                                height: 110,
                                width: 110,
                              ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${tenantsdata.tenant!.firstName.toString()} ${tenantsdata.tenant!.lastName.toString()}",
                      style: TextStyle(
                          fontFamily: kCircularStdBold,
                          fontSize: 20,
                          color: kPrimaryColor),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: kButtonColor),
                          child: const Icon(
                            Icons.phone,
                            color: kWhiteColor,
                            size: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          tenantsdata.tenant!.phoneNumber.toString(),
                          style: TextStyle(
                              fontSize: 17,
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: kButtonColor),
                          child: const Icon(
                            Icons.email,
                            color: kWhiteColor,
                            size: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          tenantsdata.tenant!.email.toString(),
                          style: TextStyle(
                              fontSize: 17,
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: kWhiteColor),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      tenantsdata
                                          .tenant!.property!.profilePicture
                                          .toString(),
                                      fit: BoxFit.cover,
                                      scale: 1.2,
                                      height: 95,
                                      width: 95,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          "assets/images/noproperty.png",
                                          fit: BoxFit.cover,
                                          height: 110,
                                          width: 110,
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width - 170,
                                        child: Text(
                                          tenantsdata.tenant!.property!.name
                                              .toString(),
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: kPrimaryColor,
                                              fontSize: 17,
                                              fontFamily: kCircularStdMedium),
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.request_page_sharp,
                                            size: 16,
                                            color: kButtonColor,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            tenantsdata
                                                .tenant!.property!.rentAmount
                                                .toString(),
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: kPrimaryColor,
                                                fontSize: 17,
                                                fontFamily: kCircularStdMedium),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 16,
                                            color: kButtonColor,
                                          ),
                                          const SizedBox(width: 10),
                                          SizedBox(
                                            width: Get.width / 2.5,
                                            child: Text(
                                              tenantsdata
                                                  .tenant!.property!.address
                                                  .toString(),
                                              style: TextStyle(
                                                  color: kSecondaryPrimaryColor,
                                                  fontSize: 13,
                                                  fontFamily:
                                                      kCircularStdMedium),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}