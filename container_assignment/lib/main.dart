import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 150,
                    width: 150,
                    color: Colors.teal[400],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 10,
                    ),
                    child: Container(
                      color: Colors.pink,
                    )),
                Container(
                  height: 150,
                  width: 150,
                  color: Colors.red[400],
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  padding: const EdgeInsets.only(
                      right: 10, left: 20, top: 20, bottom: 10),
                  color: Colors.green,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange,
                      width: 5,
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      color: Colors.purple,
                      width: 10,
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.red[200],
                    border: Border.all(
                      color: Colors.black,
                      width: 10,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber, width: 10),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.purple,
                          offset: Offset(30, 30),
                          blurRadius: 8),
                      BoxShadow(
                          color: Colors.green,
                          offset: Offset(20, 20),
                          blurRadius: 8),
                      BoxShadow(
                          color: Colors.orange,
                          offset: Offset(10, 10),
                          blurRadius: 8)
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      color: Colors.pink,
                      width: 5,
                    ),
                    gradient: const LinearGradient(
                      colors: [Colors.red, Colors.green],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
