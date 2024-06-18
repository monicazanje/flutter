
import 'package:mvc_api_controller/model/empmodel.dart';
import 'package:flutter/material.dart';
import 'package:mvc_api_controller/controller/empcontroller.dart';
import 'package:http/http.dart' as http;


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
        onPressed: EmpController.employeeData,
        child: const Text("Add"),
      ),
    );
  }

  // void employeeData() async {
  //   Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
  //   http.Response response = await http.get(url);
  //   //log(response.body);
  //   var responseData = json.decode(response.body);
  //   //log(responseData);
  //   Employeedata empModel = Employeedata(responseData);
  //   setState(() {
  //     emplist = empModel.data!;
  //   });
  // }
}
