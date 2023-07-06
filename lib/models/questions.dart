class Questions {
  Questions({required this.text, required this.answers});

  final String text;
  final List<String> answers;

  List<String> getShuffledQuestions () {
    var shuffledQuestions = List.of(answers);
    shuffledQuestions.shuffle();

    return shuffledQuestions;
  }
}
