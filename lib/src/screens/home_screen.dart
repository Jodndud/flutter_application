import 'package:flutter/material.dart';
import 'package:flutter_application/src/widgets/home_service_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: HomeServiceList(),
    );
  }
}
