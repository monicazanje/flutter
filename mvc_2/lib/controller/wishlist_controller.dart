import 'package:flutter/material.dart';
import 'package:mvc_2/model/product_model.dart';
//import 'package:mvc_2/view/product_display_data.dart';

class WishlistController extends ChangeNotifier {
  List<ProductModel> productlist = [];

  void add({ProductModel? obj}) {
    productlist.add(obj!);
    notifyListeners();
  }

  void remove({required int index}) {
    productlist.removeAt(index);
    notifyListeners();
    
  }
}
