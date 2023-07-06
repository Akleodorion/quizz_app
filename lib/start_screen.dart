import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            './assets/images/quiz-logo.png',
            height: 300,
          ),
          const SizedBox(height: 20),
          const Text(
              style: TextStyle(
                  color: Color.fromARGB(255, 173, 136, 238), fontSize: 24),
              'Learn Flutter the fun way!'),
          TextButton.icon(
            onPressed: onTap,
            icon: const Icon(Icons.arrow_back_outlined),
            label: const Text('Hey'),
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(7, 158, 158, 158)),
          )
        ],
      ),
    );
  }
}
