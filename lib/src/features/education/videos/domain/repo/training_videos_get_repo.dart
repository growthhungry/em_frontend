import 'package:eneler_mariia/src/features/education/videos/domain/entities/training_video_entity.dart';

abstract interface class TrainingVideosGetRepo {
  Future<TrainingVideoEntity> getTrainingVideos();
}
