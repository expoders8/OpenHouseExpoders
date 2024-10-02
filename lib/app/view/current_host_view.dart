import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../controller/my_hosts_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';

class CurrentHostView extends StatefulWidget {
  const CurrentHostView({super.key});

  @override
  State<CurrentHostView> createState() => _CurrentHostViewState();
}

class _CurrentHostViewState extends State<CurrentHostView> {
  final GetAllCurrentHostsController getAllCurrentHostsController =
      Get.put(GetAllCurrentHostsController());
  TextEditingController searchController = TextEditingController();
  final GetDetailHostsController getDetailHostsController =
      Get.put(GetDetailHostsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getAllCurrentHostsController.isLoading.value) {
          return Container();
        } else {
          if (getAllCurrentHostsController.hostsList.isNotEmpty) {
            if (getAllCurrentHostsController.hostsList[0].data!.isEmpty) {
              return const Column(
                children: [
                  SizedBox(height: 250),
                  Text(
                    "No Current Hosts",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdMedium),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(13, 0, 10, 0),
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: kWhiteColor,
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                            color: kSecondaryPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: kWhiteColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: kWhiteColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: kWhiteColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: getAllCurrentHostsController
                          .hostsList[0].data!.length,
                      itemBuilder: (context, index) {
                        var requestData =
                            getAllCurrentHostsController.hostsList[0].data!;
                        if (requestData.isNotEmpty) {
                          var data = requestData[index];
                          return Column(
                            children: [
                              currentHost(
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
                              "No Current Hosts",
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
                  ),
                ],
              );
            }
          } else {
            return const Center(
              child: Text(
                "No Current Hosts",
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

  currentHost(String? image, name, address, contact, id) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        getDetailHostsController.hostId(id);
        getDetailHostsController.fetchHostDetail();
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
                                height: 70,
                                width: 70,
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
                      SizedBox(height: contact != "null" ? 3 : 0),
                      contact != "null"
                          ? Row(
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
                            )
                          : Container(),
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
