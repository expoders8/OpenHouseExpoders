import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:openhome/app/routes/app_pages.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../view/lease_property_view.dart';
import '../../view/not_lease_property_view.dart';

class PropertyPage extends StatefulWidget {
  final String? checkRoll;
  const PropertyPage({super.key, this.checkRoll});

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(
          widget.checkRoll == "tenant"
              ? "On Lease Properties"
              : "My Properties",
          style: const TextStyle(fontFamily: kCircularStdBook),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kBackGroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: widget.checkRoll == "tenant"
              ? GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(13, 0, 10, 0),
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: kWhiteColor,
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                              color: kSecondaryPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(color: kWhiteColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(color: kWhiteColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(color: kWhiteColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      LeasePropertyView(checkRoll: widget.checkRoll),
                    ],
                  ),
                )
              : Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      indicatorColor: kButtonColor,
                      labelColor: kPrimaryColor,
                      tabs: const [
                        Tab(text: 'On lease'),
                        Tab(text: 'Not lease'),
                      ],
                    ),
                    SizedBox(
                      height: Get.height - 132,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(13, 0, 10, 0),
                                    prefixIcon: const Icon(Icons.search),
                                    filled: true,
                                    fillColor: kWhiteColor,
                                    hintText: 'Search',
                                    hintStyle: const TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontFamily: kCircularStdNormal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:
                                          const BorderSide(color: kWhiteColor),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:
                                          const BorderSide(color: kWhiteColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:
                                          const BorderSide(color: kWhiteColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                LeasePropertyView(checkRoll: widget.checkRoll),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: searchController,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(13, 0, 10, 0),
                                  prefixIcon: const Icon(Icons.search),
                                  filled: true,
                                  fillColor: kWhiteColor,
                                  hintText: 'Search',
                                  hintStyle: const TextStyle(
                                      color: kSecondaryPrimaryColor,
                                      fontFamily: kCircularStdNormal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide:
                                        const BorderSide(color: kWhiteColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide:
                                        const BorderSide(color: kWhiteColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide:
                                        const BorderSide(color: kWhiteColor),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const NotLeasePropertyView(),
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
