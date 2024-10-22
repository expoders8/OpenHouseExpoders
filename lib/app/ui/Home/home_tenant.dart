import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../routes/app_pages.dart';
import '../../services/tenant_service.dart';
import '../../controller/tab_controller.dart';
import '../../services/checkout_service.dart';
import '../../services/requests_service.dart';
import '../../models/firebase_user_model.dart';
import '../../models/tenant_lending_model.dart';
import '../../../config/constant/constant.dart';
import '../../services/properties_service.dart';
import '../../controller/payment_controller.dart';
import '../../controller/property_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../../config/provider/loader_provider.dart';
import '../../controller/host_homepage_controller.dart';
import '../../controller/property_detail_controller.dart';
import '../Property Details/Tenant/tenant_lease_property.dart';

class HomeTenantPage extends StatefulWidget {
  const HomeTenantPage({super.key});

  @override
  State<HomeTenantPage> createState() => _HomeTenantPageState();
}

class _HomeTenantPageState extends State<HomeTenantPage> {
  String userImage = "",
      firstName = "",
      lastName = "",
      firstlater = "",
      lastlatter = "",
      selectedRoll = "";

  TenantService tenantService = TenantService();
  final tabController = Get.put(TabCountController());
  CheckoutService checkoutService = CheckoutService();
  RequestsService requestsService = RequestsService();
  PropertiesService propertiesService = PropertiesService();

  var userCollection = FirebaseFirestore.instance.collection("Users");

  final PropertyCheckoutController propertyCheckoutController =
      Get.put(PropertyCheckoutController());
  final GetAllTenantHomeDataController getAllTenantHomeDataController =
      Get.put(GetAllTenantHomeDataController());
  final GetCurrentDetailsPropertiesController
      getCurrentDetailsPropertiesController =
      Get.put(GetCurrentDetailsPropertiesController());
  final GetAllPaymentDataController getAllPaymentDataController =
      Get.put(GetAllPaymentDataController());

  IconData getIconFromString(String? iconName) {
    switch (iconName) {
      case 'Remove Personal Belongings':
        return Icons.inventory;
      case 'Check for Damages':
        return Icons.warning;
      case 'Return Keys':
        return Icons.key;
      case 'Swimming Pool':
        return Icons.pool;
      case 'Pay Outstanding Bills':
        return Icons.description;
      case 'Clean Room':
        return Icons.cleaning_services;
      case 'Electricity':
        return Icons.flash_on;
      case 'Comment':
        return Icons.comment;
      default:
        return Icons.help;
    }
  }

  @override
  void initState() {
    getAllTenantHomeDataController.getAllTenantHomePageData();
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
      // userImage = userData["profile_picture"] ?? "";
      firstName = userData['first_name'] ?? "";
      lastName = userData['last_name'] ?? "";
      firstlater = firstName[0];
      lastlatter = lastName[0];
    }
    getUserFirebaseDatabase();
  }

  Stream<List<FirebaseUser>> getAppUser() {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);
    return userCollection
        .where('uid', isEqualTo: getUserData['id'].toString())
        .snapshots()
        .map((event) =>
            event.docs.map((e) => FirebaseUser.fromJson(e.data())).toList());
  }

  getUserFirebaseDatabase() async {
    var userStream = getAppUser();
    userStream.listen((users) {
      if (users.isNotEmpty) {
        setState(() {
          userImage = users.first.image.toString(); //
        });
      }
    });
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
      body: SafeArea(
        child: Obx(
          () {
            if (getAllTenantHomeDataController.isLoading.value) {
              return Container(
                color: kBackGroundColor,
                child: const Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                ),
              );
            } else {
              if (getAllTenantHomeDataController.dataList.isNotEmpty) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    var requestData =
                        getAllTenantHomeDataController.dataList[0].data!;
                    var data = requestData;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          "Invitations",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontFamily: kCircularStdMedium),
                        ),
                        const SizedBox(height: 10),
                        buildTenantinvitation(data.invitationData),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "My Requests",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                  fontFamily: kCircularStdMedium),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                Get.toNamed(Routes.myRequestViewAllView);
                              },
                              child: const Text(
                                "View all",
                                style: TextStyle(
                                    color: kBlueColor,
                                    fontSize: 13,
                                    fontFamily: kCircularStdMedium),
                              ),
                            ),
                          ],
                        ),
                        buildTenantrequest(data.tenantRequest),
                        const SizedBox(height: 10),
                        const Text(
                          "Current property",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontFamily: kCircularStdMedium),
                        ),
                        const SizedBox(height: 10),
                        buildTenantProperty(data.propertiesData!),
                        const SizedBox(height: 90),
                      ],
                    );
                  },
                );
              } else {
                return SizedBox(
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
                          icon: Icons.build,
                          name: 'Tenant Service\nRequest',
                        ),
                        ResponsiveContainer(
                          icon: Icons.logout,
                          name: "Checkout Requests",
                        ),
                        ResponsiveContainer(
                          icon: Icons.insert_invitation_rounded,
                          name: "Property Invitations",
                        ),
                        ResponsiveContainer(
                          icon: Icons.bungalow_outlined,
                          name: "Check-In as\nRepeat Tenants",
                        ),
                        ResponsiveContainer(
                          icon: Icons.chat,
                          name: "Chat with Host",
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }

  Widget buildTenantinvitation(List<InvitationData>? checkOut) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: checkOut!.map((rentalsData) {
        DateTime dateTime = DateTime.parse(rentalsData.endDate.toString());
        String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: Get.width,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "You have received an invitation from",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14,
                      fontFamily: kCircularStdNormal),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width / 1.2,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "${rentalsData.firstName.toString()} ${rentalsData.lastName.toString()} ",
                              style: const TextStyle(
                                color: kRedColor,
                                fontSize: 14,
                                fontFamily: kCircularStdNormal,
                              ),
                            ),
                            const TextSpan(
                              text: "for ",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14,
                                fontFamily: kCircularStdNormal,
                              ),
                            ),
                            TextSpan(
                              text: rentalsData.address.toString(),
                              style: const TextStyle(
                                color: kRedColor,
                                fontSize: 14,
                                fontFamily: kCircularStdNormal,
                                decoration: TextDecoration.underline,
                                decorationColor: kRedColor,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "End On $formattedDate",
                      style: const TextStyle(
                          color: kGreyColor,
                          fontSize: 13,
                          fontFamily: kCircularStdNormal),
                    ),
                    Row(
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            LoaderX.show(context, 60.0, 60.0);
                            propertiesService.bookProperties(
                                rentalsData.propertyId.toString(),
                                rentalsData.id.toString());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: kGreenColor, width: 1),
                                borderRadius: BorderRadius.circular(25)),
                            child: const Icon(
                              Icons.check,
                              color: kGreenColor,
                              size: 19,
                            ),
                          ),
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            invitationDialog11(rentalsData.id.toString());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFFFF1100), width: 1),
                                borderRadius: BorderRadius.circular(25)),
                            child: const Icon(
                              Icons.close,
                              color: Color(0xFFFF1100),
                              size: 19,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget buildTenantProperty(PropertiesData rentalsData) {
    propertyCheckoutController.propertyId(rentalsData.propertyId);
    propertyCheckoutController.rentalId(rentalsData.id);
    propertyCheckoutController.proeprtyAddress(rentalsData.address);
    propertyCheckoutController.propertyName(rentalsData.name);
    propertyCheckoutController.rentAmount(rentalsData.rentAmount);
    DateTime? dateTime =
        DateTime.parse(rentalsData.endDate.toString()).toLocal();
    String? formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return Column(
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            getCurrentDetailsPropertiesController
                .propertyId(rentalsData.propertyId);
            getAllPaymentDataController
                .rentAmount(rentalsData.rentAmount.toString());
            getAllPaymentDataController.propertyId(rentalsData.id.toString());

            Get.to(() => const TenantLeasePropertyDetailPage());
            getCurrentDetailsPropertiesController.fetchPropertyDetail();
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
                        child: Image.network(
                          rentalsData.propertyImage.toString(),
                          fit: BoxFit.cover,
                          scale: 1.2,
                          height: 110,
                          width: 110,
                          errorBuilder: (context, error, stackTrace) {
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width - 170,
                            child: Text(
                              rentalsData.name.toString(),
                              style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 17,
                                  fontFamily: kCircularStdMedium),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(
                                Icons.request_page_sharp,
                                size: 16,
                                color: kButtonColor,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "\$ ${rentalsData.rentAmount.toString()}",
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: kPrimaryColor,
                                    fontSize: 17,
                                    fontFamily: kCircularStdMedium),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: rentalsData.address.toString() == "null"
                                  ? 0
                                  : 5),
                          rentalsData.address.toString() == "null"
                              ? Container()
                              : Row(
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
                                        rentalsData.address.toString(),
                                        style: const TextStyle(
                                            color: kSecondaryPrimaryColor,
                                            fontSize: 13,
                                            fontFamily: kCircularStdMedium),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                          const SizedBox(height: 5),
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
                                  rentalsData.person.toString(),
                                  style: const TextStyle(
                                      color: kSecondaryPrimaryColor,
                                      fontSize: 13,
                                      fontFamily: kCircularStdBold),
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
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 10, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Balance Due",
                              style: TextStyle(
                                  fontFamily: kCircularStdNormal,
                                  fontSize: 12,
                                  color: kPrimaryColor),
                            ),
                            Text(
                              "\$1500",
                              style: TextStyle(
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
                              rentalsData.rentAmountUnit.toString() == "null"
                                  ? "\$0"
                                  : rentalsData.rentAmountUnit.toString(),
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
                              "Lease expiry",
                              style: TextStyle(
                                  fontFamily: kCircularStdNormal,
                                  fontSize: 12,
                                  color: kPrimaryColor),
                            ),
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 17,
                                  color: kPrimaryColor),
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
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  invitationDialog11(String id) async {
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
              LoaderX.show(context, 60.0, 60.0);
              tenantService.deleteInvitations(id);
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

  Widget buildTenantrequest(List<TenantRequest>? tenantRequest) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tenantRequest!.map((rentalsData) {
          DateTime? dateTime =
              DateTime.parse(rentalsData.startDate!.toString());
          String? formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  width: Get.width - 150,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rentalsData.title
                                  .toString()
                                  .substring(0, 1)
                                  .toUpperCase() +
                              rentalsData.title.toString().substring(1),
                          style: const TextStyle(
                              fontFamily: kCircularStdMedium,
                              fontSize: 18,
                              color: kPrimaryColor),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.arrow_forward_rounded,
                              size: 16,
                              color: kButtonColor,
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: Get.width - 220,
                              child: Text(
                                rentalsData.description.toString(),
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 13,
                                    fontFamily: kCircularStdBold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        rentalsData.address.toString() != "null"
                            ? Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 16,
                                    color: kButtonColor,
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: Get.width - 120,
                                    child: Text(
                                      rentalsData.address.toString(),
                                      style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 12,
                                          fontFamily: kCircularStdNormal),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                        const SizedBox(height: 5),
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
                                rentalsData.username.toString(),
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 13,
                                    fontFamily: kCircularStdNormal),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.date_range_outlined,
                              size: 16,
                              color: kButtonColor,
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: Get.width - 220,
                              child: Text(
                                formattedDate,
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 13,
                                    fontFamily: kCircularStdNormal),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        rentalsData.status.toString() == "Resolved"
                            ? Container(
                                width: 75,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: kGreenColor),
                                child: const Row(
                                  children: [
                                    Text(
                                      "resolve",
                                      style: TextStyle(
                                          color: kWhiteColor,
                                          fontSize: 13,
                                          fontFamily: kCircularStdNormal),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.thumb_up,
                                      size: 11,
                                      color: kWhiteColor,
                                    ),
                                  ],
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: rentalsData.status.toString() !=
                                                "Pending"
                                            ? kGreenColor
                                            : kRedColor),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time,
                                          size: 12,
                                          color: kWhiteColor,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          rentalsData.status.toString(),
                                          style: const TextStyle(
                                              color: kWhiteColor,
                                              fontSize: 10,
                                              fontFamily: kCircularStdMedium),
                                        ),
                                      ],
                                    ),
                                  ),
                                  rentalsData.type.toString() != "normal"
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 3),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: kButtonColor),
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.warning,
                                                size: 11,
                                                color: kWhiteColor,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "Emergency",
                                                style: TextStyle(
                                                    color: kWhiteColor,
                                                    fontSize: 9,
                                                    fontFamily:
                                                        kCircularStdNormal),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
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

  invitationDialog(String id, name, address) async {
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
              LoaderX.show(context, 60.0, 60.0);
              checkoutService.notAcceptCheckoutInvitation(id, name, address);
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
}

class ResponsiveGridView extends StatelessWidget {
  const ResponsiveGridView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int gridColumns;
    if (screenWidth <= 600) {
      gridColumns = 2;
    } else if (screenWidth <= 900) {
      gridColumns = 3;
    } else {
      gridColumns = 4;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridColumns,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ResponsiveContainer(
              icon: Icons.home,
              name: 'Item $index',
            );
          },
        ),
      ),
    );
  }
}

class ResponsiveContainer extends StatelessWidget {
  final IconData icon;
  final String name;

  const ResponsiveContainer(
      {super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    final tabController = Get.put(TabCountController());
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        if (name == "Manage All\nYour Properties") {
          tabController.changeTabIndex(1);
        } else if (name == "Manage Tenants' Service Requests") {
          Get.toNamed(Routes.tenantRequestAllView);
        } else if (name == "Track Check-Out Requests") {
          Get.toNamed(Routes.checkoutRequestsPage);
        } else if (name == "Tenant Service\nRequest") {
          Get.toNamed(Routes.myRequestViewAllView);
        } else if (name == "Property Invitations") {
          Get.toNamed(Routes.invitationshowPage);
        } else if (name == "Track Lease\nExtensions") {
          Get.toNamed(Routes.trackLeaseExtensionPage);
        } else if (name == "Track Property\nExpenses") {
          Get.toNamed(Routes.trackLeaseExpensesPage);
        } else if (name == "Track Property\nIncome") {
          Get.toNamed(Routes.trackPropertyIncomePage);
        } else if (name == "Chat with Host") {
          Get.toNamed(Routes.messagePage);
        } else if (name == "Chat with Tenants") {
          Get.toNamed(Routes.messagePage);
        } else if (name == "Checkout Requests") {
          Get.toNamed(Routes.checkoutRequestsTenantPage);
        }
      },
      child: Card(
        elevation: 5,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: kButtonColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 31,
                color: kButtonColor,
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: kCircularStdMedium,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
