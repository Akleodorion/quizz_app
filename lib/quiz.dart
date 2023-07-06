import 'package:flutter/material.dart';
import 'package:quizz_app/start_screen.dart';
import './question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _Quiz();
}

class _Quiz extends State<Quiz> {
  String renderedScreen = 'start-screen';

  void switchscreen() {
    setState(() {
      renderedScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: (renderedScreen == 'start-screen')
            ? StartScreen(onTap: switchscreen)
            : const QuestionScreen());
  }
}
