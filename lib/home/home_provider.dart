import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:flutter_training/home/product.dart';

class HomeProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  HomeProvider() {
    _loadDataFromJson();
  }

  Future<void> _loadDataFromJson() async {
    try {
      String jsonData = await rootBundle.loadString('products.json');
      List<dynamic> jsonList = json.decode(jsonData);
      _products = jsonList.map((json) => Product.fromJson(json)).toList();
      notifyListeners();
    } catch (error) {
      print('Error loading data from JSON: $error');
    }
  }

  List<Product> searchProducts(String searchText) {
    List<Product> results = [];

    for (var product in _products) {
      if (product.name.toLowerCase().contains(searchText.toLowerCase())) {
        results.add(product);
      }
    }

    return results;
  }

  List<Product> getTab1Data(List<Product> results) {
    return results.sublist(0, min(results.length, 10));
  }

  List<Product> getTab2Data(List<Product> results) {
    if (results.length <= 10) {
      return List.from(results);
    }
    return results.sublist(results.length - 10);
  }

  List<Product> getTab3Data(List<Product> results) {
    List<Product> shuffledResults = List.from(results)..shuffle();
    return shuffledResults.sublist(0, min(shuffledResults.length, 10));
  }

  List<Product> getTab4Data(List<Product> results) {
    List<Product> shuffledResults = List.from(results)..shuffle();
    return shuffledResults.sublist(0, min(shuffledResults.length, 10));
  }
}
