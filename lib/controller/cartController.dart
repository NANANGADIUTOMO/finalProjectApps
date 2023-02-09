import 'package:ewarungapps/model/productmodel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void AddProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    // Get.snackbar("Product add", "you have add the to the chart",
    //     snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[Product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;
}
