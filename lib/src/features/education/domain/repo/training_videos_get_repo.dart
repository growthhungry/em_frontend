import 'package:eneler_mariia/src/features/education/domain/entities/training_video_entity.dart';

abstract interface class TrainingVideosGetRepo {
  Future<List<TrainingVideoEntity>> getTrainingVideos();
}
