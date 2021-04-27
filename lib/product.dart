import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  int id;
  String name;
  String email;
  String body;
  bool liked;

  Product({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.body,
    this.liked = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
      "body": this.body,
    };
  }

  void toggleFavorite() {
    liked = !liked;
    notifyListeners();
  }
}
