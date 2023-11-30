import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Example for notifyListeners

// Create a class that extends ChangeNotifier
class Counter extends ChangeNotifier {
  int _count = 0;

  // Define a getter to get the current count
  int get count => _count;

  // Define a method to increment the count
  void increment() {
    _count++;
    print('Notify listeners after the count has been incremented - $_count');
    notifyListeners();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        // Provide an instance of Counter to the widget tree
        create: (context) => Counter(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  //static int index = 0;
  int index = 0;

  //const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the Counter instance from the Provider
    final counter = Provider.of<Counter>(context);
    print("===================HomePage render!!!========================");
    index++;
    print('index - $index, counter.count - ${counter.count}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Count:',
                style: TextStyle(fontSize: 48)
            ),
            // Display the current count from the Counter
            Text(
              //'index: $index - counter.count: ${counter.count}',
              'index: $index - counter.count: ${counter.count}',
              style: TextStyle(fontSize: 48),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call the increment method when the button is pressed
          counter.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
