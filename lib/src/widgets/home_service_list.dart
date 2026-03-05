import 'package:flutter/material.dart';
import 'package:flutter_application/app/router/router.dart';
import 'package:go_router/go_router.dart';

const _menuItems = [
  {'title': 'Post', 'route': Routes.posts},
  {'title': 'Photo', 'route': Routes.photos},
  {'title': 'User', 'route': Routes.users},
  {'title': 'Todo', 'route': Routes.todos},
];

class HomeServiceList extends StatefulWidget {
  const HomeServiceList({super.key});

  @override
  State<HomeServiceList> createState() => _HomeServiceListState();
}

class _HomeServiceListState extends State<HomeServiceList> {
  @override
  Widget build(BuildContext context) {
    final double width = (MediaQuery.of(context).size.width - 15 - 48) / 2;

    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: _menuItems.map((item) {
        return SizedBox(
          width: width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () => context.push(item['route'] as String),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 26, 0, 26),
              child: Text(
                item['title'] as String,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
