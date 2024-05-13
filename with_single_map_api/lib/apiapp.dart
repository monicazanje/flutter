import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiApp extends StatefulWidget {
  const ApiApp({super.key});
  @override
  State createState() => _ApiAppState();
}

class _ApiAppState extends State {
  @override
  void initState() {
    super.initState();
    getEmployeeData();
  }

  Map<String, dynamic> employeedata = {};
  Widget returnData() {
    if (employeedata.isNotEmpty) {
      return Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Row(
            children: [
              Text("${employeedata['employee_salary']}"),
              const SizedBox(
                width: 30,
              ),
              Text(employeedata['employee_name']),
            ],
          ),
        ),
      );
    } else {
      return const Text("Empty api data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Binding"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return returnData();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  void getEmployeeData() async {
    Uri uri = Uri.parse("https://dummy.restapiexample.com/api/v1/employee/1");
    http.Response response = await http.get(uri);
    log(response.body);

    var returndata = json.decode(response.body);

    setState(() {
      employeedata = returndata['data'];
    });
  }
}
