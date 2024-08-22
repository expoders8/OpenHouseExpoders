import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/constant.dart';
import '../../view/lease_property_view.dart';
import '../../view/not_lease_property_view.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../view/previous_property_view.dart';

class PropertyPage extends StatefulWidget {
  const PropertyPage({
    super.key,
  });

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var searchController = TextEditingController();

  String selectedRoll = "";

  @override
  void initState() {
    super.initState();
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
    });
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
          selectedRoll == "tenant" ? "On Lease Properties" : "My Properties",
          style: const TextStyle(fontFamily: kCircularStdBook),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kBackGroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: selectedRoll == "tenant"
              ? Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      indicatorColor: kButtonColor,
                      labelColor: kPrimaryColor,
                      tabs: const [
                        Tab(text: 'Current Properties'),
                        Tab(text: 'Previous Properties'),
                      ],
                    ),
                    Flexible(
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
                                LeasePropertyView(),
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
                              const PreviousPropertyView(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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
                    Flexible(
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
                                LeasePropertyView(),
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
