import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return Company(companyname: "google", empCount: 100);
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(Provider.of<Company>(context).companyname),
            const SizedBox(
              height: 20,
            ),
            Text("${Provider.of<Company>(context).empCount}"),
          ],
        ),
      ),
    );
  }
}

class Company {
  String companyname;
  int empCount;
  Company({required this.companyname, required this.empCount});
}
