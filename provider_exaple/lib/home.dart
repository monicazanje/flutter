import 'package:flutter/material.dart';
import 'package:provider_exaple/providerscreen.dart';
import 'package:provider/provider.dart';

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
              ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              value.add();
            },
            child: Icon(Icons.add),
          ))),
    );
  }
}
