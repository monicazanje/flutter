import 'package:flutter/material.dart';

void main(){
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget{
  const MainApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title:'Srolling View',
      debugShowCheckedModeBanner: false,
      home:ScrollingView(),
      );
  }
}
class ScrollingView extends StatefulWidget{
  const ScrollingView ({super.key});
  State createState()=>_ScrollingViewState();
}

class _ScrollingViewState extends State{

  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Scrolling View"),

      ),
      body:ListView(
        children: [

        ],)
    );
  }
}