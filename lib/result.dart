import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _resultScore;
  final Function _resetQuiz;

  Result(this._resultScore, this._resetQuiz);

  String get resultPhrase {
    var resultText;
    if (_resultScore <= 8) {
      resultText = 'you are kind and innocent!';
    } else if (_resultScore <= 12) {
      resultText = 'you are likeable!';
    } else {
      resultText = 'you are devil!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 28,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'restart',
              style: TextStyle(
                fontSize: 28,
                color: Colors.red,
              ),
            ),
            onPressed: _resetQuiz,
          )
        ],
      ),
    );
  }
}
