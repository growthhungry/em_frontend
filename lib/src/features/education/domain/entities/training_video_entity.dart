import 'package:eneler_mariia/src/features/education/domain/entities/questions_entity.dart';

class TrainingVideoEntity {
  TrainingVideoEntity({
    required this.lessonId,
    required this.imageUrl,
    required this.name,
    required this.speaker,
    required this.availableUntil,
    required this.passed,
    required this.questions,
    required this.linkToYoutubeVideo,
    required this.completionMessage,
    required this.descrpiption,
  });
  final String lessonId;
  final String imageUrl;
  final String descrpiption;
  final String name;
  final String speaker;
  final String availableUntil;
  final bool passed;
  final String linkToYoutubeVideo;
  final String completionMessage;
  final List<QuestionEntity> questions;
}
