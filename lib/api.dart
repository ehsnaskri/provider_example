import 'dart:math';

import 'package:provider_practice/product.dart';
import 'package:connectivity/connectivity.dart';

class ApiRest {
  static Future<Map<String, dynamic>> getProducts(int page) async {
    await Future.delayed(Duration(seconds: 2));
    Random random = Random();
    bool exception = random.nextBool();
    print('exception: $exception');
    if (exception) {
      throw Exception(['Something went wrong']);
    }
    int pageSize = 10;
    int from = page * pageSize;
    int to = min((page + 1) * pageSize, _products.length);
    int currentPage = page;
    int lastPage = ((_products.length - 1) ~/ pageSize);

    print('from $from');
    print('to $to');
    print('size ${_products.length}');
    print('currentPage: $currentPage');
    print('lastPage: $lastPage');
    Map<String, dynamic> result = {};
    result['current_page'] = currentPage;
    result['last_page'] = lastPage;
    result['products'] = _products.sublist(from, to);
    print('done from api');
    return result;
  }

  // static Future<List<Product>> getNewProducts() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   return _allProducts.sublist(0, 10);
  // }

  // static List<Product> _allProducts = [..._newProducts, ..._products];

  static List<Product> _newProducts = [
    Product(
      id: 8,
      name: 'a',
      email: 'a',
      body: 'a',
    ),
  ];

  static List<Product> _products = [
    Product(
      id: 1,
      name: 'Ehsan Askar',
      email: 'ehsnaskari@gamil.com',
      body: 'Some body text',
    ),
    Product(
      id: 2,
      name: 'Ali ali',
      email: 'eali.ali@gamil.com',
      body: 'longer text',
    ),
    Product(
      id: 3,
      name: 'reza karimi',
      email: 'rezakairimi@gamil.com',
      body: 'this is text for reza',
    ),
    Product(
      id: 4,
      name: 'ahmad rezaie',
      email: 'ahmadrezaie@gamil.com',
      body: 'to comple some alter',
    ),
    Product(
      id: 5,
      name: 'akbar fida',
      email: 'akbarfida@gamil.com',
      body: 'education is more better',
    ),
    Product(
      id: 6,
      name: 'abdl alir',
      email: 'abdlalia@gamil.com',
      body: 'regardinf some issues',
    ),
    Product(
      id: 7,
      name: 'kamal kahn ',
      email: 'kamalkhan@gamil.com',
      body: 'computers are good',
    ),
    Product(
      id: 8,
      name: 'Ehsan Askar',
      email: 'ehsnaskari@gamil.com',
      body: 'Some body text',
    ),
    Product(
      id: 9,
      name: 'Ali ali',
      email: 'eali.ali@gamil.com',
      body: 'longer text',
    ),
    Product(
      id: 10,
      name: 'reza karimi',
      email: 'rezakairimi@gamil.com',
      body: 'this is text for reza',
    ),
    Product(
      id: 11,
      name: 'ahmad rezaie',
      email: 'ahmadrezaie@gamil.com',
      body: 'to comple some alter',
    ),
    Product(
      id: 12,
      name: 'akbar fida',
      email: 'akbarfida@gamil.com',
      body: 'education is more better',
    ),
    Product(
      id: 13,
      name: 'abdl alir',
      email: 'abdlalia@gamil.com',
      body: 'regardinf some issues',
    ),
    Product(
      id: 14,
      name: 'kamal kahn ',
      email: 'kamalkhan@gamil.com',
      body: 'computers are good',
    ),
    Product(
      id: 15,
      name: 'Ehsan Askar',
      email: 'ehsnaskari@gamil.com',
      body: 'Some body text',
    ),
    Product(
      id: 16,
      name: 'Ali ali',
      email: 'eali.ali@gamil.com',
      body: 'longer text',
    ),
    Product(
      id: 17,
      name: 'reza karimi',
      email: 'rezakairimi@gamil.com',
      body: 'this is text for reza',
    ),
    Product(
      id: 18,
      name: 'ahmad rezaie',
      email: 'ahmadrezaie@gamil.com',
      body: 'to comple some alter',
    ),
    Product(
      id: 19,
      name: 'akbar fida',
      email: 'akbarfida@gamil.com',
      body: 'education is more better',
    ),
    Product(
      id: 20,
      name: 'abdl alir',
      email: 'abdlalia@gamil.com',
      body: 'regardinf some issues',
    ),
    Product(
      id: 21,
      name: 'kamal kahn ',
      email: 'kamalkhan@gamil.com',
      body: 'computers are good',
    ),
    Product(
      id: 22,
      name: 'Ehsan Askar',
      email: 'ehsnaskari@gamil.com',
      body: 'Some body text',
    ),
    Product(
      id: 23,
      name: 'Ali ali',
      email: 'eali.ali@gamil.com',
      body: 'longer text',
    ),
    Product(
      id: 24,
      name: 'reza karimi',
      email: 'rezakairimi@gamil.com',
      body: 'this is text for reza',
    ),
    Product(
      id: 25,
      name: 'ahmad rezaie',
      email: 'ahmadrezaie@gamil.com',
      body: 'to comple some alter',
    ),
    Product(
      id: 26,
      name: 'akbar fida',
      email: 'akbarfida@gamil.com',
      body: 'education is more better',
    ),
    Product(
      id: 27,
      name: 'abdl alir',
      email: 'abdlalia@gamil.com',
      body: 'regardinf some issues',
    ),
    Product(
      id: 28,
      name: 'kamal kahn ',
      email: 'kamalkhan@gamil.com',
      body: 'computers are good',
    ),
    Product(
      id: 29,
      name: 'kamal kahn ',
      email: 'kamalkhan@gamil.com',
      body: 'computers are good',
    ),
    Product(
      id: 30,
      name: 'kamal kahn ',
      email: 'kamalkhan@gamil.com',
      body: 'computers are good',
    ),
    Product(
      id: 31,
      name: 'kamal kahn ',
      email: 'kamalkhan@gamil.com',
      body: 'computers are good',
    ),
  ];

  static Future<bool> internetConnection() async {
    final conResult = await Connectivity().checkConnectivity();
    return conResult != ConnectivityResult.none;
  }
}
