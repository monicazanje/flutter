import 'package:flutter/material.dart';
import 'package:model_view_controller/model/product_model.dart';

class ProductController with ChangeNotifier {
  ProductModel? productobj;

  void addProduct(ProductModel obj) {
    productobj = obj;
  }

  void addfavorite() {
    productobj!.favorite=!productobj!.favorite!;
    notifyListeners();
  }

  void addquentity() {
    productobj!.quentity = productobj!.quentity + 1;
    notifyListeners();
  }

  void removequentity() {
    productobj!.quentity = productobj!.quentity - 1;
    notifyListeners();
  }
}
