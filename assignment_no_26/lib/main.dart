import 'package:flutter/material.dart';

void main() {
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: TextFieldApp(title: "Add Text"),
    );
  }
}

class TextFieldApp extends StatefulWidget {
  const TextFieldApp({super.key, required this.title});
  final String title;
  @override
  State<TextFieldApp> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
  final TextEditingController _namesTextEditingController1 =
      TextEditingController();
  final FocusNode _nameFocusNode1 = FocusNode();
  final TextEditingController _namesTextEditingController2 =
      TextEditingController();
  final FocusNode _nameFocusNode2 = FocusNode();
  final TextEditingController _namesTextEditingController3 =
      TextEditingController();
  final FocusNode _nameFocusNode3 = FocusNode();
  String name = " ";
  bool flag = false;

  Container isflag() {
    if (flag == true) {
      return Container(
        height: 300,
        width: 300,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "name :${_namesTextEditingController1.text}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "company Name:${_namesTextEditingController2.text}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Address:${_namesTextEditingController3.text}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: _namesTextEditingController1,
            focusNode: _nameFocusNode1,
            decoration: InputDecoration(
              hintText: "enter name",
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
            cursorColor: Colors.amber,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            onChanged: (value1) {
              name = value1;
            },
            onSubmitted: (val) {
              print("DATA SUBMITTED =$val");
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: _namesTextEditingController2,
            focusNode: _nameFocusNode2,
            decoration: InputDecoration(
              hintText: "company name",
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
            cursorColor: Colors.amber,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            onChanged: (value2) {
              name = value2;
              print("Value=$value2");
            },
            onSubmitted: (val) {
              print("DATA SUBMITTED =$val");
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: _namesTextEditingController3,
            focusNode: _nameFocusNode3,
            //controller.addlisterner
            decoration: InputDecoration(
              hintText: "enter location",
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
            cursorColor: Colors.amber,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            onChanged: (value3) {
              name = value3;
            },
            onSubmitted: (val) {
              print("DATA SUBMITTED =$val");
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  flag = true;
                });
              },
              child: const Text("Submit"),
            ),
          ),
          
          isflag(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("Add"),
      ),
    );
  }
}
