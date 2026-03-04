import 'package:flutter/material.dart';
import 'package:flutter_application/src/constants/app_colors.dart';
import 'package:flutter_application/src/widgets/home_service_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              '안녕하세요',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(width: 2),
            const Text('김우영님', style: TextStyle(fontSize: 16)),
          ],
        ),
        centerTitle: false,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(24),
        color: Color(0xffF5F5F5),
        child: HomeServiceList(),
      ),
    );
  }
}
