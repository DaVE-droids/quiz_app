import 'package:quiz_app/models/question.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key, required this.chooseAnswer, required this.questions, required this.currentQuestionIndex});

  final List<Question> questions;
  final int currentQuestionIndex;
  final void Function (String) chooseAnswer;




  @override
  Widget build(BuildContext context){

    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( currentQuestion.questionText),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ElevatedButton(
                onPressed: () {
                  chooseAnswer(answer);// to store answers

                },
                child: Text(answer),
              ),
            );
          }).toList(),

        ],
      ),

    );
  }
  }

