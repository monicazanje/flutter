import 'package:flutter/material.dart';
import 'package:model_view_controller/controller/product_controller.dart';
import 'package:provider/provider.dart';
import 'package:model_view_controller/view/product_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ProductController();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetProductData(),
      ),
    );
  }
}
