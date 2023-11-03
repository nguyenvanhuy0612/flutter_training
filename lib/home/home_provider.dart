import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  List<String> tab1Data = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  List<String> tab2Data = ['Item A', 'Item B', 'Item C', 'Item D'];
  List<String> tab3Data = ['Item X', 'Item X', 'Item Y', 'Item Z'];
  List<String> tab4Data = ['Item W', 'Item X', 'Item Y', 'Item Z'];

  List<String> getDataForTabIndex(int index) {
    switch (index) {
      case 0:
        return tab1Data;
      case 1:
        return tab2Data;
      case 2:
        return tab3Data;
      case 3:
        return tab4Data;
      default:
        return [];
    }
  }
}
