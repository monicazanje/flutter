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
      title: 'practice App',
      home: Practice(),
    );
  }
}

class Practice extends StatefulWidget {
  const Practice({super.key});
  State createState() => _PracticeState();
}

class _PracticeState extends State {
  final TextEditingController _namedController = TextEditingController();
  final FocusNode _namedFocusNode = FocusNode();
  String name = '';
  bool flag = false;

  Container card() {
    if (flag == true) {
      return Container(
        height: 50,
        width: 200,
        child: Column(
          children: [
            Text("${_namedController.text}"),
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
        title: const Text(
          "TextField Practice",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 300,
              //color: Colors.amber,
              child: TextField(
                  controller: _namedController,
                  focusNode: _namedFocusNode,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'enter name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    name = value;
                    print("name :$value");
                  },
                  onSubmitted: (val) {
                    name = val;
                    print("Submitted name :$name");
                  }
                  //style: MaterialStateTextStyle
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  flag = true;
                });
              },
              child: const Text("submit"),
            ),
            const SizedBox(
              height: 30,
            ),
            card(),
          ],
        ),
      ),
    );
  }
}
