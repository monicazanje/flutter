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
      home: TextFieldApp(title: "Add Memes"),
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
  final TextEditingController _namesTextEditingController =
      TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: _namesTextEditingController,
            focusNode: _nameFocusNode,
            decoration: InputDecoration(
              hintText: "Enter Name",
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.purple,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.pink),
              ),
            ),
            cursorColor: Colors.amber,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              print("Value=$value");
            },
            onSubmitted: (val) {
              print("DATA SUBMITTED =$val");
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("Add"),
      ),
    );
  }
}
