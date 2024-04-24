import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Company(companyname: "google", empcount: 1000);
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
        title: const Text("Change Notifier Provider"),
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
            Text("${Provider.of<Company>(context).empcount}"),
            ElevatedButton(
                onPressed: () {
                  Provider.of<Company>(context, listen: false)
                      .changeCompany('facebook', 900);
                },
                child: const Text("Change company"))
          ],
        ),
      ),
    );
  }
}

class Company extends ChangeNotifier {
  String companyname;
  int empcount;
  Company({required this.companyname, required this.empcount});

  void changeCompany(String companyname, int empcount) {
    this.companyname = companyname;
    this.empcount = empcount;
    notifyListeners();
  }
}
