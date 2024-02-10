import 'package:eneler_mariia/src/features/application/dependencies/dependencies.dart';
import 'package:eneler_mariia/src/features/education/survey/presentation/screens/test_screen.dart';
import 'package:eneler_mariia/src/features/education/videos/domain/entities/training_video_entity.dart';
import 'package:eneler_mariia/src/features/education/videos/presentation/bloc/training_video_bloc.dart';
import 'package:eneler_mariia/src/features/education/videos/presentation/widgets/education_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({super.key});

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<TrainingVideoBloc, TrainingVideoState>(
            bloc: Dependencies.of(context).trainingVideoBloc..add(Fetch()),
            builder: (context, state) {
              switch (state) {
                case Inital():
                  return const CircularProgressIndicator();
                case Completed():
                  return EducationVideoWidget(
                      trainingVideoEntity: state.trainingVideoEntity);
                case Failure():
                  return const Text('Failure state');
              }
            },
          ),
        ),
      ),
    );
  }
}

/// {@template video_list_screen}
/// _CompletedWidget widget.
/// {@endtemplate}
class _CompletedWidget extends StatelessWidget {
  /// {@macro video_list_screen}
  const _CompletedWidget({required this.trainingVideoEntity});

  final TrainingVideoEntity trainingVideoEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: trainingVideoEntity.questions.length,
        itemBuilder: (context, index) {
          return EducationVideoWidget(trainingVideoEntity: trainingVideoEntity);
        });
  }
}
