import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  List<String> imageList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdPYFxkzwUYh0POQcJfxRR4GjkEZUw7_q4Ww&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT35HYtO9g1X0jQdyepdra2CWR53XuQVFcZDw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqQMwq_mZ2I9qpXPhmIeJ5on2jZTavrF65Kw&usqp=CAU",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("ListView Builder Demo"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: const Text("Add"),
        ),
        body: ListView.builder(
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (counter >= 1)
                    ? Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.network(
                          imageList[0],
                        ),
                      )
                    : Container(),
                (counter >= 2)
                    ? Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.network(
                          imageList[1],
                        ),
                      )
                    : Container(),
                (counter >= 2)
                    ? Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.network(
                          imageList[2],
                        ),
                      )
                    : Container(),
              ],
            ));
          },
        ),
      ),
    );
  }
}
