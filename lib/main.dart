import 'package:first_app/question.dart';
import 'package:flutter/material.dart';
import 'package:first_app/answer.dart';

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
      'answers': ['Red', 'Black', 'White', 'Blue']
    },
    {
      'questionText': 'What is you favourite car?',
      'answers': ['Audi', 'BMW', 'Honda', 'Toyota']
    }
  ];

  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Column(
                  children: [
                    Question(_questions[_questionIndex]['questionText']),
                    ...(_questions[_questionIndex]['answers'] as List<String>)
                        .map((answer) {
                      return Answer(_answerQuestion, answer);
                    }).toList()
                  ],
                )
              : Center(
                  child: Text('Thank You!'),
                )),
    );
  }
}
