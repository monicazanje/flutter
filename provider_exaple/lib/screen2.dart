import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exaple/providerscreen.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});
  @override
  State createState() => _Screen3State();
}

class _Screen3State extends State {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumProvider>(builder: (context, value, child) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  value.add();
                },
                child: const Text("add"))
          ],
        ),
      );
    });
  }
}
