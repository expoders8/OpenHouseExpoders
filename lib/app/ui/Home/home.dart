import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../controller/property_controller.dart';
import '../../controller/property_detail_controller.dart';
import '../../view/home_view.dart';
import '../../view/my_request.dart';
import '../../routes/app_pages.dart';
import '../../controller/tab_controller.dart';
import '../../../config/constant/constant.dart';
import '../../view/tenant_invitation_view.dart';
import '../../controller/request_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../Property Details/Tenant/tenant_lease_property.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedRoll = "";
  final tabController = Get.put(TabCountController());
  final GetAllRequestsController getAllRequestsController =
      Get.put(GetAllRequestsController());
  final GetCurrentPropertyController getCurrentPropertyController =
      Get.put(GetCurrentPropertyController());
  final GetCurrentDetailsPropertiesController
      getCurrentDetailsPropertiesController =
      Get.put(GetCurrentDetailsPropertiesController());
  String userImage = "",
      authToken = "",
      firstName = "",
      lastName = "",
      firstlater = "",
      lastlatter = "";
  @override
  void initState() {
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
    });
    getuser();
    super.initState();
  }

  getuser() {
    var user = getStorage.read('user');
    var userData = jsonDecode(user);
    if (userData != null) {
      userImage = userData["profile_picture"] ?? "";
      firstName = userData['first_name'] ?? "";
      lastName = userData['last_name'] ?? "";
      firstlater = firstName[0];
      lastlatter = lastName[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "OpenHouse",
              style: TextStyle(fontFamily: kCircularStdBold, fontSize: 18),
            ),
            const SizedBox(width: 3),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: kButtonColor),
              child: Center(
                child: Text(
                  '${selectedRoll[0].toUpperCase()}${selectedRoll.substring(1)}',
                  style: const TextStyle(
                    color: kWhiteColor,
                    fontSize: 10,
                    fontFamily: kCircularStdNormal,
                  ),
                ),
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.toNamed(Routes.notificationPage);
            },
            child: Image.asset(
              "assets/icons/notification.png",
              fit: BoxFit.cover,
              height: 33,
              width: 33,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.toNamed(Routes.profilePage);
              },
              child: ClipOval(
                child: Material(
                    child: userImage != ""
                        ? Image.network(
                            userImage,
                            width: 30,
                            height: 30,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              "assets/images/blank_profile.png",
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return SizedBox(
                                width: 30,
                                height: 30,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: kPrimaryColor,
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            height: 36,
                            width: 36,
                            color: kTransparentColor,
                            child: Center(
                                child: Text(
                              "$firstlater$lastlatter".toUpperCase(),
                              style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                  fontFamily: kCircularStdNormal),
                            )),
                          )),
              ),
            ),
          ),
        ],
        backgroundColor: kBackGroundColor,
      ),
      body:
          //  getCurrentPropertyController.propertiesList.isEmpty ||
          //         getCurrentPropertyController.propertiesList[0].data!.isEmpty
          //     ? Column(
          //         children: [
          //           const SizedBox(height: 200),
          //           Image.asset(
          //             "assets/images/noproperty.png",
          //             scale: 4,
          //           ),
          //           const SizedBox(height: 10),
          //           const Text(
          //             "You have no current leases or requests. Waiting for an invitation? Check your email for host invitations or explore properties once added.",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: kPrimaryColor,
          //                 fontSize: 15,
          //                 fontFamily: kCircularStdMedium),
          //           ),
          //           CupertinoButton(
          //               child: Container(
          //                 padding: const EdgeInsets.all(5),
          //                 width: 200,
          //                 child: const Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Center(
          //                         child: Text(
          //                       "Start now",
          //                       style:
          //                           TextStyle(color: kPrimaryColor, fontSize: 18),
          //                     )),
          //                     SizedBox(width: 10),
          //                     Icon(
          //                       Icons.arrow_right_alt,
          //                       size: 35,
          //                       color: kPrimaryColor,
          //                     )
          //                   ],
          //                 ),
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(15),
          //                     border: Border.all(width: 1, color: kButtonColor)),
          //               ),
          //               onPressed: () {
          //                 tabController.changeTabIndex(1);
          //               }),
          //         ],
          //       )
          //     :
          SafeArea(
        child: SingleChildScrollView(
          child: selectedRoll == "tenant"
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const TenantInvitationView(),
                      const SizedBox(height: 10),
                      const Text(
                        "My Lease",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontFamily: kCircularStdMedium),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 210,
                        child: Obx(
                          () {
                            if (getCurrentPropertyController.isLoading.value) {
                              return Container(
                                color: kBackGroundColor,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: kSelectedIconColor,
                                  ),
                                ),
                              );
                            } else {
                              if (getCurrentPropertyController
                                  .propertiesList.isNotEmpty) {
                                if (getCurrentPropertyController
                                    .propertiesList[0].data!.isEmpty) {
                                  return Center(
                                    child: SizedBox(
                                      width: Get.width - 80,
                                      child: const Text(
                                        "No Property",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 15,
                                            fontFamily: kCircularStdMedium),
                                      ),
                                    ),
                                  );
                                } else {
                                  return ListView.builder(
                                    itemCount: getCurrentPropertyController
                                        .propertiesList[0].data!.length,
                                    itemBuilder: (context, index) {
                                      var propertyData =
                                          getCurrentPropertyController
                                              .propertiesList[0].data!;
                                      if (propertyData.isNotEmpty) {
                                        var data = propertyData[index];
                                        DateTime dateTime = DateTime.parse(
                                            data.endDate.toString());
                                        String formattedDate =
                                            DateFormat('dd MMM yyyy')
                                                .format(dateTime);
                                        return CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            getCurrentDetailsPropertiesController
                                                .propertyId(data.id);
                                            Get.to(() =>
                                                const TenantLeasePropertyDetailPage());
                                            getCurrentDetailsPropertiesController
                                                .fetchPropertyDetail();
                                          },
                                          child: Container(
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: kWhiteColor),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        child: Image.network(
                                                          data.propertyImage
                                                              .toString(),
                                                          fit: BoxFit.cover,
                                                          scale: 1.2,
                                                          height: 110,
                                                          width: 110,
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return Image.asset(
                                                              "assets/images/samplehouse.jpeg",
                                                              fit: BoxFit.cover,
                                                              height: 110,
                                                              width: 110,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                                Get.width - 170,
                                                            child: Text(
                                                              data.name
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  color:
                                                                      kPrimaryColor,
                                                                  fontSize: 17,
                                                                  fontFamily:
                                                                      kCircularStdMedium),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .request_page_sharp,
                                                                size: 16,
                                                                color:
                                                                    kButtonColor,
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                data.rentAmount
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    color:
                                                                        kPrimaryColor,
                                                                    fontSize:
                                                                        17,
                                                                    fontFamily:
                                                                        kCircularStdMedium),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height: data.address
                                                                          .toString() ==
                                                                      "null"
                                                                  ? 0
                                                                  : 5),
                                                          data.address.toString() ==
                                                                  "null"
                                                              ? Container()
                                                              : Row(
                                                                  children: [
                                                                    const Icon(
                                                                      Icons
                                                                          .location_on,
                                                                      size: 16,
                                                                      color:
                                                                          kButtonColor,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            10),
                                                                    SizedBox(
                                                                      width: Get
                                                                              .width /
                                                                          2.5,
                                                                      child:
                                                                          Text(
                                                                        data.address
                                                                            .toString(),
                                                                        style: const TextStyle(
                                                                            color:
                                                                                kSecondaryPrimaryColor,
                                                                            fontSize:
                                                                                13,
                                                                            fontFamily:
                                                                                kCircularStdMedium),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .bed_outlined,
                                                                size: 16,
                                                                color:
                                                                    kButtonColor,
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              SizedBox(
                                                                width:
                                                                    Get.width -
                                                                        220,
                                                                child: Text(
                                                                  data.person
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      color:
                                                                          kSecondaryPrimaryColor,
                                                                      fontSize:
                                                                          13,
                                                                      fontFamily:
                                                                          kCircularStdBold),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0,
                                                            right: 5.0,
                                                            top: 10,
                                                            bottom: 10.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        const Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Balance Due",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      kCircularStdNormal,
                                                                  fontSize: 12,
                                                                  color:
                                                                      kPrimaryColor),
                                                            ),
                                                            Text(
                                                              "\$1500",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      kCircularStdMedium,
                                                                  fontSize: 17,
                                                                  color:
                                                                      kPrimaryColor),
                                                            ),
                                                          ],
                                                        ),
                                                        Image.asset(
                                                          "assets/icons/line_vertical.png",
                                                          fit: BoxFit.cover,
                                                          scale: 1.8,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Text(
                                                              "Rent Due on",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      kCircularStdNormal,
                                                                  fontSize: 12,
                                                                  color:
                                                                      kPrimaryColor),
                                                            ),
                                                            Text(
                                                              data.rentAmountUnit
                                                                          .toString() ==
                                                                      "null"
                                                                  ? "\$0"
                                                                  : data
                                                                      .rentAmountUnit
                                                                      .toString(),
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      kCircularStdMedium,
                                                                  fontSize: 17,
                                                                  color:
                                                                      kPrimaryColor),
                                                            ),
                                                          ],
                                                        ),
                                                        Image.asset(
                                                          "assets/icons/line_vertical.png",
                                                          fit: BoxFit.cover,
                                                          scale: 1.8,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Text(
                                                              "Lease expairy",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      kCircularStdNormal,
                                                                  fontSize: 12,
                                                                  color:
                                                                      kPrimaryColor),
                                                            ),
                                                            Text(
                                                              formattedDate,
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      kCircularStdMedium,
                                                                  fontSize: 17,
                                                                  color:
                                                                      kPrimaryColor),
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
                                        );
                                      } else {
                                        return const Center(
                                          child: Text(
                                            "You have no current leases or requests. Waiting for an invitation? Check your email for host invitations or explore properties once added.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 15,
                                                fontFamily: kCircularStdMedium),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                }
                              } else {
                                return const Center(
                                  child: Text(
                                    "You have no current leases or requests. Waiting for an invitation? Check your email for host invitations or explore properties once added.",
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
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(
                        height: 235,
                        child: MyRequestView(),
                      ),
                      const SizedBox(height: 85)
                    ],
                  ),
                )
              : SizedBox(
                  height: Get.height - 85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 80),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 3.0,
                        childAspectRatio: 1,
                      ),
                      children: const [
                        ResponsiveContainer(
                          icon: Icons.home,
                          name: 'Manage All\nYour Properties',
                        ),
                        ResponsiveContainer(
                          icon: Icons.search,
                          name: "Track Available Properties",
                        ),
                        ResponsiveContainer(
                          icon: Icons.calendar_today,
                          name: 'Tracked Properties Under Lease',
                        ),
                        ResponsiveContainer(
                          icon: Icons.build,
                          name: "Manage Tenants' Service Requests",
                        ),
                        ResponsiveContainer(
                          icon: Icons.exit_to_app,
                          name: "Track Check-Out Requests",
                        ),
                        ResponsiveContainer(
                          icon: Icons.calendar_today,
                          name: "Track Lease\nExtensions",
                        ),
                        ResponsiveContainer(
                          icon: Icons.trending_up,
                          name: "Track Property\nIncome",
                        ),
                        ResponsiveContainer(
                          icon: Icons.trending_down,
                          name: "Track Property\nExpenses",
                        ),
                        ResponsiveContainer(
                          icon: Icons.cleaning_services,
                          name: "Assign Housekeepers\n",
                        ),
                      ],
                    ),
                  ),
                ),
          // : Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         const SizedBox(height: 10),
          //         const Text(
          //           "Checkout Requests",
          //           style: TextStyle(
          //               color: kPrimaryColor,
          //               fontSize: 16,
          //               fontFamily: kCircularStdMedium),
          //         ),
          //         const CheckOutRequestView(),
          //         const SizedBox(height: 10),
          //         const TenantRequestView(),
          //         const SizedBox(height: 10),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             const Text(
          //               "Lease Status",
          //               style: TextStyle(
          //                   color: kPrimaryColor,
          //                   fontSize: 16,
          //                   fontFamily: kCircularStdMedium),
          //             ),
          //             CupertinoButton(
          //               onPressed: () {
          //                 tabController.changeTabIndex(1);
          //               },
          //               child: const Text(
          //                 "View all",
          //                 style: TextStyle(
          //                     color: kBlueColor,
          //                     fontSize: 13,
          //                     fontFamily: kCircularStdMedium),
          //               ),
          //             ),
          //           ],
          //         ),
          //         leaseproperty(
          //             "assets/icons/1.png",
          //             "\$2550",
          //             "101 Main Street",
          //             "2",
          //             "Tenant Name",
          //             "\$15,200",
          //             "\$220",
          //             "12-06-2021"),
          //         const SizedBox(height: 85)
          //       ],
          //     ),
          //   ),
        ),
      ),
    );
  }

  invitationDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert !"),
        elevation: 5,
        titleTextStyle: const TextStyle(fontSize: 18, color: kRedColor),
        content: const Text("Are you sure want to reject?"),
        contentPadding: const EdgeInsets.only(left: 25, top: 10),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Get.back();
            },
            child: const Text(
              'Yes',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'No',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }

  leaseproperty(String image, price, address, person, tenantname, balancedue,
      rentdue, expiredate) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        // Get.to(() => const LeasePropertyDetailPage());
      },
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      scale: 1.2,
                      height: 120,
                      width: 120,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                            fontFamily: kCircularStdMedium),
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
                              address,
                              style: const TextStyle(
                                  color: kSecondaryPrimaryColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.bed_outlined,
                            size: 16,
                            color: kButtonColor,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: Get.width - 220,
                            child: Text(
                              person,
                              style: const TextStyle(
                                  color: kSecondaryPrimaryColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdBold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            size: 16,
                            color: kButtonColor,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: Get.width - 220,
                            child: Text(
                              tenantname,
                              style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 13,
                                  fontFamily: kCircularStdMedium),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 10, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Balance Due",
                          style: TextStyle(
                              fontFamily: kCircularStdNormal,
                              fontSize: 12,
                              color: kPrimaryColor),
                        ),
                        Text(
                          balancedue,
                          style: const TextStyle(
                              fontFamily: kCircularStdMedium,
                              fontSize: 17,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/icons/line_vertical.png",
                      fit: BoxFit.cover,
                      scale: 1.8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Rent Due on",
                          style: TextStyle(
                              fontFamily: kCircularStdNormal,
                              fontSize: 12,
                              color: kPrimaryColor),
                        ),
                        Text(
                          rentdue,
                          style: const TextStyle(
                              fontFamily: kCircularStdMedium,
                              fontSize: 17,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/icons/line_vertical.png",
                      fit: BoxFit.cover,
                      scale: 1.8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "lease Expiry ",
                          style: TextStyle(
                              fontFamily: kCircularStdNormal,
                              fontSize: 12,
                              color: kRedColor),
                        ),
                        Text(
                          expiredate,
                          style: const TextStyle(
                              fontFamily: kCircularStdMedium,
                              fontSize: 17,
                              color: kRedColor),
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
    );
  }
}
