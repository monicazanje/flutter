import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StateDemo(),
    );
  }
}

class StateDemo extends StatefulWidget {
  const StateDemo({super.key});
  @override
  State<StateDemo> createState() => _DemoState();
}

class _DemoState extends State<StateDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("State management "),
          centerTitle: true,
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Cources(courceName: "java"),

            Cources(courceName: "java",),
            SizedBox(
              height: 40,
            ),
            Cources(courceName: "flutter",),
          ],
        ));
  }
}

class Cources extends StatefulWidget {
  final String courceName;
  const Cources({super.key,required this.courceName});
  @override
  State<Cources> createState() => _CourcesState();
}

class _CourcesState extends State<Cources> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    log('in courseState build');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              counter++;
            });
          },
          child: Container(
            height: 80,
            width: 80,
            alignment: Alignment.center,
            
            
          ),
        ),
        const SizedBox(
          width: 70,
        ),
        Container(
          height: 80,
          width: 80,
          color: Colors.amber,
          alignment: Alignment.center,
          child: Text("$counter"),
        )
      ],
    );
  }
}
