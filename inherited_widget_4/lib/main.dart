import 'package:flutter/material.dart';
import 'package:inherited_widget_4/mainapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const SharedData(
      obj: ModelClass(name: "Virat Kohali", jerno: 18, iplTeam: "RCB"),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:MainApp(),
      ),
    );
  }
}

class ModelClass {
  final String name;
  final int? jerno;
  final String? iplTeam;
  const ModelClass(
      {required this.name, required this.jerno, required this.iplTeam});
}

class SharedData extends InheritedWidget {
  final ModelClass obj;
  const SharedData({super.key, required this.obj, required super.child});

  static SharedData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(SharedData oldWidget) {
    return obj != oldWidget.obj;
  }
}
