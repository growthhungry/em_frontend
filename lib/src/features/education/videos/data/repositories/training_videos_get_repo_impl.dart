import 'package:eneler_mariia/src/features/education/videos/data/data_sources/training_video_get_data_sources.dart';
import 'package:eneler_mariia/src/features/education/videos/domain/entities/training_video_entity.dart';
import 'package:eneler_mariia/src/features/education/videos/domain/repo/training_videos_get_repo.dart';

final class TrainingVideosGetRepoImpl implements TrainingVideosGetRepo {
  TrainingVideosGetRepoImpl({required this.trainingVideoDataSources});

  final ITrainingVideoDataSources trainingVideoDataSources;

  @override
  Future<TrainingVideoEntity> getTrainingVideos() async {
    return await trainingVideoDataSources.fetchVideo();
  }
}
