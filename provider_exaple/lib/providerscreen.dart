import 'package:flutter/material.dart';

class NumProvider extends ChangeNotifier{
  List datalist=[1,2,3,4];

  void add(){
    int last=datalist.last;
    datalist.add(last+1);
    notifyListeners();
  }

}