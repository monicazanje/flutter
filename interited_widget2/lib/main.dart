import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const SharedData(
      name: "monika",
      marks: 88,
      child: MaterialApp(
        home: MainApp(),
      ),
    );
  }
}

class SharedData extends InheritedWidget {
  final String name;
  final int marks;
  const SharedData(
      {super.key,
      required this.name,
      required this.marks,
      required super.child});

  static SharedData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedData>()!;
  }

  @override
  bool updateShouldNotify(SharedData oldWidget) {
    return marks != oldWidget;
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
          title: const Text("InheritedWidget"),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Hi ${shareddataobj.name}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "name :${shareddataobj.name}",
                    ),
                    Text(
                      "Marks:${shareddataobj.marks}",
                    ),
                    const SizedBox(
                      height: 300,
                    ),
                    const AccessData(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class AccessData extends StatelessWidget {
  const AccessData({super.key});
  @override
  Widget build(BuildContext context) {
    //SharedData shareddataobj = SharedData.of(context);
    return const Column(
      children: [
        Text(
          "Congratulations",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        AccessDataChild(),
        
      ],
    );
  }
}

class AccessDataChild extends StatelessWidget {
  const AccessDataChild({super.key});
  @override
  Widget build(BuildContext context) {
    SharedData shareddataobj = SharedData.of(context);

    return Text(
        "${shareddataobj.name} you have achive marks ${shareddataobj.marks} out of 100");
  }
}
