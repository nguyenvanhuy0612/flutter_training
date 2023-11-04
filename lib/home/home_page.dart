import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_training/home/product.dart';
import 'package:flutter_training/home/tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_training/login/login_page.dart';
import 'package:flutter_training/user/user_provider.dart';
import 'home_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: TabApp.tabs.length,
      child: HomePageContent(),
    );
  }
}

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContent createState() => _HomePageContent();
}

class _HomePageContent extends State<HomePageContent> {
  TextEditingController searchController = TextEditingController();

  List<Product> tab1Data = [];
  List<Product> tab2Data = [];
  List<Product> tab3Data = [];
  List<Product> tab4Data = [];

  late HomeProvider _homeProvider;

  @override
  void initState() {
    super.initState();
    _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    //WidgetsBinding.instance.addPostFrameCallback((_) async => await _homeProvider.loadDataFromJson());
    //WidgetsBinding.instance.addPostFrameCallback((_) => initLoad());
  }

  List<Product> getProducts() {
    return _homeProvider.products;
  }

  void initLoad() {
    setState(() {
      List<Product> shuffledResults = List.from(getProducts())..shuffle();
      tab1Data = shuffledResults.sublist(0, min(shuffledResults.length, 10));
      tab2Data = shuffledResults.sublist(0, min(shuffledResults.length, 10));
      tab3Data = shuffledResults.sublist(0, min(shuffledResults.length, 10));
      tab4Data = shuffledResults.sublist(0, min(shuffledResults.length, 10));
    });
  }

  void performSearch(String searchValue) {
    List<Product> searchResults = _homeProvider.searchProducts(searchValue);

    setState(() {
      tab1Data = _homeProvider.getTab1Data(searchResults);
      tab2Data = _homeProvider.getTab2Data(searchResults);
      tab3Data = _homeProvider.getTab3Data(searchResults);
      tab4Data = _homeProvider.getTab4Data(searchResults);
    });
  }

  Widget buildTabContent(List<Product> data) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue,
          margin: EdgeInsets.all(8.0),
          child: Center(child: buildCard(data[index])),
        );
      },
      itemCount: data.length,
    );
  }

  Widget buildCard(Product product) {
    String imageUrl = product.imageUrl ?? 'assets/s23u.jpg';

    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image (if available)
          imageUrl.isNotEmpty
              ? Container(
                  height: 80,
                  width: 80,
                  child: Image(
                    image: AssetImage('assets/s23u.jpg'),
                  ),
                ) //Image.network(imageUrl, height: 150, fit: BoxFit.cover)
              : Container(height: 150, color: Colors.grey),
          // Placeholder image

          // Product Name
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          // Star Rate and Number Bought
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Star Rate: ${product.starRate}'),
                Text('Number Bought: ${product.numberOfBought}'),
              ],
            ),
          ),

          // Price
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Price: \$${product.price.toStringAsFixed(2)}'),
          ),

          // Brand
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Brand: ${product.brand}'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.orangeAccent,
          ),
        ),
        title: Container(
          decoration: BoxDecoration(
              // color: Colors.white,
              border: Border.all(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(children: <Widget>[
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.clear), // This is the clear button
              onPressed: () {
                searchController.clear(); // Clear the text in the TextField
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                String searchValue = searchController.text;
                performSearch(searchValue);
              },
            ),
          ]),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {},
              child: Icon(
                Icons.filter_alt_outlined,
                color: Colors.orangeAccent,
              ))
        ],
        bottom: TabBar(
          tabs: TabApp.tabs,
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: TabBarView(
        children: [
          buildTabContent(tab1Data),
          buildTabContent(tab2Data),
          buildTabContent(tab3Data),
          buildTabContent(tab4Data),
        ],
      ),
    );
  }
}
