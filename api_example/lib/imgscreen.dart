import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';
import 'package:api_example/employeemodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State createState() => _HomeState();
}

class _HomeState extends State {
   List<Data> mapdata=[];
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Binding"),
      ),
      body: ListView.builder(
        itemCount: mapdata.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Text(mapdata[index].empName!),
              const SizedBox(
                width: 30,
              ),
              Text("${mapdata[index].empsal}"),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: empdata,child: const Text("add"),),
    );
  }
  void empdata()async{
    Uri url=Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
    http.Response responce= await http.get(url);
    log(responce.body);
    var responsedata=json.decode(responce.body);
    Employee obj=Employee(responsedata);
    setState(() { 
      mapdata=obj.data!;
    });
  }
}
