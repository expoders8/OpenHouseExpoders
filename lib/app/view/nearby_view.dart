import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller/nearby_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';

class NearByAmenitiesView extends StatefulWidget {
  final String? propertyId;
  const NearByAmenitiesView({super.key, this.propertyId});

  @override
  State<NearByAmenitiesView> createState() => _NearByAmenitiesViewState();
}

class _NearByAmenitiesViewState extends State<NearByAmenitiesView> {
  final GetAllNearByAmenitiesController getAllNearByAmenitiesController =
      Get.put(GetAllNearByAmenitiesController());
  @override
  void initState() {
    getAllNearByAmenitiesController.propertyId(widget.propertyId.toString());
    getAllNearByAmenitiesController.getAllNearBys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getAllNearByAmenitiesController.isLoading.value) {
          return Container();
        } else {
          if (getAllNearByAmenitiesController.requestList.isNotEmpty) {
            if (getAllNearByAmenitiesController.requestList[0].data!.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text(
                    "No NearBy Amenities",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                ),
              );
            } else {
              return Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: getAllNearByAmenitiesController
                      .requestList[0].data!.length,
                  itemBuilder: (context, index) {
                    var requestData =
                        getAllNearByAmenitiesController.requestList[0].data!;
                    if (requestData.isNotEmpty) {
                      var data = requestData[index];
                      return Column(
                        children: [
                          nearby(data.title.toString(), data.address.toString(),
                              data.description.toString()),
                          const SizedBox(height: 10),
                        ],
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Center(
                          child: Text(
                            "No NearBy Amenities",
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
                  "No NearBy Amenities",
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

  nearby(String? title, address, type) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                    fontFamily: kCircularStdMedium),
              ),
              SizedBox(
                width: Get.width / 2,
                child: Text(
                  type,
                  style: const TextStyle(
                      color: kSecondaryPrimaryColor,
                      fontSize: 11,
                      fontFamily: kCircularStdMedium),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 13,
                    color: kButtonColor,
                  ),
                  const SizedBox(width: 3),
                  SizedBox(
                    width: Get.width / 2,
                    child: Text(
                      address,
                      style: const TextStyle(
                          color: kSecondaryPrimaryColor,
                          fontSize: 11,
                          fontFamily: kCircularStdNormal),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
