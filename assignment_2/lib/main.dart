import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Assignment2(),
    );
  }
}

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});
  @override
  State<Assignment2> createState() => _Assignment2State();
}

class _Assignment2State extends State<Assignment2> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Assignments",
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: const [
          Icon(
            Icons.favorite_rounded,
            color: Color.fromARGB(255, 232, 113, 105),
          ),
          Icon(
            Icons.comment_outlined,
            color: Color.fromARGB(255, 232, 113, 105),
          )
        ],
      ),
    );
  }
}
