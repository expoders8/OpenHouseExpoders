import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

import '../../../routes/app_pages.dart';
import '../../../view/nearby_view.dart';
import '../../Add NearBy/add_nearby.dart';
import '../../../view/tenant_history_view.dart';
import '../../../view/property_details_view.dart';
import '../../CreateProperty/create_property.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';
import '../../../view/house keeper/house_keeper_view.dart';
import '../../../controller/property_detail_controller.dart';

class NotLeasePropertyDetailPage extends StatefulWidget {
  const NotLeasePropertyDetailPage({super.key});

  @override
  State<NotLeasePropertyDetailPage> createState() =>
      _NotLeasePropertyDetailPageState();
}

class _NotLeasePropertyDetailPageState extends State<NotLeasePropertyDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isPreviousTenantsSelected = true;
  final GetnotleaseDetailsPropertiesController
      getnotleaseDetailsPropertiesController =
      Get.put(GetnotleaseDetailsPropertiesController());
  List<ImageProvider> images = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    Future.delayed(const Duration(seconds: 3), () {
      if (getnotleaseDetailsPropertiesController.detailModel != null &&
          getnotleaseDetailsPropertiesController.detailModel!.data != null &&
          getnotleaseDetailsPropertiesController.detailModel!.data!.images !=
              null) {
        setState(() {
          images = [
            ...getnotleaseDetailsPropertiesController.detailModel!.data!.images!
                .map((imageUrl) => NetworkImage(imageUrl)),
          ];
        });
      } else {
        setState(() {
          images = [const AssetImage('assets/images/noproperty.png')];
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (getnotleaseDetailsPropertiesController.isLoading.value) {
        return const Center(
            child: CircularProgressIndicator(color: kSelectedIconColor));
      } else {
        var propertydata =
            getnotleaseDetailsPropertiesController.detailModel!.data;
        return Stack(
          children: [
            SizedBox(
              height: Get.height / 2.94,
              width: double.infinity,
              child: AnotherCarousel(
                images: images,
                dotSize: 6,
                autoplay: false,
                showIndicator: true,
                borderRadius: true,
                radius: const Radius.circular(0),
                dotPosition: DotPosition.bottomCenter,
                indicatorBgPadding: 27.0,
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
                                expandedHeight: 0,
                                floating: false,
                                flexibleSpace: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: Get.width - 100,
                                              child: Text(
                                                propertydata.name!.toString(),
                                                style: const TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        kCircularStdMedium),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
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
                                                      color:
                                                          kSecondaryPrimaryColor,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          kCircularStdMedium),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => CreatePropertyPage(
                                                  checkEdit: "edit",
                                                  proeprtyId: propertydata.id
                                                      .toString(),
                                                  proeprtyName: propertydata
                                                      .name
                                                      .toString(),
                                                  description: propertydata
                                                      .description
                                                      .toString(),
                                                  bedrooms: propertydata.type
                                                      .toString(),
                                                  whoshrooms: propertydata
                                                      .subtype
                                                      .toString(),
                                                  capacity: propertydata
                                                      .category
                                                      .toString(),
                                                  selctesType: "",
                                                  price: propertydata.rentAmount
                                                      .toString(),
                                                  facilities: propertydata
                                                      .facilities
                                                      .toString(),
                                                  person: propertydata.person
                                                      .toString(),
                                                  address: propertydata.address
                                                      .toString(),
                                                  country: propertydata
                                                      .countryName
                                                      .toString(),
                                                  countryId: propertydata
                                                      .countryId
                                                      .toString(),
                                                  state: propertydata.stateName
                                                      .toString(),
                                                  stateId: propertydata.stateId
                                                      .toString(),
                                                  city: propertydata.cityName
                                                      .toString(),
                                                  amenitiesid:
                                                      propertydata.amenitys,
                                                  imagelist:
                                                      propertydata.images,
                                                  isActive: propertydata
                                                      .isActive
                                                      .toString(),
                                                ));
                                          },
                                          child: Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: kBorderColor,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const Icon(
                                              Icons.edit,
                                              color: kPrimaryColor,
                                              size: 20,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: List.generate(4, (index) {
                                        return const Icon(Icons.star,
                                            color: Color.fromARGB(
                                                255, 255, 230, 0));
                                      })
                                        ..add(const Icon(Icons.star_half,
                                            color: Color.fromARGB(
                                                255, 255, 230, 0))),
                                    ),
                                  ],
                                )),
                          ];
                        },
                        body: Column(
                          children: [
                            TabBar(
                              controller: _tabController,
                              indicatorColor: kButtonColor,
                              labelColor: kPrimaryColor,
                              tabs: const [
                                Tab(text: 'Tenants'),
                                Tab(text: 'Overview'),
                                Tab(text: 'Near By'),
                              ],
                            ),
                            Flexible(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {
                                                Get.toNamed(
                                                    Routes.inviteTenantPage);
                                              },
                                              child: Container(
                                                height: 38,
                                                width: Get.width - 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    border: Border.all(
                                                        color: kButtonColor),
                                                    color: kButtonColor),
                                                child: const Center(
                                                  child: Text(
                                                    "Invite Tenant",
                                                    style: TextStyle(
                                                        color: kWhiteColor,
                                                        fontFamily:
                                                            kCircularStdMedium,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 150,
                                                  height: 40,
                                                  child: CupertinoButton(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    padding: EdgeInsets.zero,
                                                    color:
                                                        isPreviousTenantsSelected
                                                            ? kBlack87Color
                                                            : kWhiteColor,
                                                    child: Text(
                                                      "Previous Tenants",
                                                      style: TextStyle(
                                                        color:
                                                            isPreviousTenantsSelected
                                                                ? kWhiteColor
                                                                : kBlack87Color,
                                                        fontFamily:
                                                            kCircularStdNormal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        isPreviousTenantsSelected =
                                                            true;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  width: 150,
                                                  height: 40,
                                                  child: CupertinoButton(
                                                    padding: EdgeInsets.zero,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color:
                                                        isPreviousTenantsSelected
                                                            ? kWhiteColor
                                                            : kBlack87Color,
                                                    child: Text(
                                                      "Housekeepers",
                                                      style: TextStyle(
                                                        color:
                                                            isPreviousTenantsSelected
                                                                ? kBlack87Color
                                                                : kWhiteColor,
                                                        fontFamily:
                                                            kCircularStdNormal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        isPreviousTenantsSelected =
                                                            false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            isPreviousTenantsSelected
                                                ? TenantHistoryView(
                                                    propertyId: propertydata!.id
                                                        .toString(),
                                                  )
                                                : HouseKeeperView(
                                                    propertyId: propertydata!.id
                                                        .toString(),
                                                  ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const NotLeasePropertyDetailsView(),
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            Get.to(() => AddNearByPage(
                                                  propertyId: propertydata.id!,
                                                ));
                                          },
                                          child: Container(
                                            height: 38,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: kPrimaryColor),
                                                color: kBackGroundColor),
                                            child: const Center(
                                              child: Text(
                                                "+ Add Nearby",
                                                style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontFamily:
                                                        kCircularStdNormal,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: NearByAmenitiesView(
                                          propertyId:
                                              propertydata.id!.toString(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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

  tenanthistory() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/icons/boy 2.png",
                fit: BoxFit.cover,
                height: 35,
                width: 35,
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tenant Name",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 13,
                      fontFamily: kCircularStdMedium),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 12,
                      color: kButtonColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "+91 9898567548",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 10,
                          fontFamily: kCircularStdNormal),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "01-7-2024 to 31-10-2024",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 10,
                          fontFamily: kCircularStdNormal),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  tenantRequest() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/icons/boy 2.png",
                fit: BoxFit.cover,
                height: 35,
                width: 35,
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tenant Name",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 13,
                      fontFamily: kCircularStdMedium),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 12,
                      color: kButtonColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "+91 9898567548",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 10,
                          fontFamily: kCircularStdNormal),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Pendding",
                      style: TextStyle(
                          color: kRedColor,
                          fontSize: 10,
                          fontFamily: kCircularStdNormal),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  amenities(String text) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/correct.png",
          fit: BoxFit.cover,
          height: 15,
          width: 15,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 14,
              fontFamily: kCircularStdNormal),
        ),
      ],
    );
  }
}
