import 'package:eneler_mariia/src/features/education/data/model/question_model.dart';
import 'package:eneler_mariia/src/features/education/domain/entities/training_video_entity.dart';

final class TrainingVideoModel extends TrainingVideoEntity {
  TrainingVideoModel(
      {required super.lessonId,
      required super.imageUrl,
      required super.name,
      required super.speaker,
      required super.availableUntil,
      required super.passed,
      required super.questions,
      required super.linkToYoutubeVideo,
      required super.completionMessage,
      required super.descrpiption});

  factory TrainingVideoModel.fromJson(Map<String, dynamic> json) =>
      TrainingVideoModel(
        lessonId: json["lessonId"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        speaker: json["speaker"],
        availableUntil: json["availableUntil"],
        passed: json["passed"],
        linkToYoutubeVideo: json["linkToYoutubeVideo"],
        completionMessage: json["completionMessage"],
        questions: List<QuestionModel>.from(
            json["questions"].map((x) => QuestionModel.fromJson(x))),
        descrpiption: json['description'],
      );
}
