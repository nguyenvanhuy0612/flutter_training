import 'package:flutter/material.dart';
import 'appbar_table.dart';
import 'format_floor.dart';

class ManagerTable extends StatelessWidget {
  ManagerTable({super.key});

  // Map<int, List<TableItem>> tab1Tables = {};
  // Map<int, List<TableItem>> tab2Tables = {};
  // Map<int, List<TableItem>> tab3Tables = {};

  @override
  Widget build(BuildContext context) {
    // FloorProvider floorProvider = Provider.of<FloorProvider>(context, listen: false);
    // tab1Tables = floorProvider.allTables;
    // tab2Tables = {0: [], 1: [], 2: []};
    // tab3Tables = tab1Tables;
    // print('tab1Tables - $tab1Tables');
    // print('tab2Tables - $tab2Tables');
    // print('tab3Tables - $tab3Tables');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBarTable(),
          body: TabBarView(
            children: [
              FloorSelect(tabIndex: 0),
              FloorSelect(tabIndex: 1),
              FloorSelect(tabIndex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
