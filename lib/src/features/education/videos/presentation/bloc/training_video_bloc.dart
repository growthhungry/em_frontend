import 'package:eneler_mariia/src/common/utils/logger/logger.dart';
import 'package:eneler_mariia/src/features/education/videos/domain/entities/training_video_entity.dart';
import 'package:eneler_mariia/src/features/education/videos/domain/repo/training_videos_get_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingVideoBloc extends Bloc<TrainingVideoEvent, TrainingVideoState> {
  final TrainingVideosGetRepo trainingVideoGetRepo;
  TrainingVideoBloc(this.trainingVideoGetRepo) : super(Inital()) {
    on<Fetch>(_fetch);
  }

  Future<void> _fetch(Fetch event, Emitter<TrainingVideoState> emit) async {
    await trainingVideoGetRepo
        .getTrainingVideos()
        .then((value) => emit(Completed(trainingVideoEntity: value)))
        .catchError((e, s) {
      logger.e('TrainingVideoBloc', error: e, stackTrace: s);
      emit(Failure());
    });
  }
}

abstract class TrainingVideoEvent {}

final class Fetch extends TrainingVideoEvent {}

sealed class TrainingVideoState {}

final class Inital extends TrainingVideoState {}

final class Completed extends TrainingVideoState {
  Completed({required this.trainingVideoEntity});

  final TrainingVideoEntity trainingVideoEntity;
}

final class Failure extends TrainingVideoState {}
