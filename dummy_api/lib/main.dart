import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiApp(),
    );
  }
}

class ApiApp extends StatefulWidget {
  const ApiApp({super.key});
  @override
  State createState() => _ApiAppState();
}

class _ApiAppState extends State {
  var emplist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Binding"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: emplist.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Text(emplist[index]['employee_name']),
              const SizedBox(
                width: 30,
              ),
              Text("${emplist[index]['employee_salary']}"),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: employeeData,
        child: const Text("Add"),
      ),
    );
  }

  void employeeData() async {
    Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
    http.Response response = await http.get(url);
    log(response.body);
    var responseData = json.decode(response.body);
    //log(responseData);
    setState(() {
      emplist = responseData['data'];
    });
  }
}
// class _ApiAppState extends State<ApiApp> {
//   // Added type parameter to State
//   var emplist = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("API Binding"),
//         centerTitle: true,
//         backgroundColor: Colors.pink,
//       ),
//       body: ListView.builder(
//         itemCount: emplist.length,
//         itemBuilder: (context, index) {
//           return Row(
//             children: [
//               Text(emplist[index]['employee_name']),
//               const SizedBox(
//                 width: 30,
//               ),
//               Text("${emplist[index]['employee_salary']}"),
//             ],
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: employeeData,
//         child: const Text("Add"),
//       ),
//     );
//   }

//   void employeeData() async {
//     Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
//     http.Response response = await http.get(url);
//     var responseData = json.decode(response.body);
//     log(responseData
//         .toString()); // Convert responseData to string before logging
//     setState(() {
//       emplist = responseData['data']; // Update emplist and trigger UI rebuild
//     });
//   }
// }
