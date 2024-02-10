import 'package:eneler_mariia/src/common/widgets/buttons/further_button_widget.dart';
import 'package:eneler_mariia/src/features/education/survey/presentation/screens/lesson_completed_screen.dart';
import 'package:eneler_mariia/src/features/education/survey/presentation/widgets/long_answer_widget.dart';
import 'package:eneler_mariia/src/features/education/survey/presentation/widgets/options_answer_widget.dart';
import 'package:eneler_mariia/src/features/education/survey/presentation/widgets/short_answer_widget.dart';
import 'package:eneler_mariia/src/features/education/videos/domain/entities/training_video_entity.dart';
import 'package:flutter/material.dart';

/// {@template test_screen}
/// TestScreen widget.
/// {@endtemplate}
class TestScreen extends StatefulWidget {
  /// {@macro test_screen}
  const TestScreen({super.key, required this.trainingVideoEntity});

  final TrainingVideoEntity trainingVideoEntity;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
  final _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final data = widget.trainingVideoEntity.questions;
    return Scaffold(
      appBar: AppBar(
        title: LinearProgressIndicator(
          minHeight: 6.0,
          color: const Color.fromRGBO(96, 101, 214, 1),
          borderRadius: BorderRadius.circular(20),
          value: progressValue(data.length),
        ),
      ),
      body: SafeArea(
        child: PageView.builder(
            controller: _pageController,
            itemCount: data.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              switch (data[index].type) {
                case 'longAnswer':
                  return LongAnswerWidget(
                    questionEntity: data[index],
                    onPressed: onPressed,
                  );
                case 'shortAnswer':
                  return ShortAnswerWidget(
                    questionEntity: data[index],
                    onPressed: onPressed,
                  );
                case 'answerOptions':
                  return OptionsAnswerWidget(
                    questionEntity: data[index],
                    onPressed: onPressed,
                  );
                default:
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: FurtherButtonWidget(onPressed: () => onPressed()),
                  );
              }
            }),
      ),
    );
  }

  void onPressed() {
    final videoData = widget.trainingVideoEntity;
    setState(() {
      _pageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.decelerate);
    });
    if (_pageController.page! == videoData.questions.length - 1) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => LessonCompletedScreen(
                  completionMessage: videoData.completionMessage)),
          (route) => false);
    }
  }

  double progressValue(int totalIndex) {
    double currentIndex =
        _pageController.hasClients ? _pageController.page! + 1 : 0.0;

    double result = currentIndex / (totalIndex - 1);

    return result.clamp(0.0, 1.0);
  }
}
