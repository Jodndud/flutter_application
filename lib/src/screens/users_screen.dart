import 'package:flutter/material.dart';
import 'package:flutter_application/src/constants/app_colors.dart';
import 'package:flutter_application/src/widgets/user_list.dart';
import 'package:go_router/go_router.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('연락처'),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: const UserList(),
    );
  }
}
