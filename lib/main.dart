import 'dart:ffi';
import 'package:quizapp/questionBank.dart';
import 'questionBank.dart';
import 'question_class.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(quizapp());
}

class quizapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF210f04),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: quizpage(),
          ),
        ),
      ),
    );
  }
}

class quizpage extends StatefulWidget {
  @override
  State<quizpage> createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
  @override
  questionBank bank1 = questionBank();

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = bank1.getCorrectAnswer();
    if (userPickedAnswer == correctAnswer) {
      bank1.scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      bank1.scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                bank1.getQuestions(),
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Iceland',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  //The user picked false
                  checkAnswer(false);
                  bank1.nextQuestion(context);
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color(0xFFDB222A),
                ),
              ),
              child: Text(
                'false',
                style: TextStyle(
                  fontFamily: 'Unna',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  //User picked true
                  checkAnswer(true);
                  bank1.nextQuestion(context);
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color(0xFF245501),
                ),
              ),
              child: Text(
                'true',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Unna',
                ),
              ),
            ),
          ),
        ),
        Row(
          children: bank1.scoreKeeper,
        ),
      ],
    );
  }
}
