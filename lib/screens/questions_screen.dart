import 'package:quiz_app/models/question.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({
    super.key,
    required this.chooseAnswer,
    required this.questions,
    required this.currentQuestionIndex,
    required this.previousQuestion,
    required this.endQuiz,
    required this.selectedAnswer,
    required this.nextQuestion
  });

  final List<Question> questions;
  final int currentQuestionIndex;
  final void Function(String) chooseAnswer;
  final void Function() previousQuestion;
  final void Function() endQuiz;
  final String? selectedAnswer;
  final void Function () nextQuestion;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentQuestion.questionText),
            ...currentQuestion.shuffledAnswers.map((answer) {
              final isSelected = answer ==selectedAnswer;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor: isSelected
                          ? Colors.green
                          : null,
                    ),
                    onPressed: () {
                      chooseAnswer(answer); // to store answers
                    },
                    child: Text(answer),
                  ),
                ),
              );
            }).toList(),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: currentQuestionIndex == 0 ? null : previousQuestion,
                  child: Text('Previous'),
                ),

                ElevatedButton(
                  onPressed: selectedAnswer == null
                      ? null
                      : currentQuestionIndex >= questions.length -1
                      ? null
                      : nextQuestion,
                  child: Text('Next'),
                ),
              ],
            ),



            ElevatedButton(
                onPressed: endQuiz,
                child:
                currentQuestionIndex >= questions.length -1
                    ? Text('Submit')
                    : Text('End Quiz')
            ),

          ],
        ),
      ),
    );
  }
}
