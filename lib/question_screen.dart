import 'package:flutter/material.dart';
import './data/quiz_questions.dart';
import './answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onAnsweredPopulated});
  final void Function(String) onAnsweredPopulated;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  changeQuestion(String selectedAnswer) {
    widget.onAnsweredPopulated(selectedAnswer);


    setState(() {
      currentQuestion += 1;
    });

  }

  int currentQuestion = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.center,
              questions[currentQuestion].text,
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 222, 177, 230),
              ),
            ),
            const SizedBox(height: 10),
            ...questions[currentQuestion].getShuffledQuestions().map((data) {
              return AnswerButton(answer: data, onTap: () {
                changeQuestion(data);
              });
            })
          ],
        ),
      ),
    );
  }
}
