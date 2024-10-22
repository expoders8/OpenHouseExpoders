import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../controller/tenants_controller.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';

class TenantHistoryView extends StatefulWidget {
  final String? propertyId;
  const TenantHistoryView({super.key, this.propertyId});

  @override
  State<TenantHistoryView> createState() => _TenantHistoryViewState();
}

class _TenantHistoryViewState extends State<TenantHistoryView> {
  DateTime? dateTime, dateTime1;
  String enddate = '', startdate = '';

  final GetAllPropertyPreviousTenantController
      getAllPropertyPreviousTenantController =
      Get.put(GetAllPropertyPreviousTenantController());

  @override
  void initState() {
    getAllPropertyPreviousTenantController
        .propertyId(widget.propertyId.toString());
    getAllPropertyPreviousTenantController.getAllTenants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (getAllPropertyPreviousTenantController.isLoading.value) {
          return Container();
        } else {
          if (getAllPropertyPreviousTenantController.requestList.isNotEmpty) {
            if (getAllPropertyPreviousTenantController
                .requestList[0].data!.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text(
                    "No Previous tenants",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontFamily: kCircularStdMedium),
                  ),
                ),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: getAllPropertyPreviousTenantController
                    .requestList[0].data!.length,
                itemBuilder: (context, index) {
                  var requestData = getAllPropertyPreviousTenantController
                      .requestList[0].data!;
                  if (requestData.isNotEmpty) {
                    var data = requestData[index];
                    if (data.tenantStartDate != null) {
                      dateTime =
                          DateTime.parse(data.tenantStartDate!.toString());
                      startdate = DateFormat('dd MMM yyyy').format(dateTime!);
                    } else {
                      startdate = 'No Date Available';
                    }
                    if (data.tenantStartDate != null) {
                      dateTime1 =
                          DateTime.parse(data.tenantEndDate!.toString());
                      enddate = DateFormat('dd MMM yyyy').format(dateTime1!);
                    } else {
                      startdate = 'No Date Available';
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Previous Tenants",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 17,
                                  fontFamily: kCircularStdMedium,
                                ),
                              ),
                              Divider(),
                              SizedBox(height: 5),
                            ],
                          ),
                        tenanthistory(
                            data.tenantProfilePicture.toString(),
                            "${data.tenantFirstName.toString()} ${data.tenantLastName.toString()}",
                            data.tenantPhoneNumber.toString(),
                            "$startdate to $enddate"),
                      ],
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Center(
                        child: Text(
                          "No Previous tenants",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                              fontFamily: kCircularStdMedium),
                        ),
                      ),
                    );
                  }
                },
              );
            }
          } else {
            return const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(
                child: Text(
                  "No Previous tenants",
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

  tenanthistory(String image, name, mobileNo, date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: 40,
                width: 40,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  "assets/images/blank_profile.png",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
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
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14,
                      fontFamily: kCircularStdMedium),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          size: 15,
                          color: kButtonColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          mobileNo,
                          style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 11,
                              fontFamily: kCircularStdNormal),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          size: 15,
                          color: kButtonColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          date,
                          style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 11,
                              fontFamily: kCircularStdNormal),
                        ),
                      ],
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
}
