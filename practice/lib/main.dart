import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("IN Main app");
    return ChangeNotifierProvider(
      create: (context) {
        return Company(companyname: "google", empcount: 250);
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Myapp(),
      ),
    );
  }
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});
  @override
  State createState() => _MyappState();
}

class _MyappState extends State {
  @override
  Widget build(BuildContext context) {
    log("in material app build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(Provider.of<Company>(context).companyname),
            const SizedBox(
              height: 20,
            ),
            Text("${Provider.of<Company>(context).empcount}"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Company>(context, listen: false)
                    .makechanges("microsoft", 500);
              },
              child: const Text("change company"),
            ),
            Change(),
          ],
        ),
      ),
    );
  }
}

class Change extends StatelessWidget {
  const Change({super.key});
  @override
  Widget build(BuildContext context) {
    log("in change build");
    return Text("300");
  }
}

class Company extends ChangeNotifier {
  String companyname;
  int empcount;

  Company({required this.companyname, required this.empcount});

  void makechanges(String companyname, int empcount) {
    this.companyname = companyname;
    this.empcount = empcount;
    notifyListeners();
  }
}
