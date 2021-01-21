import 'package:flutter/material.dart';
import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is you favourite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Black', 'score': 2},
        {'text': 'Blue', 'score': 3},
        {'text': 'Green', 'score': 1}
      ]
    },
    {
      'questionText': 'What is you favourite car?',
      'answers': [
        {'text': 'BMW', 'score': 2},
        {'text': 'Audi', 'score': 10},
        {'text': 'Benz', 'score': 1},
        {'text': 'Honda', 'score': 4}
      ]
    },
    {
      'questionText': 'What is you favourite pet?',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Dog', 'score': 1},
        {'text': 'Hamster', 'score': 2},
        {'text': 'Parrot', 'score': 2}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.yellow,
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: Text('My First App'),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(_totalScore, _restartQuiz)));
  }
}
