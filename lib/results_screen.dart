import 'package:flutter/material.dart';
import './data/quiz_questions.dart';
import './results_template.dart';


class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.results});

  final List<String> results;

  List<Map<String, Object>> getSummarayData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i + 1,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'answer': results[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummarayData();
    final numCorrectAnswers = summaryData.where(
      (data) {
        return data['correct_answer'] == data['answer'];
      },
    ).length;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You've succesfully answered $numCorrectAnswers out of ${questions.length} questions",
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 221, 175, 244),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...summaryData.map((data) {
              return ResultsTemplate(data: data);
            })
            ,
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh),
                label: const Text('retake the quizz')),
          ],
        ),
      ),
    );
  }
}
