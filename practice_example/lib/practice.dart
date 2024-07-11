import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController name = TextEditingController();
  TextEditingController img = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("category")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> datamap =
                                snapshot.data!.docs[index].data();
                            return Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                      datamap['image'],
                                    ),
                                  ),
                                  Text(datamap['name'])
                                ],
                              ),
                            );
                          });
                    } else {
                      return const Text("No Data");
                    }
                  } else {
                    return const Text("error is occure");
                  }
                },
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("category")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> imfomap =
                              snapshot.data!.docs[index].data();
                          return Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(
                                    imfomap['image'],
                                  ),
                                ),
                                Text(imfomap['name'])
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Text("no data");
                    }
                  } else {
                    return const Text("no any data is available");
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: img,
                    decoration: const InputDecoration(labelText: 'Image URL'),
                  ),
                  TextField(
                    controller: name,
                    decoration: const InputDecoration(labelText: 'name'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection("category")
                          .add(
                        {'image': img.text, 'name': name.text},
                      );
                      name.clear();
                      img.clear();
                    },
                    child: const Text("add"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
