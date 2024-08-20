import 'package:flutter/material.dart';
import 'package:navigationbar/navigation.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  @override
  State<Cart> createState() => _Cartstate();
}

class _Cartstate extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: Navigations(),
    );
  }
}
