import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ResultsTemplate extends StatelessWidget {
  const ResultsTemplate({super.key, required this.data});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  decoration: BoxDecoration(
                      color: data['correct_answer'] == data['answer'] ? Color.fromARGB(255, 104, 174, 231) : Color.fromARGB(255, 211, 158, 220),
                      borderRadius: const BorderRadius.all(Radius.circular(30))),
                  child:  Text(
                    textAlign: TextAlign.center,
                    (data['question_index'].toString()),
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String, style: GoogleFonts.lato(fontSize: 24, color: Colors.white),),
                      Text(data['correct_answer'] as String,style: TextStyle(color: Color.fromARGB(255, 104, 174, 231)),),
                      Text(data['answer'] as String, style: TextStyle(color: Color.fromARGB(255, 211, 158, 220)),),
                    ],
                  ),
                )
              ],
            );
  }
}
