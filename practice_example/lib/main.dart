import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myapp(),
    );
  }
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Example",
          style: TextStyle(
              color: Colors.orange, fontWeight: FontWeight.w600, fontSize: 30),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        actions: const [
          Icon(Icons.favorite_outline),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 200,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(border: Border.all(style: BorderStyle.solid)),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(style: BorderStyle.solid),
                        image: const DecorationImage(
                            image: AssetImage("assets/Rectangle 984.png"),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  const Text("Monika")
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showBottomSheet();
          });
        },
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Text("add"),
      ),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentindex = index;
            });
          },
          indicatorColor: Colors.amber,
          selectedIndex: currentindex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }

  int currentindex = 0;

  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();

  void showBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(30),
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
              TextField(
                controller: date,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.green)),
                ),
                onTap: () async {
                  DateTime? pickdate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2025),
                  );
                  String formatdata = DateFormat.yMMMd().format(pickdate!);
                  setState(() {
                    date.text = formatdata;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
