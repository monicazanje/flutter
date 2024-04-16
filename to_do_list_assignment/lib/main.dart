import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To_Do_List",
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});
  @override
  State createState() => _TODoListState();
}

class SingleModelList {
  String title;
  String description;
  String date;

  SingleModelList(
      {required this.title, required this.description, required this.date});
}

class _TODoListState extends State {
  final List<Color> colors = [
    const Color.fromARGB(255, 247, 225, 224),
    const Color.fromARGB(255, 220, 233, 244),
    const Color.fromARGB(255, 206, 228, 207),
    const Color.fromARGB(255, 246, 213, 224),
  ];

  List cardList = [
    SingleModelList(
        title: " morning",
        description: " prepare for upcoming meeting",
        date: "12-01-2024 "),
    SingleModelList(
        title: " morning",
        description: " attend daily standup meeting with team",
        date: "12-01-2024 "),
    SingleModelList(
        title: " afternoon",
        description: " analyze customer feedback",
        date: "12-01-2024 "),
  ];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descFocusNode = FocusNode();
  final FocusNode dateFocusNode = FocusNode();

  void submit(bool doedit, [SingleModelList? obj]) {
    if (titleController.text.trim().isNotEmpty &&
        descController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (!doedit) {
        setState(() {
          cardList.add(
            SingleModelList(
              title: titleController.text.trim(),
              description: descController.text.trim(),
              date: dateController.text.trim(),
            ),
          );
        });
      } else {
        setState(() {
          obj!.date = dateController.text.trim();
          obj.description = descController.text.trim();
          obj.title = titleController.text.trim();
        });
      }
    }
    clearController();
  }

  void clearController() {
    titleController.clear();
    descController.clear();
    dateController.clear();
  }

  void removeTasks(SingleModelList obj) {
    setState(() {
      cardList.remove(obj);
    });
  }

  void editTask(SingleModelList obj) {
    titleController.text = obj.title;
    descController.text = obj.description;
    dateController.text = obj.date;

    toDoModel(true, obj);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descController.dispose();
    dateController.dispose();
  }

  void toDoModel(bool doedit, [SingleModelList? obj]) {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (builder) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Create Task",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: const Color.fromRGBO(0, 139, 148, 1),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: const Color.fromRGBO(0, 139, 148, 1)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, .7),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Description",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: const Color.fromRGBO(0, 139, 148, 1)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: descController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, .7),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Date",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: const Color.fromRGBO(0, 139, 148, 1)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: dateController,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2025));

                          String formatedDate =
                              DateFormat.yMd().format(pickedDate!);

                          setState(() {
                            dateController.text = formatedDate;
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(0, 139, 148, 1),
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(0, 139, 148, 1),
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: const Icon(Icons.date_range_rounded),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, .7),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      doedit ? submit(doedit, obj) : submit(doedit);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 139, 148, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.quicksand(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //************************************************************************************************** */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 156, 248),
        title: Text(
          "To_Do_List",
          style: GoogleFonts.lato(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  border: Border.all(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                  // boxShadow: const [
                  //   BoxShadow(
                  //       // color: colors[index % colors.length],
                  //       color: Colors.pink,
                  //       blurRadius: 10,
                  //       blurStyle: BlurStyle.solid)
                  // ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(2, 167, 177, 1),
                                  blurRadius: 10),
                            ],
                          ),
                          child: Image.network(
                              "https://cdn-icons-png.flaticon.com/512/8019/8019152.png"),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(cardList[index].title),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(cardList[index].description),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          cardList[index].date,
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                editTask(cardList[index]);
                              },
                              child: const Icon(Icons.edit),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                removeTasks(cardList[index]);
                              },
                              child: const Icon(Icons.delete),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 235, 156, 248),
        onPressed: () {
          setState(() {
            clearController();
            toDoModel(false);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
