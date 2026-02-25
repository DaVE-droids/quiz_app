import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuiz});

  final VoidCallback startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: OutlinedButton(
              onPressed: () {
                startQuiz();
              },
              child: const Text('Start Quiz'),
            ),
          ),
        ],
      ),
    );
  }
}
