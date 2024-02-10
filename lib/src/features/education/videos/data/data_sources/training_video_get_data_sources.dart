import 'dart:convert';

import 'package:eneler_mariia/src/features/education/videos/data/model/training_video_model.dart';
import 'package:flutter/services.dart';

abstract interface class ITrainingVideoDataSources {
  Future<TrainingVideoModel> fetchVideo([String? userId]);
}

final class MockTrainingVideoDataSources implements ITrainingVideoDataSources {
  @override
  Future<TrainingVideoModel> fetchVideo([String? userId]) async {
    try {
      final mockData =
          await rootBundle.loadString('assets/json/answer_mock.json');

      return await Future.delayed(const Duration(seconds: 3),
          () => TrainingVideoModel.fromJson(json.decode(mockData)));
    } on Object catch (e, s) {
      Error.throwWithStackTrace(e, s);
    }
  }
}
