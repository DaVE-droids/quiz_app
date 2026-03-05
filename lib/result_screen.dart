import 'package:quiz_app/models/question.dart';
import 'package:flutter/material.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.restartQuiz, required this.totalQuestions, required this.score, required this.questions, required this.selectedAnswers});

  final VoidCallback restartQuiz;
  final int totalQuestions;
  final int score;
  final List<String> selectedAnswers;
  final List<Question> questions;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: totalQuestions == 0

        ? Text('You did not attempt any question',
              style:
                TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ):
              score == totalQuestions ?
                  Text('You got all $score out of $totalQuestions correct')
                  :
              Text(
                'You got $score out of $totalQuestions questions correct',
                style:
                TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )



            ),


            ...List.generate(selectedAnswers.length, (index){
              final correctAnswer = questions[index].correctAnswer;
              final userAnswer = selectedAnswers[index];
              final isCorrect = userAnswer == correctAnswer;
              return Padding(padding: const EdgeInsetsGeometry.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          questions[index].questionText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8,),
                      Text(
                        'Your Answer: $userAnswer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isCorrect? Colors.green : Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (!isCorrect)
                        Text(
                          'Correct Answer: $correctAnswer',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,

                        )

                    ],
                  ),
                ),

              );
            }

            ),
            SizedBox(height: 20),

            if (score < questions.length/2)
              Text('YOU NO SABI BOOK FOR SHIT'),

            SizedBox(height: 10,),

            OutlinedButton(
                onPressed: restartQuiz,
                child: Text('Restart Quiz')
            ),


          ],
        ),
      ),
    );
  } 
}
