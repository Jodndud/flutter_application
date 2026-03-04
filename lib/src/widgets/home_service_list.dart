import 'package:flutter/material.dart';
import 'package:flutter_application/app/router/router.dart';
import 'package:go_router/go_router.dart';

const _menuItems = [
  {'title': 'Post List', 'route': Routes.posts},
  {'title': 'Photo List', 'route': Routes.photos},
];

class HomeServiceList extends StatefulWidget {
  const HomeServiceList({super.key});

  @override
  State<HomeServiceList> createState() => _HomeServiceListState();
}

class _HomeServiceListState extends State<HomeServiceList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xffF5F5F5),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemCount: _menuItems.length,
          itemBuilder: (context, index) {
            final item = _menuItems[index];
            return Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(15, 32, 32, 10),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  context.go(item['route'] as String);
                },
                child: Text(item['title'] as String),
              ),
            );
          },
        ),
      ),
    );
  }
}
