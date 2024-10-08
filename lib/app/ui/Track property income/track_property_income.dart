import 'package:flutter/material.dart';

class TrackPropertyIncomePage extends StatefulWidget {
  const TrackPropertyIncomePage({super.key});

  @override
  State<TrackPropertyIncomePage> createState() =>
      _TrackPropertyIncomePageState();
}

class _TrackPropertyIncomePageState extends State<TrackPropertyIncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Income Track"),
      ),
    );
  }
}
