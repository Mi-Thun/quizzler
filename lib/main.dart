// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'QuestionBluePrint.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //QuestionBulePrint q1 = QuestionBulePrint('Prince Harry is taller than Prince William',false);
  int questionTracker = 0;
  List<Icon> scoreKeeper = [];

  /*

  List<String> question = [
    'Prince Harry is taller than Prince William',
    'The star sign Aquarius is represented by a tiger',
    'Meryl Streep has won two Academy Awards',
    'Marrakesh is the capital of Morocco',
    'Idina Menzel sings \'let it go\' 20 times in \'Let It Go\' from Frozen',
    'Waterloo has the greatest number of tube platforms in London',
    ' M&M stands for Mars and Moordale',
    'Gin is typically included in a Long Island Iced Tea',
    'The unicorn is the national animal of Scotland',
    'There are two parts of the body that can\'t heal themselves',
  ];
  List<bool> answer = [
    false,
    true,
    false,
    false,
    false,
    true,
    false,
    true,
    true,
    false,
  ];

   */


  List<QuestionBulePrint> question = [
    QuestionBulePrint('Prince Harry is taller than Prince William',false),
    QuestionBulePrint('The star sign Aquarius is represented by a tiger',true),
    QuestionBulePrint('Meryl Streep has won two Academy Awards',false),
    QuestionBulePrint('Marrakesh is the capital of Morocco',true),
    QuestionBulePrint('Idina Menzel sings \'let it go\' 20 times in \'Let It Go\' from Frozen',false),

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                question[questionTracker].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ), 
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 30),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                setState(() {
                  if (questionTracker < question.length) {
                    if (question[questionTracker].answer == true) {
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    } else {
                      scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    }
                    if (questionTracker > question.length) {
                      questionTracker++;
                    }
                  }
                });
              },
              child: Text(
                'True',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                setState(() {
                  if (questionTracker < question.length) {
                    if (question[questionTracker].answer == false) {
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    } else {
                      scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    }
                    if (questionTracker > question.length) {
                      questionTracker++;
                    }
                  }
                });
              },
              child: Text(
                'False',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}
