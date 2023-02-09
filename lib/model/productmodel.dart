import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final double price;
  final String detail;

  const Product({
    required this.name,
    required this.price,
    required this.detail,
  });
  static const List<Product> products = [
    Product(name: "Monitor", price: 300, detail: 'monitor gamming'),
    Product(name: "keyboard", price: 300, detail: 'keyboard gamming'),
    Product(name: "mouse", price: 300, detail: 'mouse gamming'),
  ];
}
