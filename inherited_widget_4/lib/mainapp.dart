import 'package:flutter/material.dart';
import 'package:inherited_widget_4/main.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State createState() => _MainApp();
}

TextEditingController teamController = TextEditingController();

class _MainApp extends State {
  bool doedit = false;

  void changeteam(bool doedit) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Change Team"),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  controller: teamController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      hintText: "enter team name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: Colors.amber))),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                  ),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () {
                    const Changedata();
                  },
                  child: const Text("Add team"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inherited Widget with log"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: const Center(
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Showclass(),
            SizedBox(
              height: 50,
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeteam(true);
        },
        child: const Text("Add"),
      ),
    );
  }
}

class Showclass extends StatelessWidget {
  const Showclass({super.key});
  @override
  Widget build(BuildContext context) {
    SharedData data = SharedData.of(context);
    return Column(
      children: [
        const SizedBox(),
        Container(
          height: 50,
          width: 300,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid),
          ),
          child: Text(data.obj.name),
        ),
        Container(
          height: 50,
          width: 300,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid),
          ),
          child: Text("${data.obj.jerno}"),
        ),
        Container(
          height: 50,
          width: 300,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid),
          ),
          child: Text("${data.obj.iplTeam}"),
        ),
      ],
    );
  }
}

class Changedata extends StatelessWidget {
  const Changedata({super.key});
  @override
  Widget build(BuildContext context) {
    SharedData data = SharedData.of(context);
    return Column(
      children: [
        const SizedBox(),
        Container(
          height: 50,
          width: 300,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid),
          ),
          child: Text(data.obj.name),
        ),
        Container(
          height: 50,
          width: 300,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid),
          ),
          child: Text("${data.obj.jerno}"),
        ),
        Container(
          height: 50,
          width: 300,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid),
          ),
          child: Text("${teamController.text}"),
        ),
      ],
    );
  }
}
