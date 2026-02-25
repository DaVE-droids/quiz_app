import 'models/question.dart';

final List <Question> questions = [
  Question(
    questionText: 'What is my name?',
   answers: ['Dave', 'David', 'David the great', 'Dave the great'],
    correctAnswer: 'David'
  ),
  Question(
    questionText: 'Will I be successful?',
    answers: ['Yes', 'NO', 'If i want to', 'I do not have a choice'],
    correctAnswer: 'Yes'
  ),
    Question(
    questionText: 'How old am I?',
    answers: ['23', '22', '21','none of your business'],
    correctAnswer: 'none of your business'
    )
];
