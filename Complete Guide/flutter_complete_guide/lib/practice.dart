import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   var _questionIndex = 0;

//   void _answerQuestion() {
//     _questionIndex = _questionIndex + 1;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var questions = [
//       'What\'s your favourite color?',
//       'What\'s your favourite animal?'
//     ];
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My First App'),
//         ),
//         body: Column(
//           children: [
//             Text(
//               questions[_questionIndex],
//             ),
//             RaisedButton(
//               child: Text('Answer 1'),
//               onPressed: _answerQuestion,
//             ),
//             RaisedButton(
//               child: Text('Answer 2'),
//               onPressed: () => print('Answer 2 Choosen!'),
//             ),
//             RaisedButton(
//               child: Text('Answer 3'),
//               onPressed: () {
//                 print('Answer 3 Choosen!');
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  //can be re build
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //persistent
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questiontext': 'What\'s your favourite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questiontext': 'What\'s your favourite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questiontext': 'Who\'s your favourite instructor?',
        'answers': ['Maximillian', 'Andrew', 'Robert', 'Stephen'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: (_questionIndex < questions.length)
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questiontext'],
                  ),

                  // Answer(_answerQuestion),
                  // Answer(_answerQuestion),
                  // Answer(_answerQuestion),

                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()

                  // RaisedButton(
                  //   child: Text('Answer 2'),
                  //   onPressed: () => print('Answer 2 Choosen!'),
                  // ),
                  // RaisedButton(
                  //   child: Text('Answer 3'),
                  //   onPressed: () {
                  //     print('Answer 3 Choosen!');
                  //   },
                  // )
                ],
              )
            : Center(
                child: Text('No More Questions Remained'),
              ),
      ),
    );
  }
}
