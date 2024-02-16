import 'dart:convert';

import 'package:eneler_mariia/src/features/education/data/model/training_video_model.dart';
import 'package:flutter/services.dart';

abstract interface class ITrainingVideoDataSources {
  Future<List<TrainingVideoModel>> fetchVideo([String? userId]);
}

final class MockTrainingVideoDataSources implements ITrainingVideoDataSources {
  @override
  Future<List<TrainingVideoModel>> fetchVideo([String? userId]) async {
    try {
      final answerMockData =
          await rootBundle.loadString('assets/json/answer_mock.json');

      final response = (jsonDecode(answerMockData) as List<dynamic>)
          .map((e) => TrainingVideoModel.fromJson(e))
          .toList();

      return await Future.delayed(const Duration(seconds: 2), () => response);
    } on Object catch (e, s) {
      Error.throwWithStackTrace(e, s);
    }
  }
}
