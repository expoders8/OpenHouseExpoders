import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controller/my_hosts_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class MyHostsDetailsPage extends StatefulWidget {
  const MyHostsDetailsPage({super.key});

  @override
  State<MyHostsDetailsPage> createState() => _MyHostsDetailsPageState();
}

class _MyHostsDetailsPageState extends State<MyHostsDetailsPage> {
  final GetDetailHostsController getDetailHostsController =
      Get.put(GetDetailHostsController());
  @override
  void initState() {
    getDetailHostsController.fetchHostDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Host",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        backgroundColor: kBackGroundColor,
      ),
      body: Obx(() {
        if (getDetailHostsController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(color: kSelectedIconColor));
        } else {
          var hostsdata = getDetailHostsController.detailModel!.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kWhiteColor, width: 2),
                            borderRadius: BorderRadius.circular(1000)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: hostsdata.host!.profilePicture.toString() !=
                                  "null"
                              ? Image.network(
                                  hostsdata.host!.profilePicture.toString(),
                                  fit: BoxFit.cover,
                                  height: 90,
                                  width: 90,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      "assets/images/blank_profile.png",
                                      fit: BoxFit.cover,
                                      height: 90,
                                      width: 90,
                                    );
                                  },
                                )
                              : Image.asset(
                                  "assets/images/blank_profile.png",
                                  fit: BoxFit.cover,
                                  height: 90,
                                  width: 90,
                                ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${hostsdata.host!.firstName.toString()} ${hostsdata.host!.lastName.toString()}",
                            style: const TextStyle(
                                fontFamily: kCircularStdBold,
                                fontSize: 20,
                                color: kPrimaryColor),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: kButtonColor),
                                child: const Icon(
                                  Icons.phone,
                                  color: kWhiteColor,
                                  size: 12,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                hostsdata.host!.phoneNumber.toString(),
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdNormal),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: kButtonColor),
                                child: const Icon(
                                  Icons.email,
                                  color: kWhiteColor,
                                  size: 12,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                hostsdata.host!.email.toString(),
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdNormal),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  buildTextWidget("Property Details"),
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
                                    hostsdata.host!.property!.profilePicture
                                        .toString(),
                                    fit: BoxFit.cover,
                                    scale: 1.2,
                                    height: 95,
                                    width: 95,
                                    errorBuilder: (context, error, stackTrace) {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width - 170,
                                      child: Text(
                                        hostsdata.host!.property!.name
                                            .toString(),
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: kPrimaryColor,
                                            fontSize: 17,
                                            fontFamily: kCircularStdMedium),
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.request_page_sharp,
                                          size: 16,
                                          color: kButtonColor,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "\$ ${hostsdata.host!.property!.rentAmount.toString()}",
                                          style: const TextStyle(
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
                                            hostsdata.host!.property!.address
                                                .toString(),
                                            style: const TextStyle(
                                                color: kSecondaryPrimaryColor,
                                                fontSize: 13,
                                                fontFamily: kCircularStdMedium),
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
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kButtonColor,
        child: const Icon(
          Icons.chat,
          color: kWhiteColor,
        ),
      ),
    );
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
}
