import 'package:flutter/material.dart';
import 'package:navigationbar/navigation.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});
  @override
  State<Screen> createState() => _Screenstate();
}

class _Screenstate extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: Navigations(),
    );
  }
}
