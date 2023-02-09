import 'package:ewarungapps/screen/cartscreen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../widgets/catalogProduct.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          CatalogProduct(),
          ElevatedButton(
              onPressed: () => Get.to(() => CartScreen()),
              child: Text("go to chart"))
        ],
      )),
    );
  }
}
