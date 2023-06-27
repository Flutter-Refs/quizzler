// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: QuizPage(),
            ),
          ),
        ),
      );
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> score = [];
  List<String> questions = [
    "Did the math book look sad because it had too many problems?",
    "Is it possible to \"accidentally\" laugh and snort milk out of your nose?",
    "Can you tickle yourself and genuinely find it funny?",
    "Did the tomato turn red because it saw the salad dressing?",
    "Is it possible to trust a burrito entirely?",
  ];
  List<bool> answers = [true, true, false, false, true];

  int questionIndex = 0;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Question
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questions[questionIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // True btn
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                onPressed: () => setState(
                  () => answerQuestion(true),
                ),
              ),
            ),
          ),
          // False btn
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                onPressed: () => setState(
                  () => answerQuestion(false),
                ),
              ),
            ),
          ),
          Row(children: score)
        ],
      );

  void answerQuestion(bool answer) {
    score.add(
      answers[questionIndex] == answer
          ? Icon(
              Icons.check,
              color: Colors.green,
            )
          : Icon(
              Icons.close,
              color: Colors.red,
            ),
    );

    if (questions.length > questionIndex + 1) {
      questionIndex++;
    }
  }
}
