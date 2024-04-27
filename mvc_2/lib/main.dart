import 'package:flutter/material.dart';
import 'package:mvc_2/controller/product_controller.dart';
import 'package:mvc_2/controller/wishlist_controller.dart';
import 'package:provider/provider.dart';
import 'package:mvc_2/view/product_display.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return ProductController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return WishlistController();
          },
        )
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: GetProductData()),
    );
  }
}
