import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inherited_widget3/addskill.dart';
import 'package:inherited_widget3/main.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});
  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    log("log in showdata");
    SharedData sharedDataobj = SharedData.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Data"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.solid),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text("id:  ${sharedDataobj.modelclassobj.id}"),
            ),
            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.solid),
                borderRadius: const BorderRadius.all(

                  
                  Radius.circular(10),
                ),
              ),
              child: Text("name:  ${sharedDataobj.modelclassobj.name}"),
            ),
            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.solid),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child:
                  Text("usserName:  ${sharedDataobj.modelclassobj.username}"),
            ),
            Container(
              height: 30,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: GestureDetector(
                onTap: () {
                  log("log in add button");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddSkill(),
                    ),
                  );
                },
                child: const Text("Add Skills"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
