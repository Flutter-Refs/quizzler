// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quizzler/quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  List<Icon> _score = [];
  Quiz _quiz = Quiz();

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
                  _quiz.getQuestionText,
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
                onPressed: () => answerQuestion(true),
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
                onPressed: () => answerQuestion(false),
              ),
            ),
          ),
          Row(children: _score)
        ],
      );

  void answerQuestion(bool answer) {
    _score.add(
      _quiz.getQuestionAnswer == answer
          ? Icon(
              Icons.check,
              color: Colors.green,
            )
          : Icon(
              Icons.close,
              color: Colors.red,
            ),
    );

    setState(() {
      _quiz.nextQuestion();
      if (_quiz.isQuizFinished) {
        showAlert();
      }
    });
  }

  void showAlert() => Alert(
        context: context,
        type: AlertType.success,
        title: "QUIZ END",
        desc: "You completed the quiz",
        buttons: [
          DialogButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
                _quiz = Quiz();
                _score = <Icon>[];
              });
            },
            width: 120,
            child: Text(
              "COOL",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )
        ],
      ).show();
}
