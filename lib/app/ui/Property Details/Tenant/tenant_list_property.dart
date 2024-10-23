import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

import '../../../view/property_details_view.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';
import '../../../controller/property_detail_controller.dart';

class ListPropertyDetailPage extends StatefulWidget {
  const ListPropertyDetailPage({super.key});

  @override
  State<ListPropertyDetailPage> createState() => _ListPropertyDetailPageState();
}

class _ListPropertyDetailPageState extends State<ListPropertyDetailPage>
    with SingleTickerProviderStateMixin {
  bool isPreviousTenantsSelected = true;
  final GetListDetailsPropertiesController getListDetailsPropertiesController =
      Get.put(GetListDetailsPropertiesController());
  List<ImageProvider> images = [];
  bool showUI = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (getListDetailsPropertiesController.detailModel != null &&
          getListDetailsPropertiesController.detailModel!.data != null &&
          getListDetailsPropertiesController.detailModel!.data!.images !=
              null) {
        setState(() {
          images = [
            ...getListDetailsPropertiesController.detailModel!.data!.images!
                .map((imageUrl) => NetworkImage(imageUrl)),
          ];
          showUI = true;
        });
      } else {
        setState(() {
          showUI = true;
          images = [const AssetImage('assets/images/noproperty.png')];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (getListDetailsPropertiesController.isLoading.value) {
        return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor));
      } else {
        var propertydata = getListDetailsPropertiesController.detailModel!.data;
        return Stack(
          children: [
            SizedBox(
              height: Get.height / 2.94,
              width: double.infinity,
              child: showUI == false
                  ? const Center(
                      child: CircularProgressIndicator(color: kPrimaryColor),
                    )
                  : AnotherCarousel(
                      images: images,
                      dotSize: 6,
                      autoplay: false,
                      borderRadius: true,
                      radius: const Radius.circular(0),
                      dotPosition: DotPosition.topCenter,
                      indicatorBgPadding: 35.0,
                      dotBgColor: Colors.transparent,
                    ),
            ),
            Positioned(
                top: 40,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 9.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                )),
            Positioned(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                margin: const EdgeInsets.only(top: 225),
                decoration: BoxDecoration(
                  color: kBackGroundColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Flexible(
                      child: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverAppBar(
                                automaticallyImplyLeading: false,
                                backgroundColor: kBackGroundColor,
                                expandedHeight: 55,
                                floating: false,
                                flexibleSpace: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width - 120,
                                          child: Text(
                                            propertydata!.name.toString(),
                                            style: const TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 18,
                                                fontFamily: kCircularStdMedium),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                        Text(
                                          "(${propertydata.category!.toString()})",
                                          style: const TextStyle(
                                              color: kSecondaryPrimaryColor,
                                              fontSize: 13,
                                              fontFamily: kCircularStdMedium),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "\$ ${propertydata.rentAmount!.toString()}",
                                              style: const TextStyle(
                                                  color: kButtonColor,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      kCircularStdMedium),
                                            ),
                                            const SizedBox(width: 10),
                                            const Text(
                                              "per month",
                                              style: TextStyle(
                                                  color: kSecondaryPrimaryColor,
                                                  fontSize: 13,
                                                  fontFamily:
                                                      kCircularStdMedium),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ];
                        },
                        body: const ListPropertyDetailsView(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }
    }));
  }
}
