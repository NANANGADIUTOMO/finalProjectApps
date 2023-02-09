import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/cartProduct.dart';
import '../widgets/catalogProduct.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your chart"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [CartProduct()],
        ),
      ),
    );
  }
}
