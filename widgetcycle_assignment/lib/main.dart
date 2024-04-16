import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WidgetCycle',
      home: WidgetCycle(),
    );
  }
}

class WidgetCycle extends StatefulWidget {
  const WidgetCycle({super.key});
  State createState() => _WidgetCycleState();
}

class _WidgetCycleState extends State {
  int _counter = 0;

  void initState() {
    super.initState();
    print("in initstate");
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    print("in didChangeDependencies");
  }

  bool changeScaffold = true;
  Scaffold widgetCycle() {
    if (changeScaffold = true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("WidgetCycle"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("counter"),
              Text("$_counter"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            changeScaffold = false;
            onUserInput();

           

            //deactivate();
            //dispose(),
          },
          child: const Icon(Icons.add),
        ),
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
    return widgetCycle();
  }

  void didUpdateWidget(WidgetCycle) {
    super.didUpdateWidget(widgetCycle());
    print("in update widget");
  }

  void onUserInput() {
    super.setState(() {
      _counter++;
      print("in increment setState");
    });
  }

  void deactivate() {
    super.deactivate();
    print("deactivate state");
  }

  void dispose() {
    super.dispose();
    print("dispose state");
  }
}
