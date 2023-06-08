import 'package:flutter/material.dart';
import 'package:quiz_test/data/questions.dart';
import 'package:quiz_test/question_screen.dart';
import 'package:quiz_test/result_screen.dart';
import 'package:quiz_test/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({key}) : super(key: key);
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

/*
by usig init state
Widget? activeScreen ;

@override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

void switchScreen(){
  setState(() {
    activeScreen = const Question();
  });
}*/

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = Question(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.blue,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: screenWidget

            /* when using ternary
           activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : const Question(),*/

            // by using init state
            //child: activeScreen,
            ),
      ),
    );
  }
}
