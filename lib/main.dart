import 'package:firstapp/quiz.dart';
import 'package:firstapp/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyCoolApp());

class MyCoolApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCoolAppState();
  }
}

class _MyCoolAppState extends State<MyCoolApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'question': 'what is your favorite colour?',
      'answers': [
        {'text': 'green', 'score': 2},
        {'text': 'blue', 'score': 3},
        {'text': 'red', 'score': 10},
        {'text': 'yellow', 'score': 4}
      ]
    },
    {
      'question': 'what is your favorite animal?',
      'answers': [
        {'text': 'dog', 'score': 3},
        {'text': 'cat', 'score': 2},
        {'text': 'monkey', 'score': 4},
        {'text': 'snake', 'score': 10}
      ]
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _totalScore += score;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('personality test'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
