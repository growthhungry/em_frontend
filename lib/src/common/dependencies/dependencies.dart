import 'package:eneler_mariia/src/features/authentication/data/data_sources/auth_data_sources.dart';
import 'package:eneler_mariia/src/features/authentication/data/repo/auth_repo_impl.dart';
import 'package:eneler_mariia/src/features/authentication/presentation/bloc/bloc/auth_bloc.dart';
import 'package:eneler_mariia/src/features/education/data/data_sources/training_video_get_data_sources.dart';
import 'package:eneler_mariia/src/features/education/data/repositories/training_videos_get_repo_impl.dart';
import 'package:eneler_mariia/src/features/education/presentation/bloc/training_video_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dependencies {
  Dependencies();

  static Dependencies of(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<DependenciesScope>()!
        .dependencies;
  }

  late SharedPreferences sharedPreferences;
  late final AuthDataSources authDataSources;
  late final AuthRepoImpl authRepo;
  late final AuthBloc authBloc;
  late final MockTrainingVideoDataSources mockTrainingVideoDataSources;
  late final TrainingVideosGetRepoImpl trainingVideosGetRepoImpl;
  late final TrainingVideoBloc trainingVideoBloc;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    authDataSources = AuthDataSources();
    authRepo = AuthRepoImpl(authDataSources: authDataSources);
    authBloc = AuthBloc(authRepo);

    /// Register dependencies for Training module
    mockTrainingVideoDataSources = MockTrainingVideoDataSources();
    trainingVideosGetRepoImpl = TrainingVideosGetRepoImpl(
        trainingVideoDataSources: mockTrainingVideoDataSources);
    trainingVideoBloc = TrainingVideoBloc(trainingVideosGetRepoImpl);
  }
}

class DependenciesScope extends InheritedWidget {
  const DependenciesScope(this.dependencies, {super.key, required super.child});

  final Dependencies dependencies;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
