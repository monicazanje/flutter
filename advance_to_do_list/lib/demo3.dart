// import 'package:flutter/material.dart';
// //import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// void main() {
//   return runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Advance to do list',
//       home: AdvanceToDo(),
//     );
//   }
// }

// class AdvanceToDo extends StatefulWidget {
//   const AdvanceToDo({super.key});
//   @override
//   State createState() => AdvanceToDoState();
// }

// class SingleModelList {
//   String? title;
//   String? description;
//   String? date;

//   SingleModelList({this.title, this.description, this.date});
// }

// class AdvanceToDoState extends State {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descControlller = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   List cardList = [
//     // SingleModelList(
//     //     title: "asdfghjk", description: "asdfghjkl", date: "12-2-2024"),
//   ];
//   var listOfColors = [
//     const Color.fromARGB(255, 247, 225, 224),
//     const Color.fromARGB(255, 220, 233, 244),
//     const Color.fromARGB(255, 206, 228, 207),
//     const Color.fromARGB(255, 246, 213, 224),
//   ];
//   bool isedit = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 40,
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 40),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Good Morning",
//                   style: GoogleFonts.quicksand(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 22,
//                       color: const Color.fromRGBO(255, 255, 255, 1)),
//                 ),
//                 Text(
//                   "Monika",
//                   style: GoogleFonts.quicksand(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 22,
//                       color: const Color.fromRGBO(255, 255, 255, 1)),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.only(top: 15, bottom: 15),
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(top: 15, bottom: 15),
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(40),
//                         topRight: Radius.circular(40),
//                       ),
//                     ),
//                     child: Text(
//                       "CREATE TO DO LIST",
//                       style: GoogleFonts.quicksand(
//                         fontWeight: FontWeight.w900,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(40),
//                           topRight: Radius.circular(40),
//                         ),
//                         color: Color.fromRGBO(217, 217, 217, 1),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(40),
//                                   topRight: Radius.circular(40),
//                                 ),
//                                 color: Colors.white,
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5),
//                                 child: ListView.builder(
//                                   itemCount: cardList.length,
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     return Slidable(
//                                       closeOnScroll: true,
//                                       endActionPane: ActionPane(
//                                         extentRatio: 0.2,
//                                         motion: const DrawerMotion(),
//                                         children: [
//                                           Expanded(
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(10.0),
//                                               child: Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   GestureDetector(
//                                                     child: Container(
//                                                       //  padding: const EdgeInsets.all(10),
//                                                       height: 25,
//                                                       width: 25,
//                                                       decoration:
//                                                           const BoxDecoration(
//                                                               color: Color
//                                                                   .fromRGBO(
//                                                                       89,
//                                                                       57,
//                                                                       241,
//                                                                       1),
//                                                               shape: BoxShape
//                                                                   .circle),
//                                                       child: const Icon(
//                                                         Icons.edit,
//                                                         color: Colors.white,
//                                                         size: 20,
//                                                       ),
//                                                     ),
//                                                     onTap: () {
//                                                       editTask(cardList[index]);
//                                                     },
//                                                   ),
//                                                   GestureDetector(
//                                                     child: Container(
//                                                       //   padding: const EdgeInsets.all(10),
//                                                       height: 25,
//                                                       width: 25,
//                                                       decoration:
//                                                           const BoxDecoration(
//                                                               color: Color
//                                                                   .fromRGBO(
//                                                                       89,
//                                                                       57,
//                                                                       241,
//                                                                       1),
//                                                               shape: BoxShape
//                                                                   .circle),
//                                                       child: const Icon(
//                                                         Icons.delete,
//                                                         color: Colors.white,
//                                                         size: 20,
//                                                       ),
//                                                     ),
//                                                     onTap: () {
//                                                       removeTask(
//                                                           cardList[index]);
//                                                     },
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 10,
//                                             top: 10,
//                                             bottom: 10,
//                                             right: 10),
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               color: listOfColors[
//                                                   index % listOfColors.length],
//                                               border: Border.all(
//                                                 color: const Color.fromRGBO(
//                                                     0, 0, 0, 1),
//                                               ),
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(10))),
//                                           child: Row(
//                                             // mainAxisAlignment: MainAxisAlignment.start,
//                                             // crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 height: 52,
//                                                 width: 52,
//                                                 decoration: const BoxDecoration(
//                                                     shape: BoxShape.circle,
//                                                     color: Color.fromRGBO(
//                                                         217, 217, 217, 1)),
//                                                 child: Image.network(
//                                                     "https://cdn-icons-png.flaticon.com/512/8019/8019152.png"),
//                                               ),
//                                               const SizedBox(
//                                                 width: 20,
//                                               ),
//                                               Expanded(
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text(
//                                                       cardList[index].title,
//                                                       style: GoogleFonts.inter(
//                                                         fontSize: 20,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         color: const Color
//                                                             .fromRGBO(
//                                                             0, 0, 0, 1),
//                                                       ),
//                                                     ),
//                                                     const SizedBox(
//                                                       height: 8,
//                                                     ),
//                                                     Text(
//                                                       cardList[index].title,
//                                                       style: GoogleFonts.inter(
//                                                         fontSize: 17,
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         color: const Color
//                                                             .fromRGBO(
//                                                             0, 0, 0, 1),
//                                                       ),
//                                                     ),
//                                                     const SizedBox(
//                                                       height: 2,
//                                                     ),
//                                                     Text(
//                                                       cardList[index].date,
//                                                       style: GoogleFonts.inter(
//                                                         fontSize: 10,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         color: const Color
//                                                             .fromRGBO(
//                                                             0, 0, 0, 1),
//                                                       ),
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                               Checkbox(
//                                                 shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(10),
//                                                 ),
//                                                 activeColor: Colors.green,
//                                                 value: true,
//                                                 onChanged: (value) {},
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             showBottomSheet(true);
//           });
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   void clearController() {
//     titleController.clear();
//     descControlller.clear();
//     dateController.clear();
//   }

//   void submit(bool doedit, [SingleModelList? SingleModelClassobj]) {
//     if (titleController.text.trim().isNotEmpty &&
//         descControlller.text.trim().isNotEmpty &&
//         dateController.text.trim().isNotEmpty) {
//       if (!doedit) {
//         setState(() {
//           cardList.add(
//             SingleModelList(
//                 title: titleController.text.trim(),
//                 description: descControlller.text.trim(),
//                 date: dateController.text.trim()),
//           );
//         });
//       } else {
//         setState(() {
//           SingleModelList.date = dateController.text.trim();
//           SingleModelList.title = titleController.text.trim();
//           SingleModelList.description = descControlller.text.trim();
//         });
//       }
//     }
//     clearController();
//   }

//   void editTask(toDoModelClassobj) {
//     titleController.text = toDoModelClassobj.title;
//     descControlller.text = toDoModelClassobj.description;
//     dateController.text = toDoModelClassobj.date;

//     showBottomSheet(true, toDoModelClassobj);
//   }

//   void removeTask(SingleModelList toDoModelClassobj) {
//     setState(() {
//       cardList.remove(toDoModelClassobj);
//     });
//   }

//   void dispose() {
//     super.dispose();
//     titleController.dispose();
//     dateController.dispose();
//     descControlller.dispose();
//   }

//   void showBottomSheet(bool isedit, [SingleModelList? singleModelListObj]) {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       isDismissible: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//       ),
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             left: 20,
//             right: 20,
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 " Create Task",
//                 style: GoogleFonts.quicksand(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 22,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Title",
//                     style: GoogleFonts.quicksand(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 15,
//                         color: const Color.fromRGBO(0, 139, 148, 1)),
//                   ),
//                   TextFormField(
//                     controller: titleController,
//                     decoration: InputDecoration(
//                       hintText: "Enter Title",
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Color.fromRGBO(0, 139, 148, 1),
//                           ),
//                           borderRadius: BorderRadius.circular(20)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                               color: Color.fromRGBO(0, 139, 148, 1),
//                               width: 0.5),
//                           borderRadius: BorderRadius.circular(5)),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     style: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12,
//                         color: Color.fromRGBO(0, 0, 0, .7)),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Description",
//                     style: GoogleFonts.quicksand(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 15,
//                         color: const Color.fromRGBO(0, 139, 148, 1)),
//                   ),
//                   TextField(
//                     controller: descControlller,
//                     decoration: InputDecoration(
//                       hintText: "Enter Description",
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Color.fromRGBO(0, 139, 148, 1),
//                           ),
//                           borderRadius: BorderRadius.circular(20)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                               color: Color.fromRGBO(0, 139, 148, 1),
//                               width: 0.5),
//                           borderRadius: BorderRadius.circular(5)),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     style: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12,
//                         color: Color.fromRGBO(0, 0, 0, .7)),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Date",
//                     style: GoogleFonts.quicksand(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 15,
//                         color: const Color.fromRGBO(0, 139, 148, 1)),
//                   ),
//                   TextField(
//                     onTap: () async {
//                       DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2024),
//                           lastDate: DateTime(2025));
//                       String formatedDate =
//                           DateFormat.yMd().format(pickedDate!);

//                       setState(() {
//                         dateController.text = formatedDate;
//                       });
//                     },
//                     controller: dateController,
//                     readOnly: true,
//                     decoration: InputDecoration(
//                       hintText: "Enter Date",
//                       suffixIcon: const Icon(Icons.date_range_rounded),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Color.fromRGBO(0, 139, 148, 1),
//                           ),
//                           borderRadius: BorderRadius.circular(20)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                               color: Color.fromRGBO(0, 139, 148, 1),
//                               width: 0.5),
//                           borderRadius: BorderRadius.circular(5)),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 40,
//                 width: 200,
//                 margin: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(13),
//                       ),
//                       backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text(
//                       "Submit",
//                       style: GoogleFonts.inter(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 20),
//                     )),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
