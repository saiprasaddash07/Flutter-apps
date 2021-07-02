import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalscore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
      _totalscore += score;
    });
  }          

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questiontext': 'What\'s your favourite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1}
        ],
      },
      {
        'questiontext': 'What\'s your favourite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 8},
          {'text': 'Snake', 'score': 10},
          {'text': 'Elephant', 'score': 5},
          {'text': 'Lion', 'score': 7}
        ],
      },
      {
        'questiontext': 'Who\'s your favourite instructor?',
        'answers': [
          {'text': 'Maximillian', 'score': 1},
          {'text': 'Andrew', 'score': 2},
          {'text': 'Robert', 'score': 6},
          {'text': 'Stephen', 'score': 8}
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
          backgroundColor: Colors.blue,
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalscore,_resetQuiz),
      ),
    );
  }
}
