import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override 
  Widget build(BuildContext context){
    return SharedData();
  }

}
class ModelClass{
  final String name;
  final String? password;
  const ModelClass({required this.name,required this.password});

}

class SharedData extends InheritedWidget{

  final ModelClass obj;
  const SharedData({super.key,required this.obj,required super.child}) ; 
}