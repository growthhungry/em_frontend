class QuestionEntity {
  QuestionEntity({
    required this.type,
    required this.question,
    required this.correctlyAnswer,
    required this.answers,
  });
  final String type;
  final String question;
  final String? correctlyAnswer;

  final List<String> answers;
}
