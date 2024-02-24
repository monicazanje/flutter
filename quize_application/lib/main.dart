import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State createState() => _HomePageState();
}

class SingleQuestionModel {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class _HomePageState extends State {
  List allQuestions = [
    const SingleQuestionModel(
      question:
          " Which programming language is used to build Flutter applications?",
      options: ["Kotlin", "Dart", "Java", "Go"],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question: "How many types of widgets are there in Flutter?",
      options: ["1", "4", "2", "8"],
      answerIndex: 2,
    ),
    const SingleQuestionModel(
      question:
          "When building for iOS, Flutter is restricted to an __ compilation strategy",
      options: [
        "AOT (ahead-of-time)",
        "JIT (Just-in-time)",
        "Transcompilation",
        "Recompilation"
      ],
      answerIndex: 0,
    ),
    const SingleQuestionModel(
      question: "A sequence of asynchronous Flutter events is known as a:",
      options: ["Flow", "Current", "Stream", "Series"],
      answerIndex: 2,
    ),
    const SingleQuestionModel(
      question:
          "Access to a cloud database through Flutter is available through which service?",
      options: ["SQLite", " Firebase Database", " NOSQL", "MYSQL"],
      answerIndex: 1,
    ),
  ];

  bool questionScreen = false;
  int questionIndex = 0;
  int selectAnswerIndex = -1;
  int correctAns = 0;
  bool HomePage = true;
  String name = '';
  bool flag = true;

  Container card() {
    if (flag == true) {
      return Container(
        child: Column(children: [
          Text(
            "${_namesTextEditingController.text}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
      );
    } else {
      return Container();
    }
  }

  MaterialStateProperty<Color?> checkAnswer(int button) {
    if (selectAnswerIndex != -1) {
      if (button == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (button == selectAnswerIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void validationScreen() {
    if (selectAnswerIndex == -1) {
      return;
    }
    if (selectAnswerIndex == allQuestions[questionIndex].answerIndex) {
      correctAns += 1;
    }
    if (selectAnswerIndex != -1) {
      if (questionIndex == allQuestions.length - 1) {
        questionScreen = false;
      }

      selectAnswerIndex = -1;
      setState(() {
        questionIndex += 1;
      });
    }
  }

  final TextEditingController _namesTextEditingController =
      TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  Scaffold isQuestionScreen() {
    if (HomePage == true) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 1, 158, 142),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 235, 225, 237),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tech ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '       Quize... ',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              const Text(
                "Enter Your Name",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromARGB(255, 235, 225, 237),
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                width: 500,
                child: TextField(
                  controller: _namesTextEditingController,
                  focusNode: _nameFocusNode,
                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 12),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 235, 225, 237),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                  ),
                  cursorColor: const Color.fromARGB(255, 235, 225, 237),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    name = value;
                    print("Value=$value");
                  },
                  onSubmitted: (val) {
                    name = val;
                    print("DATA SUBMITTED =$val");
                  },
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 233, 231, 231),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(200.0, 40.0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    HomePage = false;
                    questionScreen = true;
                  });
                },
                child: const Text("START",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        )),
      );
    } else if (HomePage == false && questionScreen == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizeApp",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 235, 225, 237),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 1, 158, 142),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 30,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 235, 225, 237),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 54, 49).withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(4, 2),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Question number :",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "${questionIndex + 1}/${allQuestions.length}",
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 500,
                width: 400,
                //color: Colors.teal,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 1, 158, 142),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 54, 49).withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(4, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 400,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 225, 237),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 1, 104, 93)
                                .withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(4, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        allQuestions[questionIndex].question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 350,
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 225, 237),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 1, 104, 93)
                                .withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(4, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: checkAnswer(0),
                              fixedSize: MaterialStateProperty.all<Size>(
                                const Size(300.0, 50.0),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (selectAnswerIndex == -1) {
                                setState(() {
                                  selectAnswerIndex = 0;
                                });
                              }
                            },
                            child: Text(allQuestions[questionIndex].options[0],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: checkAnswer(1),
                              fixedSize: MaterialStateProperty.all<Size>(
                                const Size(300.0, 50.0),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (selectAnswerIndex == -1) {
                                setState(() {
                                  selectAnswerIndex = 1;
                                });
                              }
                            },
                            child: Text(allQuestions[questionIndex].options[1],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: checkAnswer(2),
                              fixedSize: MaterialStateProperty.all<Size>(
                                const Size(300.0, 50.0),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (selectAnswerIndex == -1) {
                                setState(() {
                                  selectAnswerIndex = 2;
                                });
                              }
                            },
                            child: Text(allQuestions[questionIndex].options[2],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: checkAnswer(3),
                              fixedSize: MaterialStateProperty.all<Size>(
                                const Size(300.0, 50.0),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (selectAnswerIndex == -1) {
                                setState(() {
                                  selectAnswerIndex = 3;
                                });
                              }
                            },
                            child: Text(
                              allQuestions[questionIndex].options[3],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 1, 158, 142),
          onPressed: () {
            setState(() {
              validationScreen();
            });
          },
          child: const Icon(
            Icons.forward,
            color: Color.fromARGB(255, 235, 225, 237),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Score Card",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 235, 225, 237),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 1, 158, 142),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzBFwaq8pD1IIaz3GynwsoRgtr0tAASNWYyg&usqp=CAU",
                height: 400,
                width: 300,
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              const Text(
                "Congratulations!! you have successfuly completed all quize",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              const SizedBox(height: 20),
              card(),
              const Text(
                "   Your Score is ",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Text(
                "$correctAns/${allQuestions.length}",
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  selectAnswerIndex = -1;
                  correctAns = 0;
                  questionIndex = 0;
                  questionScreen = true;
                  setState(() {});
                },
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 1, 158, 142),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: const Text(
                  "RESTART",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color.fromARGB(255, 235, 225, 237),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
