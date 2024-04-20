import 'package:flutter/material.dart';

class BottomClass extends StatefulWidget {
  const BottomClass({super.key});
  @override
  State createState() => _BottomSheetState();
}

class _BottomSheetState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add IPL team",
        ),
      ),
    );
  }
}
