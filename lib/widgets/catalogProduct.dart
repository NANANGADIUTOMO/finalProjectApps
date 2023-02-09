import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewarungapps/controller/cartController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../model/productmodel.dart';

class CatalogProduct extends StatelessWidget {
  const CatalogProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          itemCount: Product.products.length,
          itemBuilder: (BuildContext context, int index) {
            return CatalogProductCard(index: index);
          }),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final index;
  CatalogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            child: Text("A"),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              Product.products[index].name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Expanded(
            child: Text('${Product.products[index].detail}'),
          ),
          IconButton(
              onPressed: () {
                cartController.AddProduct(Product.products[index]);
              },
              icon: Icon(Icons.add_circle))
        ],
      ),
    );
  }
}
