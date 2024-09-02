import 'package:flutter/material.dart';
import 'package:openhome/app/view/my_request.dart';

import '../../view/tenant_request_view.dart';
import '../../../config/constant/constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class TenantRequestPage extends StatefulWidget {
  const TenantRequestPage({super.key});

  @override
  State<TenantRequestPage> createState() => _TenantRequestPageState();
}

class _TenantRequestPageState extends State<TenantRequestPage> {
  String selectedRoll = "";

  @override
  void initState() {
    var roll = getStorage.read('roll') ?? "";
    setState(() {
      selectedRoll = roll;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedRoll == "tenant" ? "My Requests" : "Tenant Requests",
            style: const TextStyle(fontFamily: kCircularStdBook),
          ),
          backgroundColor: kBackGroundColor,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                selectedRoll == "tenant"
                    ? MyRequestView(isviewall: 1)
                    : TenantRequestView(isviewall: 1)
              ],
            ),
          ),
        ));
  }
}
