import 'package:flutter/material.dart';
import './data/quiz_questions.dart';
import 'package:quizz_app/start_screen.dart';
import './question_screen.dart';
import './results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _Quiz();
}

class _Quiz extends State<Quiz> {
  String renderedScreen = 'start-screen';
  late Widget displayedScreen;
  List<String> answers = [];

  void switchscreen() {
    setState(() {
      renderedScreen = 'question-screen';
    });
  }

  void populateAnswers(String data) {
    answers.add(data);
    if (answers.length == questions.length) {
      setState(() {
      renderedScreen = 'results-screen';
    });
    }
  }

  @override
  Widget build(BuildContext context) {



    if (renderedScreen == 'start-screen') {
      displayedScreen = StartScreen(onTap: switchscreen);
    }

    if (renderedScreen == 'question-screen') {
      displayedScreen = QuestionScreen(onAnsweredPopulated: populateAnswers);
    }

    if (renderedScreen == 'results-screen') {
      displayedScreen = ResultsScreen(results: answers,);
    }


    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: displayedScreen);
  }
}
