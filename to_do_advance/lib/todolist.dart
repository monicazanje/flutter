import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'package:to_do_advance/connectivity.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State createState() => _ToDoAppState();
}

class ToDoModelClass {
  int? cardNo;
  String? title;
  String? description;
  String? date;


  ToDoModelClass({this.cardNo,this.title, this.description, this.date});
  Map<String, dynamic> cardMap() {
    return {
      'cardNo':cardNo,
      'title': title,
      'description': description,
      'date': date,
    };
  }

  @override
  String toString() {
    return '{cardNo:$cardNo,title:$title,description:$description,date:$date,}';
  }
}

class _ToDoAppState extends State {
  
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List todolist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 45,
          ),
          Container(
            padding: const EdgeInsets.only(left: 29),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
                Text(
                  "Monika",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
                const SizedBox(
                  height: 45,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 19,
                      bottom: 19,
                    ),
                    child: Text(
                      "CREATE TO DO LIST",
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: const Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 39,
                        ),
                        child: ListView.builder(
                          itemCount: todolist.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              closeOnScroll: true,
                              endActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const DrawerMotion(),
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            child: Container(
                                              //  padding: const EdgeInsets.all(10),
                                              height: 25,
                                              width: 25,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      89, 57, 241, 1),
                                                  shape: BoxShape.circle),
                                              child: const Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                            onTap: () {
                                              editTask(todolist[index]);
                                            },
                                          ),
                                          GestureDetector(
                                            child: Container(
                                              //   padding: const EdgeInsets.all(10),
                                              height: 25,
                                              width: 25,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      89, 57, 241, 1),
                                                  shape: BoxShape.circle),
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                            onTap: () {
                                              removeTask(todolist[index]);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 10, bottom: 10, right: 10),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 52,
                                      width: 52,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromRGBO(217, 217, 217, 1)),
                                      child: Image.network(
                                          "https://cdn-icons-png.flaticon.com/512/8019/8019152.png"),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            todolist[index].title,
                                            style: GoogleFonts.inter(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            todolist[index].title,
                                            style: GoogleFonts.inter(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            todolist[index].date,
                                            style: GoogleFonts.inter(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      activeColor: Colors.green,
                                      value: true,
                                      onChanged: (value) {},
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        clearController();
        showBottomSheet(false);
      }),
    );
  }

  void clearController() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  void submit(bool doedit, [ToDoModelClass? toDoModelClassobj]) {
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (!doedit) {
        setState(() {
          todolist.add(
            ToDoModelClass(
                title: titleController.text.trim(),
                description: descriptionController.text.trim(),
                date: dateController.text.trim()),
          );
        });
      } else {
        setState(() {
          toDoModelClassobj!.date = dateController.text.trim();
          toDoModelClassobj.title = titleController.text.trim();
          toDoModelClassobj.description = descriptionController.text.trim();
        });
      }
    }
    clearController();
  }

  void editTask(toDoModelClassobj) {
    titleController.text = toDoModelClassobj.title;
    descriptionController.text = toDoModelClassobj.description;
    dateController.text = toDoModelClassobj.date;

    showBottomSheet(true, toDoModelClassobj);
  }

  void removeTask(ToDoModelClass toDoModelClassobj) {
    setState(() {
      todolist.remove(toDoModelClassobj);
    });
  }

  void dispose() {
    super.dispose();
    titleController.dispose();
    dateController.dispose();
    descriptionController.dispose();
  }

  void showBottomSheet(bool doedit, [ToDoModelClass? toDoModelClassobj]) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 13,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 26),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Create Task",
                  style: GoogleFonts.quicksand(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: GoogleFonts.quicksand(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.quicksand(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Date",
                      style: GoogleFonts.quicksand(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2015),
                          lastDate: DateTime(2045),
                          initialDate: DateTime.now(),
                        );

                        String formatedDate =
                            DateFormat.yMMMd().format(pickedDate!);
                        setState(() {
                          dateController.text = formatedDate;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      doedit
                          ? submit(doedit, toDoModelClassobj)
                          : submit(doedit);

                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "submit",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
