import 'package:flutter/material.dart';

class TrackLeaseExtensionPage extends StatefulWidget {
  const TrackLeaseExtensionPage({super.key});

  @override
  State<TrackLeaseExtensionPage> createState() =>
      _TrackLeaseExtensionPageState();
}

class _TrackLeaseExtensionPageState extends State<TrackLeaseExtensionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Property Extension"),
      ),
    );
  }
}
