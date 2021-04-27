import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/product_list.dart';
import 'package:provider_practice/products.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backwardsCompatibility: false,
        brightness: Brightness.dark,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text('Provider Practice'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<Products>(
            create: (context) => Products(),
          ),
        ],
        child: Container(
          child: ProductList(),
        ),
      ),
    );
  }
}
