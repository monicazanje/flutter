import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const SharedData(data: 50, child: MaterialApp(home: MainApp()));
  }
}

class SharedData extends InheritedWidget {
  final int data;
  const SharedData({super.key, required this.data, required super.child});
  static SharedData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedData>()!;
  }

  @override
  bool updateShouldNotify(SharedData oldWidget) {
    return data != oldWidget.data;
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    SharedData shareddataobj = SharedData.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("InheritedWidget Demo"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Text("${shareddataobj.data}"),
            const SizedBox(
              height: 20,
            ),
            const AccessDataWidget(),
          ],
        ));
  }
}

class AccessDataWidget extends StatelessWidget {
  const AccessDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SharedData sharedDataobj = SharedData.of(context);
    return Row(
      children: [
        Text("${sharedDataobj.data}"),
        const SizedBox(
          width: 100,
        ),
        const AccessDataChild(),
      ],
    );
  }
}

class AccessDataChild extends StatelessWidget {
  const AccessDataChild({super.key});
  @override
  Widget build(BuildContext context) {
    SharedData shareddataobj = SharedData.of(context);
    return Text("${shareddataobj.data}");
  }
}
