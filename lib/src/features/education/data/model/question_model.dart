import 'package:eneler_mariia/src/features/education/domain/entities/questions_entity.dart';

final class QuestionModel extends QuestionEntity {
  QuestionModel(
      {required super.type,
      required super.question,
      required super.correctlyAnswer,
      required super.answers});
  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        type: json["type"],
        question: json["question"],
        correctlyAnswer: json["correctlyAnswer"],
        answers: json["answers"] == null
            ? []
            : List<String>.from(json["answers"]!.map((x) => x)),
      );
}
