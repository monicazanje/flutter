import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomShift(),
    );
  }
}

class BottomShift extends StatefulWidget {
  const BottomShift({super.key});

  @override
  State createState() => _BottomShiftState();
}

class _BottomShiftState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottomsheet"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 13, bottom: 26),
                width: double.infinity,
                child:const  Column(
                  children: [
                    Text(
                      "Create Task",
                    )
                  ],
                ),
              );
            });
      }),
    );
  }
}
