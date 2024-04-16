import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      title: 'Advance to do list',
      home: AdvanceToDo(),
    );
  }
}

class AdvanceToDo extends StatefulWidget {
  const AdvanceToDo({super.key});
  @override
  State createState() => AdvanceToDoState();
}

class SingleModelList {
  String title;
  String description;
  String date;

  SingleModelList(
      {required this.title, required this.description, required this.date});
}

class AdvanceToDoState extends State {
  TextEditingController titleController = TextEditingController();
  TextEditingController descControlller = TextEditingController();
  TextEditingController dateController = TextEditingController();
  List cardList = [
    SingleModelList(
        title: "asdfghjk", description: "asdfghjkl", date: "sdfghjkl"),
  ];
  var listOfColors = [
    const Color.fromARGB(255, 247, 225, 224),
    const Color.fromARGB(255, 220, 233, 244),
    const Color.fromARGB(255, 206, 228, 207),
    const Color.fromARGB(255, 246, 213, 224),
  ];
  bool isedit = false;

  void showBottomSheet(bool isedit, [SingleModelList? singleModelListObj]) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                " Create Task",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: const Color.fromRGBO(0, 139, 148, 1)),
                  ),
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: "Enter Title",
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(0, 139, 148, 1),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color.fromRGBO(0, 0, 0, .7)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Description",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: const Color.fromRGBO(0, 139, 148, 1)),
                  ),
                  TextField(
                    controller: descControlller,
                    decoration: InputDecoration(
                      hintText: "Enter Description",
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(0, 139, 148, 1),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color.fromRGBO(0, 0, 0, .7)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Date",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: const Color.fromRGBO(0, 139, 148, 1)),
                  ),
                  TextField(
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
                    controller: dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Enter Date",
                      suffixIcon: const Icon(Icons.date_range_rounded),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(0, 139, 148, 1),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 200,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Submit",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    )),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: const EdgeInsets.only(top: 20.0),
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.purple,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
            ),
            Container(
              padding: const EdgeInsets.only(left: 29),
              child: Column(
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
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Text(
                          "CREATE TO DO LIST",
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: ListView.builder(
                              itemCount: cardList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: listOfColors[
                                            index % listOfColors.length],
                                        border: Border.all(
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 52,
                                              width: 52,
                                              margin: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                ),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Color.fromRGBO(
                                                          2, 167, 177, 1),
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
                                                  Text(cardList[index]
                                                      .description),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
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
                                            const Spacer(flex: 1),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  child: const Icon(Icons.edit),
                                                  onTap: () {},
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                  child:
                                                      const Icon(Icons.delete),
                                                  onTap: () {
                                                    setState(() {
                                                      // deleteTask(cardList[index]);
                                                    });
                                                  },
                                                ),
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
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showBottomSheet(true);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
