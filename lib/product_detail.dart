import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/product.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Product>(context);
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        brightness: Brightness.dark,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text('${product.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${product.id}'),
            SizedBox(height: 10),
            Text('${product.email}'),
            SizedBox(height: 10),
            Text('${product.body}'),
            SizedBox(height: 10),
            Consumer<Product>(
              builder: (context, prod, child) {
                print('favorite icon build');
                return IconButton(
                  onPressed: () {
                    prod.toggleFavorite();
                  },
                  icon: Icon(
                    prod.liked
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
