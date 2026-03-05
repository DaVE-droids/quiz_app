
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

  void chooseAnswer(String answer) {
    setState(() {
      if (currentQuestionIndex < selectedAnswers.length) {
        selectedAnswers[currentQuestionIndex] = answer;
      } else {
        selectedAnswers.add(answer);
      }
    });
  }

  void nextQuestion(){
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        quizFinished = true;
      }
    });
  }


  void previousQuestion() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
      }
    });
  }



  int calculateScore() {
    int correctAnswers = 0;

    for (int i = 0; i < questions.length; i++) {
      if (i < selectedAnswers.length &&
          selectedAnswers[i] == questions[i].correctAnswer) {
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

  void endQuiz(){
    setState(() {
    quizFinished = true;
    });
  }


  int currentQuestionIndex = 0;

  Widget buildStartScreen() {
    return StartScreen(startQuiz: startQuiz);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: !quizStarted
            ? StartScreen(startQuiz: startQuiz)
            : quizFinished
            ? ResultScreen(
          restartQuiz: restartQuiz,
          score: calculateScore(),
          totalQuestions: selectedAnswers.length,
          selectedAnswers: selectedAnswers,
          questions: questions
        )
            :QuestionsScreen(
          questions: questions,
          currentQuestionIndex: currentQuestionIndex,
          chooseAnswer: chooseAnswer,
          previousQuestion: previousQuestion,
          endQuiz: endQuiz,
          selectedAnswer: currentQuestionIndex < selectedAnswers.length
          ? selectedAnswers[currentQuestionIndex]
              :null,
          nextQuestion: nextQuestion,
        )
      ),
    );
  }
}
