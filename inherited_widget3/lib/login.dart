import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inherited_widget3/main.dart';
import 'package:inherited_widget3/showdata.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    log("log in login");
    SharedData sharedDataobj = SharedData.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Inherited Widget"),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
        body: Center(
          
          child: Column(
            children: [
              
              Container(
                margin: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                    hintText: "Enter id",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "Enter name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: "Enter username",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
                    log("log in button of submit");
                    sharedDataobj.modelclassobj.id =
                        int.parse(idController.text);
                    sharedDataobj.modelclassobj.name = nameController.text;
                    sharedDataobj.modelclassobj.username =
                        usernameController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShowData(),
                      ),
                    );
                  },
                  child: const Text("Submit"),
                ),
              )
            ],
          ),
        ));
  }
}
