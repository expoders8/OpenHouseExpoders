import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:openhome/app/ui/Add%20Expense/add_expense.dart';

import '../../controller/property_controller.dart';
import '../../routes/app_pages.dart';
import '../../services/properties_service.dart';
import '../../view/expense_view.dart';
import '../../view/nearby_view.dart';
import '../../view/house keeper/house_keeper_view.dart';
import '../../view/payment_detail_view.dart';
import '../../view/tenant_history_view.dart';
import '../../view/property_details_view.dart';
import '../../../config/constant/constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../controller/property_detail_controller.dart';
import '../CreateProperty/create_property.dart';

class LeasePropertyDetailPage extends StatefulWidget {
  const LeasePropertyDetailPage({super.key});

  @override
  State<LeasePropertyDetailPage> createState() =>
      _LeasePropertyDetailPageeState();
}

class _LeasePropertyDetailPageeState extends State<LeasePropertyDetailPage>
    with SingleTickerProviderStateMixin {
  String selectedRoll = "";
  late TabController _tabController;
  bool isPreviousTenantsSelected = true;
  final GetDetailsPropertiesController getDetailsPropertiesController =
      Get.put(GetDetailsPropertiesController());
  final GetAllExpenseController getAllExpenseController =
      Get.put(GetAllExpenseController());
  List<ImageProvider> images = [];
  PropertiesService propertiesService = PropertiesService();

  @override
  void initState() {
    super.initState();
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
    });
    _tabController = TabController(length: 5, vsync: this);

    Future.delayed(const Duration(seconds: 3), () {
      if (getDetailsPropertiesController.detailModel != null &&
          getDetailsPropertiesController.detailModel!.data != null &&
          getDetailsPropertiesController.detailModel!.data!.images != null) {
        setState(() {
          images = [
            ...getDetailsPropertiesController.detailModel!.data!.images!
                .map((imageUrl) => NetworkImage(imageUrl)),
          ];
        });
      } else {
        setState(() {
          images = [const AssetImage('assets/images/noproperty.png')];
        });
      }
    });
    Future.delayed(const Duration(seconds: 5), () {
      if (getDetailsPropertiesController.detailModel != null &&
          getDetailsPropertiesController.detailModel!.data != null &&
          getDetailsPropertiesController.detailModel!.data!.id != null) {
        setState(() {
          getAllExpenseController
              .propertyId(getDetailsPropertiesController.detailModel!.data!.id);
          getAllExpenseController.getAllExpenses();
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
    return Scaffold(
      body: Obx(() {
        if (getDetailsPropertiesController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(color: kSelectedIconColor));
        } else {
          var propertydata = getDetailsPropertiesController.detailModel!.data!;
          return Stack(
            children: [
              SizedBox(
                height: Get.height / 2.9,
                width: double.infinity,
                child: AnotherCarousel(
                  images: images,
                  dotSize: 6,
                  autoplay: false,
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
                      padding: EdgeInsets.only(left: 8.5),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ),
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
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    propertydata.rentAmount!
                                                        .toString(),
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
                                                    price: propertydata
                                                        .rentAmount
                                                        .toString(),
                                                    facilities: propertydata
                                                        .facilities
                                                        .toString(),
                                                    person: propertydata.person
                                                        .toString(),
                                                    address: propertydata
                                                        .address
                                                        .toString(),
                                                    country: propertydata
                                                        .countryName
                                                        .toString(),
                                                    countryId: propertydata
                                                        .countryId
                                                        .toString(),
                                                    state: propertydata
                                                        .stateName
                                                        .toString(),
                                                    stateId: propertydata
                                                        .stateId
                                                        .toString(),
                                                    city: propertydata.cityName
                                                        .toString(),
                                                    amenitiesid:
                                                        propertydata.amenitys,
                                                  ));
                                            },
                                            child: Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                  color: kBorderColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
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
                                tabAlignment: TabAlignment.start,
                                controller: _tabController,
                                indicatorColor: kButtonColor,
                                isScrollable: true,
                                labelColor: kPrimaryColor,
                                tabs: const [
                                  Tab(text: 'Tenants'),
                                  Tab(text: 'Overview'),
                                  Tab(text: 'Near By'),
                                  Tab(text: 'Payment'),
                                  Tab(text: 'Expense'),
                                ],
                              ),
                              Flexible(
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          tenantname(
                                            propertydata.tenantdetails!
                                                        .profilePicture
                                                        .toString() ==
                                                    "null"
                                                ? "assets/images/blank_profile.png"
                                                : propertydata.tenantdetails!
                                                    .profilePicture!
                                                    .toString(),
                                            propertydata
                                                .tenantdetails!.firstName!
                                                .toString(),
                                            propertydata
                                                .tenantdetails!.lastName!
                                                .toString(),
                                            propertydata
                                                .tenantdetails!.phoneNumber!
                                                .toString(),
                                            propertydata.tenantdetails!.email!
                                                .toString(),
                                          ),
                                          const SizedBox(height: 15),
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
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
                                                  ? const TenantHistoryView()
                                                  : const HouseKeeperView(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const PropertyDetailsView(),
                                    const NearByAmenitiesView(),
                                    const PaymentView(),
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10),
                                          CupertinoButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              Get.to(() => AddExpensePage(
                                                    propertyId: propertydata.id,
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
                                                  "+ Add Expenses",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontFamily:
                                                          kCircularStdNormal,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const ExpenseView()
                                        ],
                                      ),
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
      }),
    );
  }

  otheractivities(String title, subtitle, IconData icons) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icons,
            size: 25,
            color: kButtonColor,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 17,
                    fontFamily: kCircularStdMedium),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 12,
                    fontFamily: kCircularStdNormal),
              ),
            ],
          ),
        ],
      ),
    );
  }

  tenantname(String? image, firstname, lastname, phoneno, email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                image != "null"
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          image!,
                          fit: BoxFit.cover,
                          height: 65,
                          width: 65,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/images/blank_profile.png",
                              fit: BoxFit.cover,
                              height: 65,
                              width: 65,
                            );
                          },
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/blank_profile.png",
                          fit: BoxFit.cover,
                          height: 65,
                          width: 65,
                        ),
                      ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedRoll == "tenant"
                          ? "$firstname $lastname"
                          : "$firstname $lastname",
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                          fontFamily: kCircularStdMedium),
                    ),
                    phoneno != "null"
                        ? Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                size: 15,
                                color: kButtonColor,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                phoneno,
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 13,
                                    fontFamily: kCircularStdNormal),
                              ),
                            ],
                          )
                        : Container(),
                    Row(
                      children: [
                        const Icon(
                          Icons.email,
                          size: 15,
                          color: kButtonColor,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          email,
                          style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 13,
                              fontFamily: kCircularStdNormal),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            selectedRoll == "tenant"
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kButtonColor),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "Extend",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 11,
                                  fontFamily: kCircularStdNormal),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kButtonColor),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "Terminate",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 11,
                                  fontFamily: kCircularStdNormal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Monthly rent",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdNormal),
                ),
                Text(
                  "\$2540 / month",
                  style: TextStyle(
                      color: kSecondaryPrimaryColor,
                      fontSize: 12,
                      fontFamily: kCircularStdBook),
                ),
              ],
            ),
            Image.asset(
              "assets/icons/line_vertical.png",
              fit: BoxFit.cover,
              scale: 1.9,
              color: kSecondaryColor,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Deposit",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdNormal),
                ),
                Text(
                  "\$1800",
                  style: TextStyle(
                      color: kSecondaryPrimaryColor,
                      fontSize: 12,
                      fontFamily: kCircularStdBook),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
