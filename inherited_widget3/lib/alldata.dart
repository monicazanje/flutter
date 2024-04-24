import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inherited_widget3/main.dart';

class ShowAllData extends StatelessWidget {
  const ShowAllData({super.key});
  Widget build(BuildContext context) {
    log("log in alldata");
    SharedData sharedDataobj = SharedData.of(context);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("${sharedDataobj.modelclassobj.id}"),
        Text("${sharedDataobj.modelclassobj.name}"),
        Text("${sharedDataobj.modelclassobj.username}"),
        Text("${skillController.text}")
      ],
    ));
  }
}
