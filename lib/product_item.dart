import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/product.dart';
import 'package:provider_practice/product_detail.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = Provider.of(context, listen: false);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                value: product,
                builder: (context, child) => ProductDetail(),
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('${product.id}'),
              Text('${product.name}'),
              Text('${product.email}'),
              Text('${product.body}'),
              Consumer<Product>(
                builder: (context, prod, child) {
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
      ),
    );
  }
}
