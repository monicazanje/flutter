import 'package:flutter/material.dart';
import 'package:inherited_widget3/main.dart';
import 'package:inherited_widget3/alldata.dart';

class AddSkill extends StatefulWidget {
  const AddSkill({super.key});
  @override
  State<AddSkill> createState() => _AddSkillState();
}

class _AddSkillState extends State<AddSkill> {
  Widget showskill() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Text("Skill:${skillController.text}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Skills"),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: TextField(
                  controller: skillController,
                  decoration: const InputDecoration(
                    hintText: "Enter skill",
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
                height: 30,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.solid),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShowAllData(),
                      ),
                    );
                  },
                  child: const Text("Adds"),
                ),
              ),
              
            ],
          ),
        ));
  }
}
