import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exaple/providerscreen.dart';
import 'package:provider_exaple/home.dart';
import 'package:provider_exaple/screen1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NumProvider()),
        // ChangeNotifierProvider(create: (context) {
        //   return Company(name: "google", count: 2000);
        // })
      ],
      child: const MaterialApp(home: Home()),
    );
  }
}

// class Company with ChangeNotifier {
//   String name;
//   int count;
//   Company({required this.count, required this.name});
//   void updatecompany(String name, int count) {
//     this.name = name;
//     this.count = count;
//     notifyListeners();
//   }
// }
