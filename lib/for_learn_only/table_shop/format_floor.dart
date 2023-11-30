import 'floor_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class FloorSelect extends StatelessWidget {
  final tabIndex;

  const FloorSelect({super.key, required this.tabIndex});

  Widget buildTextButton(String buttonText, int index, FloorProvider floorProvider) {
    return TextButton(
      onPressed: () {
        print('buildTextButton - $index');
        floorProvider.floorIndex = index;
      },
      child:
          Text(buttonText, style: TextStyle(fontSize: 20, color: Colors.black)),
      style: TextButton.styleFrom(
        side: BorderSide(width: 1, color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor:
            floorProvider.floorIndex == index ? Colors.redAccent : Colors.white,
      ),
    );
  }

  Map<int, List<TableItem>> loadTableByTab(FloorProvider floorProvider) {
    print('loadTableByTab tabIndex - $tabIndex');
    if (tabIndex == 0) {
      return floorProvider.allTables;
    } else if (tabIndex == 1) {
      return floorProvider.getTab2Tables();
    }
    return floorProvider.getTab3Tables();
  }

  @override
  Widget build(BuildContext context) {
    print('FloorSelect2 - build');
    FloorProvider floorProvider = Provider.of<FloorProvider>(context);
    Map<int, List<TableItem>> tables = loadTableByTab(floorProvider);
    print('tables - $tables');
    List<TableItem> tableLists = tables[floorProvider.floorIndex] ?? [];
    print('tableLists.length - ${tableLists.length}');

    return Column(
      children: [
        Row(
          children: [
            buildTextButton('Lầu 1', 0, floorProvider),
            const SizedBox(width: 5),
            buildTextButton('Lầu 2', 1, floorProvider),
            const SizedBox(width: 5),
            buildTextButton('Lầu 3', 2, floorProvider),
          ],
        ),
        Expanded(
            child: GridView.builder(
                itemCount: tableLists.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, index) {
                  print('GridView.builder - index $index');
                  return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        onPressed: () {
                          print('ElevatedButton - index: $index');
                          floorProvider.toggleSelection(tabIndex, index);
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            backgroundColor: tableLists[index].isSelected
                                ? Colors.blue
                                : Colors.white),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  tableLists[index].label,
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.black),
                                )),
                          ],
                        ),
                      ));
                })),
      ],
    );
  }
}
