import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:openhome/app/routes/app_pages.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../view/lease_property_view.dart';
import '../../view/not_lease_property_view.dart';

class PropertyPage extends StatefulWidget {
  const PropertyPage({super.key});

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Text(
            "My Properties",
            style: TextStyle(fontFamily: kCircularStdBook),
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: kButtonColor,
            labelColor: kPrimaryColor,
            tabs: const [
              Tab(text: 'On lease'),
              Tab(text: 'Not lease'),
            ],
          ),
          backgroundColor: kBackGroundColor,
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          labelStyle: TextStyle(color: kPrimaryColor),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                              width: 1,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                              width: 1,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kButtonColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const LeasePropertyView(),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Column(
                  children: [
                    TextFormField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        labelStyle: TextStyle(color: kPrimaryColor),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                            width: 1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                            width: 1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kButtonColor,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const NotLeasePropertyView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
