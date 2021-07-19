import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  void _answerQuestion() {
    setState(() {
      _currentQuestionIndex++;
    });
    print(_currentQuestionIndex);
  }

  var _currentQuestionIndex = 0;
  var _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Red', 'Blue', 'Green', 'Black']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Mouse', 'Elephant', 'Snake', 'Lion']
    },
    {
      'questionText': 'What\'s your favorite meal?',
      'answers': ['Shawarma', 'Shishkebab', 'Rullekebab', 'Kebab']
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: Column(children: [
          Question(
              (_questions[_currentQuestionIndex]['questionText'] as String)),
          ...(_questions[_currentQuestionIndex]['answers'] as List<String>)
              .map((answerText) {
            return Answer(answerText, _answerQuestion);
          }).toList()
        ]),
      ),
    );
  }
}
