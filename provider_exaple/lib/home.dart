import 'package:flutter/material.dart';
import 'package:provider_exaple/providerscreen.dart';
import 'package:provider/provider.dart';
import 'package:provider_exaple/screen2.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  State createState() => _Homestate();
}

class _Homestate extends State {
  Widget build(BuildContext context) {
    return Consumer<NumProvider>(
      builder: ((context, value, child) => Scaffold(
          body: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: value.datalist.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 50,
                    child: Text(value.datalist[index].toString()),
                  );
                },
              )),
              ElevatedButton(onPressed: (){value.add();}, child: const Text("add"))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){return const Screen2();}));
            },
            child: Icon(Icons.add),
          ))),
    );
  }
}
