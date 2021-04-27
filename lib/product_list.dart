import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/product_item.dart';
import 'package:provider_practice/products.dart';

class ProductList extends StatelessWidget {
  bool initialized = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(
      builder: (context, productsProvider, child) {
        if (!initialized) {
          productsProvider.initializeProducts();
          initialized = true;
        }
        return Container(
          child: RefreshIndicator(
            onRefresh: () {
              return productsProvider.loadProducts();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: productsProvider.loaded
                  ? Container(
                      child: Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(3),
                            itemCount: productsProvider.products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1 / 1),
                            itemBuilder: (context, index) {
                              return ChangeNotifierProvider.value(
                                value: productsProvider.allProducts[index],
                                builder: (context, child) => ProductItem(),
                              );
                            },
                          ),
                          Container(
                            child: productsProvider.isLoading
                                ? Container(
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  )
                                : productsProvider.end
                                    ? Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text('No more products'))
                                    : Column(
                                        children: [
                                          !productsProvider.internetConnection
                                              ? Text('No Internet Connection')
                                              : productsProvider.error
                                                  ? Container(
                                                      child: Text(
                                                          'Error Connecting to server'),
                                                    )
                                                  : SizedBox(),
                                          Container(
                                            padding: EdgeInsets.only(bottom: 8),
                                            child: ElevatedButton(
                                              child: Text('Load More'),
                                              onPressed: () {
                                                productsProvider
                                                    .loadMoreProducts();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                          )
                        ],
                      ),
                    )
                  : productsProvider.isLoading
                      ? Column(
                          children: [
                            Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          ],
                        )
                      : Container(
                          padding: EdgeInsets.all(40),
                          child: Center(
                            child: Text(
                              !productsProvider.internetConnection
                                  ? 'No Internet Connection'
                                  : "Error Connecting to server",
                            ),
                          ),
                        ),
            ),
          ),
        );
      },
    );
  }
}
