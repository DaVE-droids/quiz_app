
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool quizStarted = false;
  bool quizFinished = false;

  List<String> selectedAnswers = [];

  void chooseAnswer (String answer){
    setState(() {
      selectedAnswers.add(answer);
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        quizFinished = true;
      }
    });

  }



  int calculateScore(){
  int correctAnswers = 0;
  for (int i = 0; i < selectedAnswers.length; i++) {
  if (selectedAnswers[i] ==
  (questions[i].correctAnswer)) {
  // final correctAnswer = questions[i]['correctAnswer'] as String;
  correctAnswers++;
  }
  }
  return correctAnswers;
}

  void startQuiz(){
    setState(() {
      quizStarted = true;
      selectedAnswers = [];
    });
  }
  void restartQuiz(){
    setState(() {
      quizFinished = false;
      quizStarted = false;
      currentQuestionIndex = 0;
      selectedAnswers = [];
    });
  }


  int currentQuestionIndex = 0;

  Widget buildStartScreen() {
    return StartScreen(startQuiz: startQuiz);
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: !quizStarted
            ? StartScreen(startQuiz: startQuiz)
            : quizFinished
            ? ResultScreen(
          restartQuiz: restartQuiz,
          score: calculateScore(),
          totalQuestions: questions.length,
          selectedAnswers: selectedAnswers,
          questions: questions
        )
            :QuestionsScreen(
          questions: questions,
          currentQuestionIndex: currentQuestionIndex,
          chooseAnswer: chooseAnswer,
        )
      ),
    );
  }
}
