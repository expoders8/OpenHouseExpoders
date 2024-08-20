import 'package:flutter/material.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../view/tenant_request_view.dart';

class TenantRequestPage extends StatefulWidget {
  const TenantRequestPage({super.key});

  @override
  State<TenantRequestPage> createState() => _TenantRequestPageState();
}

class _TenantRequestPageState extends State<TenantRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tenant Requests",
            style: TextStyle(fontFamily: kCircularStdBook),
          ),
          backgroundColor: kBackGroundColor,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                TenantRequestView(isviewall: 1),
              ],
            ),
          ),
        ));
  }
}
