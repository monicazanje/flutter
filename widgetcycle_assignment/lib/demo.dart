import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WidgetTree(),
    );
  }
}

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeDemo();
}

class _WidgetTreeDemo extends State<WidgetTree> {
  int _num = 0;
  bool homescreen = true;

  @override
  void initState() {
    super.initState();
    print("in Init State");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print("In DidChange Dependencied");
  }

  Scaffold isHomeScreen() {
    if (homescreen == true) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: Text(
                "number : $_num",
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  onUserInterface();
                },
                child: const Text("Add"),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          homescreen = false;
          onUserInterface();
        }),
      );
    } else {
      return Scaffold(
        body: Container(
          height: 200,
          width: 200,
          margin: const EdgeInsets.all(50),
          child: const Text(
            "data",
            style: TextStyle(fontSize: 30),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("in build");
    return isHomeScreen();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("in update widget");
  }

  @override
  void onUserInterface() {
    setState(() {
      _num++;
      print("in set STate");
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    print("print In deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("in despose");
  }
}