import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:country_list_pick/country_list_pick.dart';

import '../../../config/constant/constant.dart';
import '../../models/getall_tenant_model.dart';
import '../../routes/app_pages.dart';
import '../../services/tenant_service.dart';
import '../widgets/custom_textfield.dart';
import '../../controller/tenants_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class InviteTenantPage extends StatefulWidget {
  const InviteTenantPage({super.key});

  @override
  State<InviteTenantPage> createState() => _InviteTenantPageState();
}

class _InviteTenantPageState extends State<InviteTenantPage> {
  bool isFormSubmitted = false;
  final RxString mobileno = ''.obs;
  String selectedCountrydialCode = "+91";
  final TextEditingController mobilenoController = TextEditingController();
  final GetAllTenantController getAllTenantController =
      Get.put(GetAllTenantController());
  String image = "", address = "", name = "";
  TenantService tenantService = TenantService();
  var selectedTenant;

  @override
  void initState() {
    super.initState();
    mobilenoController.addListener(() {
      mobileno.value = mobilenoController.text;
    });
    var propertydata = getStorage.read('NotLeaseProperty');
    var property = jsonDecode(propertydata);
    setState(() {
      image = property['images'][0];
      name = property['Hostdetails']['first_name'] +
          " " +
          property['Hostdetails']['last_name'];
      address = property['name'];
      // tenantService.propertyid = property['id'];
    });
  }

  void handleTenantSelection(GetAllTenantDataModel data) {
    setState(() {
      selectedTenant = data;
      tenantService.email.value = selectedTenant.email.toString();
      tenantService.phoneno.value = selectedTenant.phoneNumber.toString();
      tenantService.tenantId.value = selectedTenant.id.toString();
    });
  }

  @override
  void dispose() {
    mobilenoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Invite Tenant",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        backgroundColor: kBackGroundColor,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        scale: 1.2,
                        height: 55,
                        width: 55,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            "assets/images/samplehouse.jpeg",
                            fit: BoxFit.cover,
                            scale: 1.2,
                            height: 55,
                            width: 55,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.home,
                              size: 16,
                              color: kButtonColor,
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: Get.width / 1.7,
                              child: Text(
                                address,
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                    fontFamily: kCircularStdMedium),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                name,
                                style: const TextStyle(
                                    color: kSecondaryPrimaryColor,
                                    fontSize: 13,
                                    fontFamily: kCircularStdBold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width > 500 ? 600 : Get.width,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: kBackGroundColor,
                              border: Border.all(color: kSecondaryPrimaryColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: CountryListPick(
                            theme: CountryTheme(
                              isShowFlag: false,
                              isShowTitle: false,
                              isShowCode: true,
                              isDownIcon: false,
                              showEnglishName: true,
                            ),
                            initialSelection: 'IN',
                            onChanged: (CountryCode? code) {
                              setState(() {
                                selectedCountrydialCode =
                                    code!.dialCode.toString();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                hintText: 'PhoneNo',
                                maxLines: 1,
                                ctrl: mobilenoController,
                                keyboardType: TextInputType.phone,
                                name: "phoneno",
                                formSubmitted: isFormSubmitted,
                                validationMsg: "Enter Phone no.",
                                onChanged: (value) {
                                  getAllTenantController.searchText(value);
                                  setState(() {
                                    mobileno.value = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                mobileno.isNotEmpty
                    ? selectedTenant != null
                        ? Container(
                            height: 75,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: kBackGroundColor,
                              border: Border.all(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        searchresult(
                                          selectedTenant.profilePicture
                                              .toString(),
                                          selectedTenant.firstName,
                                          selectedTenant.phoneNumber,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedTenant = null;
                                              });
                                            },
                                            icon: const Icon(Icons.remove))
                                      ],
                                    )
                                  ],
                                )),
                          )
                        : Container(
                            height: 250,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: kBackGroundColor,
                              border: Border.all(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Obx(
                              () {
                                if (getAllTenantController.isLoading.value) {
                                  return Container(
                                    color: kBackGroundColor,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: kSelectedIconColor,
                                      ),
                                    ),
                                  );
                                } else {
                                  // ignore: unnecessary_null_comparison
                                  if (getAllTenantController
                                          .tenantssList[0].data! !=
                                      null) {
                                    if (getAllTenantController
                                        .tenantssList[0].data!.isEmpty) {
                                      return Center(
                                        child: SizedBox(
                                          width: Get.width - 80,
                                          child: const Text(
                                            "No Tenants",
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
                                        scrollDirection: Axis.vertical,
                                        itemCount: getAllTenantController
                                            .tenantssList[0].data!.length,
                                        itemBuilder: (context, index) {
                                          var tenantData =
                                              getAllTenantController
                                                  .tenantssList[0].data!;
                                          if (tenantData.isNotEmpty) {
                                            var data = tenantData[index];
                                            return CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {
                                                handleTenantSelection(data);
                                              },
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 10),
                                                    child: Column(
                                                      children: [
                                                        searchresult(
                                                            data.profilePicture
                                                                .toString(),
                                                            data.firstName,
                                                            data.phoneNumber),
                                                      ],
                                                    )),
                                              ),
                                            );
                                          } else {
                                            return const Center(
                                              child: Text(
                                                "No Tenants",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 15,
                                                    fontFamily:
                                                        kCircularStdMedium),
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    }
                                  } else {
                                    return const Center(
                                      child: Text(
                                        "No Tenants",
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
                          )
                    : Container(),
                const SizedBox(height: 10),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    mobileno.isNotEmpty && selectedTenant != null
                        ? Get.toNamed(Routes.inviteTenantDetailPage)
                        : Container();
                  },
                  child: Container(
                    height: 45,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: kWhiteColor),
                        color: kButtonColor),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: kWhiteColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  searchresult(String image, name, number) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            scale: 1.2,
            height: 50,
            width: 50,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/blank_profile.png",
                fit: BoxFit.cover,
                scale: 1.2,
                height: 50,
                width: 50,
              );
            },
          ),
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            SizedBox(
              width: Get.width - 220,
              child: Text(
                name,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 17,
                    fontFamily: kCircularStdMedium),
              ),
            ),
            SizedBox(
              width: Get.width - 220,
              child: Text(
                number,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 13,
                    fontFamily: kCircularStdBook),
              ),
            ),
          ],
        )
      ],
    );
  }
}
