import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) {
            return Employee(empname: 'monika', empid: 101);
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return Project(
                projectname: 'face detection', devType: 'frontend developer');
          },
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainApp(),
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State createState() => _MainAppState();
}

class _MainAppState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiple Provider"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Text(Provider.of<Employee>(context).empname),
          const SizedBox(
            height: 20,
          ),
          Text(
            "${Provider.of<Employee>(context).empid}",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(Provider.of<Project>(context, listen: false).projectname),
          const SizedBox(
            height: 20,
          ),
          Text(Provider.of<Project>(context).devType),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<Project>(context, listen: false)
                  .changedata("healthcare", "backend");
            },
            child: const Text("change data"),
          ),
        ],
      ),
    );
  }
}

class Employee {
  String empname;
  int empid;
  Employee({required this.empid, required this.empname});
}

class Project with ChangeNotifier {
  String projectname;
  String devType;

  Project({required this.projectname, required this.devType});
  void changedata(String projectname, String devType) {
    this.projectname = projectname;
    this.devType = devType;
    notifyListeners();
  }
}
