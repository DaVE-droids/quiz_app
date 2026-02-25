class Question {
  final String questionText;
  final List<String> answers;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswer,
  });

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}