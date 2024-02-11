import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToggleApp(),
    );
  }
}

class ToggleApp extends StatefulWidget {
  const ToggleApp({super.key});

  State<ToggleApp> createState() => _ToggleAppState();
}

class _ToggleAppState extends State<ToggleApp> {
  int counter1 = 0;
  int counter2 = 0;

  Color setBox1Color() {
    if (counter1 == 1) {
      return Colors.red;
    } else if (counter1 == 2) {
      return Colors.green;
    } else if (counter1 == 3) {
      return Colors.blue;
    } else {
      counter1 == 0;
      return Colors.black;
    }
  }

  Color setBox2Color() {
    if (counter2 == 1) {
      return Colors.blue;
    } else if (counter2 == 2) {
      return Colors.red;
    } else if (counter2 == 3) {
      return Colors.green;
    } else {
      counter2 == 0;
      return Colors.pink;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TOGGLE APP"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 300,
                color: setBox1Color(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter1++;
                  });
                },
                child: const Text("Button1"),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                color: setBox2Color(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter2++;
                  });
                },
                child: const Text("Button2"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
