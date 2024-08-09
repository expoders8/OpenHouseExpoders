import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openhome/config/constant/color_constant.dart';
import 'package:openhome/config/constant/font_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: kButtonColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 20, bottom: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 15,
                                  color: kWhiteColor),
                            ),
                            Text(
                              "\$2000",
                              style: TextStyle(
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 25,
                                  color: kWhiteColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 20, bottom: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Month Due",
                              style: TextStyle(
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 15,
                                  color: kPrimaryColor),
                            ),
                            Text(
                              "\$2000",
                              style: TextStyle(
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 25,
                                  color: kPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 20, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Property",
                            style: TextStyle(
                                fontFamily: kCircularStdMedium,
                                fontSize: 15,
                                color: kPrimaryColor),
                          ),
                          Text(
                            "10",
                            style: TextStyle(
                                fontFamily: kCircularStdMedium,
                                fontSize: 25,
                                color: kPrimaryColor),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/icons/line_vertical.png",
                        fit: BoxFit.cover,
                        scale: 1.5,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Property on lease",
                            style: TextStyle(
                                fontFamily: kCircularStdMedium,
                                fontSize: 15,
                                color: kPrimaryColor),
                          ),
                          Text(
                            "8",
                            style: TextStyle(
                                fontFamily: kCircularStdMedium,
                                fontSize: 25,
                                color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: kPrimaryColor)),
                            child: const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.electric_bolt_sharp,
                                size: 22,
                                color: kButtonColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Electricity",
                            style: TextStyle(
                                fontFamily: kCircularStdMedium,
                                fontSize: 20,
                                color: kPrimaryColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "I want to change fan.",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontFamily: kCircularStdNormal),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 15,
                            color: kButtonColor,
                          ),
                          Text(
                            "4693 Wentz Avenue, Saskatoon",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 12,
                                fontFamily: kCircularStdNormal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Tenant Requests",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontFamily: kCircularStdMedium),
              ),
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      tenantRequest("Tenant Name", "assets/icons/user.png",
                          "Pending", "tenant request"),
                      tenantRequest("Tenant Name", "assets/icons/user.png",
                          "Pending", "tenant request"),
                      tenantRequest("Tenant Name", "assets/icons/user.png",
                          "Pending", "tenant request")
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  tenantRequest(String text, image, price, comments) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Card(
        shadowColor: const Color.fromARGB(10, 0, 0, 0),
        elevation: 5,
        child: Container(
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    scale: 1.5,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  text,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdMedium,
                      fontSize: 16),
                ),
                Row(
                  children: [
                    const Text(
                      "Comments: ",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: kCircularStdNormal,
                          fontSize: 12),
                    ),
                    Text(
                      comments,
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontFamily: kCircularStdNormal,
                          fontSize: 12),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
