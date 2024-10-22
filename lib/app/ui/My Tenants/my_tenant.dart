import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../models/firebase_user_model.dart';
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

  String userImage = "",
      authToken = "",
      firstName = "",
      lastName = "",
      firstlater = "",
      lastlatter = "";
  var userCollection = FirebaseFirestore.instance.collection("Users");
  @override
  void initState() {
    super.initState();
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
    });
    getuser();
    _tabController = TabController(length: 2, vsync: this);
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
          userImage = users.first.image.toString();
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
      appBar: AppBar(
        toolbarHeight: 45,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Tenants",
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
        backgroundColor: kBackGroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.toNamed(Routes.profilePage);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                                width: 33,
                                height: 33,
                                fit: BoxFit.cover,
                              ),
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return SizedBox(
                                  width: 33,
                                  height: 33,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: kPrimaryColor,
                                      value:
                                          loadingProgress.expectedTotalBytes !=
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
                      child: const CurrentTenantsView(),
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: const PreviousTenantsView(),
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
