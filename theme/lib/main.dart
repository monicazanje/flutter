import 'package:flutter/material.dart';

void main() {
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          background: Colors.grey,
          primary: Colors.pink,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.blue,
            fixedSize: const Size(300, 10),
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.red,
            fontSize: 26.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
      home: const ThemeApp(title: "flutter Demo Home Page"),
    );
  }
}

class ThemeApp extends StatefulWidget {
  const ThemeApp({super.key, required this.title});
  final String title;

  State<ThemeApp> createState() => _ThemeAppState();
}

class _ThemeAppState extends State<ThemeApp> {
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
        //backgroundColor: Colors.black,
        //foregroundColor: Colors.white,
        // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have push the button many times',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text('$_counter', style: Theme.of(context).textTheme.headlineLarge),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "My Button",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
