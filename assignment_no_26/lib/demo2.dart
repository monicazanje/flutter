import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Portfoilio(),
    );
  }
}

class Portfoilio extends StatefulWidget {
  const Portfoilio({super.key});

  @override
  State createState() => _PortfoilioState();
}

class _PortfoilioState extends State {
  final TextEditingController _nameTextController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _companynameTextController =
      TextEditingController();
  final FocusNode _companyfocusNode = FocusNode();

  final TextEditingController _locationnameTextController =
      TextEditingController();
  final FocusNode _loctionfocusNode = FocusNode();

  bool flag = false;

  Container card() {
    if (flag == true) {
      return Container(
        height: 300,
        width: 300,
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.brown),
        child: Column(
          children: [
            Text(
              "Name: ${_nameTextController.text}",
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              "Name: ${_companynameTextController.text}",
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              "Name: ${_locationnameTextController.text}",
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text(
          "Portfolio",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        actions: const [Icon(Icons.logout)],
        centerTitle: true,
        backgroundColor: Colors.blue,
        //  foregroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            child: Text(
              "Name :",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ),
          TextField(
            controller: _nameTextController,
            focusNode: _focusNode,
            autofocus: true,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: "Enter your Name",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.red,
              )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            child: Text(
              "Company Name :",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ),
          TextField(
            controller: _companynameTextController,
            focusNode: _companyfocusNode,
            autofocus: true,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: "Enter company name",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            child: Text(
              "Location :",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ),
          TextField(
            controller: _locationnameTextController,
            focusNode: _loctionfocusNode,
            autofocus: true,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: "company Location",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.red,
              )),
            ),
          ),
          const SizedBox(
            height: 20,
            width: 20,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  flag = true;
                });
              },
              child: const Text("Submit"),
            ),
          ),
          card(),
        ],
      ),
    );
  }
}