import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_practice/api.dart';
import 'package:provider_practice/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Products with ChangeNotifier {
  List<Product> allProducts = [];
  bool isLoading = true;
  bool loaded = false;
  int currentPage = 0;
  int lastPage = 1;
  bool end = false;
  bool error = false;
  bool internetConnection = true;

  List<Product> get products {
    return [...allProducts];
  }

  Future<void> initializeProducts() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('products');
    isLoading = true;

    final local = await fromSharePrefs();
    if (local != null) {
      allProducts = local;
      loaded = true;
      isLoading = false;
      notifyListeners();
      print('loaded from shared prefs');
      loadProducts();
    } else {
      print('not in shared prefs');
      await loadProducts();
      isLoading = false;
    }
  }

  Future<void> loadProducts() async {
    end = false;
    error = false;
    internetConnection = await ApiRest.internetConnection();
    if (internetConnection) {
      try {
        final result = await ApiRest.getProducts(0);
        allProducts = result['products'];
        currentPage = result['current_page'];
        lastPage = result['last_page'];
        loaded = true;
        isLoading = false;
        print('initial Products loaded');
        notifyListeners();
        toSharedPrefs();
      } catch (e) {
        error = true;
        print('error loading initial products');
        isLoading = false;
        notifyListeners();
      }
    } else {
      print('No internet Connection');
    }

    isLoading = false;
    notifyListeners();
  }

  // Future<void> loadNewProducts() async {
  //   allProducts = await ApiRest.getNewProducts();
  //   loaded = true;
  //   notifyListeners();
  //   print('New products loaded');
  // }

  Future<void> loadMoreProducts() async {
    error = false;
    if (end ||
        isLoading ||
        (currentPage + 1) > lastPage ||
        !loaded ||
        allProducts.length < 10) {
      end = true;
      notifyListeners();
      return;
    }
    isLoading = true;
    notifyListeners();
    internetConnection = await ApiRest.internetConnection();
    if (internetConnection) {
      try {
        final result = await ApiRest.getProducts(currentPage + 1);
        allProducts = [...allProducts, ...result['products']];
        currentPage = result['current_page'];
        lastPage = result['last_page'];
        if (result['products'].length < 10) {
          end = true;
        }
      } catch (e) {
        error = true;
      }
    }
    isLoading = false;
    notifyListeners();
    print('More products loaded');
  }

  Future<void> toSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'products',
      jsonEncode(allProducts.map((product) => product.toJson()).toList()),
    );
    print('Products saved to shared prefs');
  }

  Future<List<Product>> fromSharePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('products')) {
      List<Product> prods = [];
      jsonDecode(prefs.getString('products'))
          .forEach((prod) => prods.add(Product.fromJson(prod)));
      return prods;
    }
    return null;
  }
}
