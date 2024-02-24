import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizeApp(),
    );
  }
}

class QuizeApp extends StatefulWidget {
  const QuizeApp({super.key});
  @override
  State<QuizeApp> createState() => _QuizeAppState();
}

class SingleQuestionModel {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class _QuizeAppState extends State<QuizeApp> {
  List allQuestions = [
    const SingleQuestionModel(
      question:
          "Which programming language is used to build Flutter applications?",
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
    const SingleQuestionModel(
      question:
          "What element is used as an identifier for components when programming in Flutter?",
      options: ["Widgets", " Keys", "Elements", "Serial"],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question: "What type of test can examine your code as a complete system?",
      options: [
        "Unit tests",
        " Widget tests",
        "Integration Tests",
        "All of the above"
      ],
      answerIndex: 2,
    ),
    const SingleQuestionModel(
      question:
          "What type of Flutter animation allows you to represent real-world behavior?",
      options: ["Physics-based", " Maths-based", " Graph-based", "Sim-based"],
      answerIndex: 0,
    ),
    const SingleQuestionModel(
      question:
          "What is the key configuration file used when building a Flutter project?",
      options: ["pubspec.yaml", " pubspec.xml", "config.html", "root.xml"],
      answerIndex: 0,
    ),
    const SingleQuestionModel(
      question:
          "Which component allows us to specify the distance between widgets on the screen?",
      options: ["SafeArea", " SizedBox", " table", "AppBar"],
      answerIndex: 1,
    )
  ];

  bool questionScreen = true;
  int questionIndex = 0;
  int selectAnswerIndex = -1;
  int correctAns = 0;

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

  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizeApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.orange,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal[900],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Question number :",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: 700,
              child: Text(
                allQuestions[questionIndex].question,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(0),
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(300.0, 40.0),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  const Size(300.0, 40.0),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  const Size(300.0, 40.0),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  const Size(300.0, 40.0),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
              child: Text(allQuestions[questionIndex].options[3],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  )),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              validationScreen();
            });
          },
          child: const Icon(
            Icons.forward,
            color: Colors.orange,
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
              color: Colors.orange,
            ),
          ),
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
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Congratulations!! you have successfuly completed all quize",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              const SizedBox(height: 20),
              const Text(
                "Your Score is ",
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
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: const Text(
                  "RESTART",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
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
