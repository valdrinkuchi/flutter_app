import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function restHandler;
  Result(this.finalScore, this.restHandler);

  String get resultPhrase {
    String resultText = 'Thank You';
    if (finalScore <= 8) {
      resultText = 'Mehh you could have done better!';
    } else {
      resultText = 'Wow you have a good taste';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(resultPhrase,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          FlatButton(
            child: Text('Restart Quiz!'),
            onPressed: restHandler,
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
