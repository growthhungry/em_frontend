import 'package:eneler_mariia/src/common/dependencies/dependencies.dart';
import 'package:eneler_mariia/src/features/education/presentation/screens/test_screen.dart';
import 'package:eneler_mariia/src/features/education/domain/entities/training_video_entity.dart';
import 'package:eneler_mariia/src/features/education/presentation/bloc/training_video_bloc.dart';
import 'package:eneler_mariia/src/features/education/presentation/widgets/education_video_widget.dart';
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
                  return _CompletedWidget(
                    trainingVideoList: state.trainingVideoList,
                  );
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
  const _CompletedWidget({required this.trainingVideoList});

  final List<TrainingVideoEntity> trainingVideoList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: trainingVideoList.length,
        itemBuilder: (context, index) {
          return EducationVideoWidget(
              trainingVideoEntity: trainingVideoList[index]);
        });
  }
}
