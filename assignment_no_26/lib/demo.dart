/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      
      home:TextFieldDemo(),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

 

  

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  TextFieldDemo: nameController=TextEditingController(),
  void _printData(){
    print("CompanyName${nameController.text}");
  }
  void initState(){
    super.initState();
    nameController.addListener(
      _printData,
    );
  }
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
               
        title:const Text("TextField"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextEditingController:nameController,
          const SizedBox(
            height:30,
          ),
          TextField(
            decoration:InputDecoration(
              border:outlineInputborder,
              borderRadius:BorderRadius.all(Radius.circular(30),
              ),
            ),
              hintText:"Enter Company Name",
          ),

            
            keyboardType:Text,
            onChanged:(valoue),
            ("onChanged:$value"),
            onSubmitted:(value),
            ("onSubmitted:$value")
          ),
        
      );
    
    
  }*/
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: TextFieldDemo(),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  TextEditingController nameController = TextEditingController();

  void _printData() {
    print("CompanyName ${nameController.text}");
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(_printData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              hintText: "Enter Company Name",
            ),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              print("onChanged: $value");
            },
            onSubmitted: (value) {
              print("onSubmitted: $value");
            },
          ),
        ],
      ),
    );
  }
}
