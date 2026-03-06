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
            //question counter
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text('Question ${currentQuestionIndex+1} / ${questions.length}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              ),
            ),

            const SizedBox(height: 5,),
            //progress bar
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
            ),
            const SizedBox(height: 10,),
            //display questions
            Text(currentQuestion.questionText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),),
            //display answers in buttons
            ...currentQuestion.shuffledAnswers.map((answer) {
              final isSelected = answer ==selectedAnswer;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton(
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
            //next/previous buttons
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


            //submit/end button
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
