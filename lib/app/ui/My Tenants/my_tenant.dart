import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';
import '../../view/current_tenants_view.dart';
import '../../view/previous_tenants_view.dart';
import '../../../config/constant/constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class MyTenantsPage extends StatefulWidget {
  const MyTenantsPage({super.key});

  @override
  State<MyTenantsPage> createState() => _MyTenantsPageState();
}

class _MyTenantsPageState extends State<MyTenantsPage>
    with SingleTickerProviderStateMixin {
  String selectedRoll = "";
  late TabController _tabController;
  var searchController = TextEditingController();

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
        toolbarHeight: 45,
        title: const Text(
          "My Tenants",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kBackGroundColor,
        actions: [
          selectedRoll == "tenant"
              ? Container()
              : GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.profilePage);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/icons/boy 1.png",
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        )),
                  ),
                ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorColor: kButtonColor,
                labelColor: kPrimaryColor,
                tabs: const [
                  Tab(text: 'Current Tenants'),
                  Tab(text: 'Previous Tenants'),
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
                          const CurrentTenantsView()
                        ],
                      ),
                    ),
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
                          const PreviousTenantsView()
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
    );
  }
}
