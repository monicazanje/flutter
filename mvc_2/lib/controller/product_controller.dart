import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:mvc_2/model/product_model.dart';

class ProductController with ChangeNotifier {
  List<ProductModel> listofproduct = [];
  void addproduct(ProductModel obj) {
    listofproduct.add(obj);
  }

  void addfavorite({required int index}) {
    listofproduct[index].favorite = !listofproduct[index].favorite;
    notifyListeners();
  }

  void addquentity({required int index}) {
    listofproduct[index].quentity = listofproduct[index].quentity + 1;
    notifyListeners();
  }

  void removequentity({required int index}) {
    listofproduct[index].quentity = listofproduct[index].quentity - 1;
    notifyListeners();
  }
}
