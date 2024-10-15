import 'package:flutter/material.dart';

import '../../view/tenant_invitation_view.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class InvitationshowPage extends StatefulWidget {
  const InvitationshowPage({super.key});

  @override
  State<InvitationshowPage> createState() => _InvitationshowPageState();
}

class _InvitationshowPageState extends State<InvitationshowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Property Invitations",
          style: TextStyle(fontFamily: kCircularStdBook),
        ),
        backgroundColor: kBackGroundColor,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: TenantInvitationView(),
      ),
    );
  }
}
