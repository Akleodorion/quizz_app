import 'package:flutter/material.dart';
import './data/quiz_questions.dart';
import './answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  int currentQuestion = 0;
  @override
  Widget build(BuildContext context) {

    void changeQuestion() {
      setState(() {
        currentQuestion += 1;
      });
    }


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
              return AnswerButton(answer: data, onTap: changeQuestion);
            })
          ],
        ),
      ),
    );
  }
}
