import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'floor_provider.dart';

class AppBarTable extends StatefulWidget implements PreferredSizeWidget {
  const AppBarTable({super.key});

  @override
  State<StatefulWidget> createState() => _AppBarTable();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _AppBarTable extends State<AppBarTable> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        titleSpacing: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu, size: 30, color: Colors.black),
          onPressed: () {
            print('Table is select ${Provider.of<FloorProvider>(context, listen:false).getTab2Tables()}');
          },
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo1.jpg',
              height: 40,
              alignment: Alignment.center,
            ),
            const Text(
              'KiotViet',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            )
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey[400]),
            child: IconButton(
                onPressed: () {
                  //print('Table is select ${Provider.of<FloorProvider>(context, listen:false).getTab2Tables()}');
                },
                icon: const Icon(Icons.search,
                    size: 30, color: Colors.black)),
          ),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey[400]),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none,
                    size: 30, color: Colors.black)),
          ),
        ],
        bottom: const TabBar(
          labelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          tabs: [
            Tab(text: 'Tất cả'),
            Tab(text: 'Sử dụng'),
            Tab(text: 'Còn trống'),
          ],
        ),
      );
  }
}