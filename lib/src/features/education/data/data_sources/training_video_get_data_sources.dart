import 'dart:convert';

import 'package:eneler_mariia/src/features/education/data/model/training_video_model.dart';
import 'package:flutter/services.dart';

abstract interface class ITrainingVideoDataSources {
  Future<List<TrainingVideoModel>> fetchVideo([String? userId]);
}

/// {@template training_video_get_data_sources}
/// FirebaseTrainingVideoDataSources class.
/// {@endtemplate}
final class FirebaseTrainingVideoDataSources
    implements ITrainingVideoDataSources {
  /// {@macro training_video_get_data_sources}

  @override
  Future<List<TrainingVideoModel>> fetchVideo([String? userId]) {
    // TODO: implement fetchVideo
    throw UnimplementedError();
  }
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
