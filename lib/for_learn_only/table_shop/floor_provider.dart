import 'package:flutter/cupertino.dart';

class TableItem {
  bool isSelected;
  String label;
  DateTime? startTime;

  TableItem({this.isSelected = false, this.startTime, this.label = ''});

  void toggleSelection() {
    isSelected = !isSelected;
    if (isSelected) {
      startTime = DateTime.now();
    } else {
      startTime = null;
    }
  }

  @override
  String toString() {
    return 'TableItem{isSelected: $isSelected, label: $label}';
  }
}

class FloorProvider with ChangeNotifier {
  int _floorIndex = 0;


  int get floorIndex => _floorIndex;

  set floorIndex(int value) {
    _floorIndex = value;
    notifyListeners();
  }

  Map<int, List<TableItem>> allTables = {
    0: List.generate(10, (_) => TableItem(label: 'A$_')),
    1: List.generate(10, (_) => TableItem(label: 'B$_')),
    2: List.generate(10, (_) => TableItem(label: 'C$_')),
  };

  void toggleSelection(int tabIndex, int index) {
    Map<int, List<TableItem>> tables = allTables;
    if (tabIndex == 1) {
      tables = getTab2Tables();
    } else if (tabIndex == 2) {
      tables = getTab3Tables();
    }
    List<TableItem> tableLists = tables[floorIndex] ?? [];
    tableLists[index].isSelected = !tableLists[index].isSelected;
    notifyListeners();
  }

  Map<int, List<TableItem>> getTab2Tables() {
    Map<int, List<TableItem>> tab2Tables = {};
    for (int i = 0; i < allTables.length; i++) {
      List<TableItem> lists = allTables[i] ?? [];
      tab2Tables[i] = List.from(lists.where((element) => element.isSelected));
    }
    return tab2Tables;
  }

  Map<int, List<TableItem>> getTab3Tables() {
    Map<int, List<TableItem>> tab2Tables = {};
    for (int i = 0; i < allTables.length; i++) {
      List<TableItem>? lists = allTables[i] ?? [];
      tab2Tables[i] = List.from(lists.where((element) => !element.isSelected));
    }
    return tab2Tables;
  }
}
