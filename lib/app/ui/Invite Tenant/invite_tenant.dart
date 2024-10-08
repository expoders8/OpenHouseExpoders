import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../routes/app_pages.dart';
import '../../services/tenant_service.dart';
import '../../models/getall_tenant_model.dart';
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
  bool withEmail = true;
  String selectedCountrydialCode = "+91";
  final TextEditingController mobilenoController = TextEditingController();
  final GetAllTenantController getAllTenantController =
      Get.put(GetAllTenantController());
  final TextEditingController tenantController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                        getAllTenantController.propertyImage.value,
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
                                getAllTenantController.propertyAddress.value,
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
                                getAllTenantController.propertyName.value,
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
                withEmail == true
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: TypeAheadField<GetAllTenantDataModel>(
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: emailController,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'^ ')),
                              ],
                              decoration: InputDecoration(
                                fillColor: kWhiteColor,
                                filled: true,
                                hintText: "Email",
                                contentPadding:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                hintStyle: const TextStyle(
                                  fontFamily: kCircularStdBook,
                                  fontWeight: FontWeight.w400,
                                  color: kPrimaryColor,
                                  fontSize: 14,
                                ),
                                hintMaxLines: 1,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: kWhiteColor, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  borderSide: const BorderSide(
                                      color: kWhiteColor, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  borderSide: const BorderSide(
                                    color: kWhiteColor,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: kWhiteColor, width: 1.0),
                                ),
                                errorText: isFormSubmitted &&
                                        emailController.text.isEmpty
                                    ? 'Please select a Tenants'
                                    : null,
                              ),
                              style: const TextStyle(
                                fontFamily: kCircularStdBook,
                                fontWeight: FontWeight.w400,
                                color: kPrimaryColor,
                                fontSize: 14,
                              ),
                              autocorrect: true,
                              cursorColor: kPrimaryColor,
                            ),
                            noItemsFoundBuilder: (context) => const SizedBox(
                                  child: Center(
                                    child: Text('No Tenants found'),
                                  ),
                                ),
                            suggestionsCallback: (pattern) async {
                              final tenants = await TenantService.getallTenant(
                                  true, pattern);
                              return tenants;
                            },
                            itemBuilder:
                                (context, GetAllTenantDataModel? suggestion) {
                              return ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    suggestion!.profilePicture.toString(),
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        "assets/images/blank_profile.png",
                                        fit: BoxFit.cover,
                                        height: 50.0,
                                        width: 50.0,
                                      );
                                    },
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: kPrimaryColor,
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                subtitle: Text(suggestion.email.toString()),
                                title: Text(
                                    "${suggestion.firstName.toString()} ${suggestion.lastName.toString()}"),
                              );
                            },
                            onSuggestionSelected:
                                (GetAllTenantDataModel? suggestion) {
                              setState(() {
                                getAllTenantController.email(suggestion!.email);
                                getAllTenantController
                                    .phoneNo(suggestion.phoneNumber);
                                getAllTenantController.tenantId(suggestion.id);
                              });
                              Get.toNamed(Routes.inviteTenantDetailPage);
                            }),
                      )
                    : IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(0)),
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
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                child: TypeAheadField<GetAllTenantDataModel>(
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                      keyboardType: TextInputType.number,
                                      controller: tenantController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'^ ')),
                                      ],
                                      decoration: InputDecoration(
                                        fillColor: kWhiteColor,
                                        filled: true,
                                        hintText: "PhoneNo",
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                15, 15, 15, 0),
                                        hintStyle: const TextStyle(
                                          fontFamily: kCircularStdBook,
                                          fontWeight: FontWeight.w400,
                                          color: kPrimaryColor,
                                          fontSize: 14,
                                        ),
                                        hintMaxLines: 1,
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: kWhiteColor, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          borderSide: const BorderSide(
                                              color: kWhiteColor, width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          borderSide: const BorderSide(
                                            color: kWhiteColor,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                              color: kWhiteColor, width: 1.0),
                                        ),
                                        errorText: isFormSubmitted &&
                                                tenantController.text.isEmpty
                                            ? 'Please select a Tenants'
                                            : null,
                                      ),
                                      style: const TextStyle(
                                        fontFamily: kCircularStdBook,
                                        fontWeight: FontWeight.w400,
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                      ),
                                      autocorrect: true,
                                      cursorColor: kPrimaryColor,
                                    ),
                                    noItemsFoundBuilder: (context) =>
                                        const SizedBox(
                                          child: Center(
                                            child: Text('No Tenants found'),
                                          ),
                                        ),
                                    suggestionsCallback: (pattern) async {
                                      final tenants =
                                          await TenantService.getallTenant(
                                              false, pattern);
                                      return tenants;
                                    },
                                    itemBuilder: (context,
                                        GetAllTenantDataModel? suggestion) {
                                      return ListTile(
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.network(
                                            suggestion!.profilePicture
                                                .toString(),
                                            width: 50.0,
                                            height: 50.0,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                "assets/images/blank_profile.png",
                                                fit: BoxFit.cover,
                                                height: 50.0,
                                                width: 50.0,
                                              );
                                            },
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: kPrimaryColor,
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        subtitle: Text(
                                            suggestion.phoneNumber.toString()),
                                        title: Text(
                                            "${suggestion.firstName.toString()} ${suggestion.lastName.toString()}"),
                                      );
                                    },
                                    // transitionBuilder:
                                    //     (context, suggestionsBox, controller) {
                                    //   return suggestionsBox;
                                    // },
                                    onSuggestionSelected:
                                        (GetAllTenantDataModel? suggestion) {
                                      setState(() {
                                        getAllTenantController
                                            .email(suggestion!.email);
                                        getAllTenantController.phoneNo(
                                            "$selectedCountrydialCode${suggestion.phoneNumber}");
                                        getAllTenantController
                                            .tenantId(suggestion.id);
                                      });
                                      Get.toNamed(
                                          Routes.inviteTenantDetailPage);
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    withEmail == true
                        ? TextButton(
                            onPressed: () {
                              setState(() {
                                withEmail = false;
                              });
                            },
                            child: const Text(
                              "Using Phone no.",
                              style: TextStyle(
                                fontSize: 15,
                                color: kBlueColor,
                                fontFamily: kCircularStdBook,
                                decoration: TextDecoration.underline,
                                decorationColor: kRedAccentColor,
                              ),
                            ))
                        : TextButton(
                            onPressed: () {
                              setState(() {
                                withEmail = true;
                              });
                            },
                            child: const Text(
                              "Using Email.",
                              style: TextStyle(
                                fontSize: 15,
                                color: kBlueColor,
                                fontFamily: kCircularStdBook,
                                decoration: TextDecoration.underline,
                                decorationColor: kRedAccentColor,
                              ),
                            ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
