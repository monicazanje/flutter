import 'dart:developer';
import 'package:api_model/model/empmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewEmployee extends StatefulWidget {
  const ViewEmployee({super.key});
  @override
  State createState() => _ViewEmployee();
}

class _ViewEmployee extends State {
  List<Data> emplist = [];
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
              Text(emplist[index].empName!),
              const SizedBox(
                width: 30,
              ),
              Text("${emplist[index].empsal}"),
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
    Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/create");
    Map<String, String> datamap = {
      'employee_name': 'monika',
      'employee_age': "21",
      'employee_salary': "2000000",
      'id': "1234567",
      'profile_image': ""
    };

    http.Response response = await http.post(url, body: datamap);
    log(response.body);
    // var responseData = json.decode(response.body);
    // //log(responseData);
    // Employeedata empModel = Employeedata(responseData);
    // setState(() {
    //   emplist = empModel.data!;
    // });
  }
}
