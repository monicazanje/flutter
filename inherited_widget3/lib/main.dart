import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inherited_widget3/login.dart';

void main() {
  runApp(const MyApp());
}

TextEditingController idController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController skillController = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    log("in the myapp build");
    return SharedData(
      modelclassobj: ModelClass(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}

class SharedData extends InheritedWidget {
  // final String id;
  // final String name;
  // final String username;
  final ModelClass modelclassobj;

  const SharedData({
    super.key,
    required this.modelclassobj,
    required super.child,
  });
  static SharedData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedData>()!;
  }

  @override
  bool updateShouldNotify(SharedData oldWidget) {
    return modelclassobj != oldWidget.modelclassobj;
  }
}

class ModelClass {
  int? id;
  String? name;
  String? username;
  ModelClass(
      {this.id,this.name,this.username});
  // Map<String, dynamic> employee() {
  //   return {
  //     "id": id,
  //     "name": name,
  //     "userName": username,
  //   };
  // }

  // @override
  // String toString() {
  //   return '{id:$id,name:$name,userName:$username}';
  // }
}
