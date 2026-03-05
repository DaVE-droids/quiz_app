class Question {
  final String questionText;
  final List<String> answers;
  final String correctAnswer;

  late final List<String> shuffledAnswers;

  Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswer,
  })
  {shuffledAnswers = List.of(answers)..shuffle();}
}