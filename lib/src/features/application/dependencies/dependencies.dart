import 'package:eneler_mariia/src/features/authentication/google_auth/data/data_sources/google_auth_data_sources.dart';
import 'package:eneler_mariia/src/features/authentication/google_auth/data/repositories/google_auth_repositories.dart';
import 'package:eneler_mariia/src/features/authentication/google_auth/domain/repositories/google_auth_repository.dart';
import 'package:eneler_mariia/src/features/authentication/presentation/auhtentication_bloc/authentication_bloc.dart';
import 'package:eneler_mariia/src/features/education/videos/data/data_sources/training_video_get_data_sources.dart';
import 'package:eneler_mariia/src/features/education/videos/data/repositories/training_videos_get_repo_impl.dart';
import 'package:eneler_mariia/src/features/education/videos/presentation/bloc/training_video_bloc.dart';
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
  late final GoogleAuthDataSources googleAuthDataSources;
  late final GoogleAuthRepositoryImpl googleAuthRepository;
  late final AuthenticationBloc authenticationBloc;
  late final MockTrainingVideoDataSources mockTrainingVideoDataSources;
  late final TrainingVideosGetRepoImpl trainingVideosGetRepoImpl;
  late final TrainingVideoBloc trainingVideoBloc;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    googleAuthDataSources = GoogleAuthDataSources();
    googleAuthRepository =
        GoogleAuthRepositoryImpl(googleAuthDataSources: googleAuthDataSources);
    authenticationBloc = AuthenticationBloc(googleAuthRepository);

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
