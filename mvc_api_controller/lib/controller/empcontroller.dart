import 'dart:math';

import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:mvc_api_controller/model/empmodel.dart';

class EmpController{
  void employeeData() async {
    Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
    http.Response response = await http.get(url);
    
    var responseData = json.decode(response.body);
    //log(responseData);
    Employeedata empModel = Employeedata(responseData);
    setState(() {
      emplist = empModel.data!;
    });
  }
}