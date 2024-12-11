import 'package:flutter/cupertino.dart';
import 'question_class.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quizapp/main.dart';

class questionBank {
  int _questionNumber = 1;
  List<Icon> scoreKeeper = [];

  List<question> _questionTexts = [
    question(q: 'Mustafa\'nın 8 ayağı vardır', a: true),
    question(q: 'The Earth is round.', a: true),
    question(q: 'Humans have three arms.', a: false),
    question(q: 'Fish can swim in water.', a: true),
    question(q: 'The Sun is bigger than the Earth.', a: true),
    question(q: 'Bananas are naturally purple.', a: false),
    question(q: 'Birds can fly.', a: true),
    question(q: 'The Moon is made of cheese.', a: false),
    question(q: 'Water freezes at 0°C.', a: true),
    question(q: 'An octopus has eight legs.', a: true),
    question(q: 'There are 25 hours in a day.', a: false),
    question(q: 'Lightning is hotter than the Sun.', a: true),
    question(q: 'Humans can breathe underwater without equipment.', a: false),
    question(q: 'Elephants are the largest land animals.', a: true),
    question(q: 'Cows can jump over the Moon.', a: false),
  ];
  String getQuestions() {
    return _questionTexts[_questionNumber].questiontext;
  }

  bool getCorrectAnswer() {
    return _questionTexts[_questionNumber].questionAnswer;
  }

  void nextQuestion(BuildContext? context) {
    if (_questionTexts.length - 1 > _questionNumber) {
      _questionNumber++;
    } else if (context != null) {
      //This one will work when all the questions are answered
      Alert(
        context: context,
        title: "Congratulations!",
        desc: "You have answered all the questions!!!\n The quiz will reset.",
      ).show();
      resetQuiz();
    }
  }

  void resetQuiz() {
    _questionNumber = 1;
    scoreKeeper.clear();
  }
}
