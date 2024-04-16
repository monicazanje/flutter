// // import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   return runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "To_Do_List",
//       home: ToDoList(),
//     );
//   }
// }

// class ToDoList extends StatefulWidget {
//   const ToDoList({super.key});
//   State createState() => _TODoListState();
// }

// class _TODoListState extends State {
//   final List<Color> colors = [
//     Color.fromARGB(255, 247, 225, 224),
//     Color.fromARGB(255, 220, 233, 244),
//     Color.fromARGB(255, 206, 228, 207),
//     Color.fromARGB(255, 246, 213, 224),
//     Color.fromARGB(255, 246, 243, 221),
//     const Color.fromARGB(255, 231, 195, 237),
//   ];

//   List<String>? text = [
//     "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
//     "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
//     "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         title: Text(
//           "To_Do_List",
//           style: GoogleFonts.lato(),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: colors.length,
//         itemBuilder: (context, index) {
//           return Container(
//             height: 100,
//             width: 100,
//             margin: const EdgeInsets.all(20),
//             color: colors[index],
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Container(
//                         height: 50,
//                         width: 50,
//                         child: Container(
//                           height: 100,
//                           width: 100,
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.teal,
//                           ),
//                           child: Container(
//                               height: 10,
//                               width: 10,
//                               child: Image.network(
//                                   "https://cdn-icons-png.flaticon.com/256/918/918245.png")),
//                         ),
//                       ),
//                       const Text("10 feb 2024")
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 300,
//                   width: 300,
//                   child: const Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text("Lorem Ipsum is simply setting industry. "),
//                       SizedBox(
//                         height: 20,
//                       ),

//                       //Icon(Icons.)
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
