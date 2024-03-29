import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:eneler_mariia/src/features/education/domain/entities/training_video_entity.dart';
import 'package:eneler_mariia/src/features/education/presentation/screens/education_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EducationVideoWidget extends StatelessWidget {
  const EducationVideoWidget({super.key, required this.trainingVideoEntity});

  final TrainingVideoEntity trainingVideoEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 16),
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      height: 396,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: Colors.white,
        // You can use Colors.white or any color you prefer
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(4.0, 4.0),
            blurRadius: 60.0,
            color: Color.fromRGBO(0, 0, 0, 0.15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 172,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: Colors.white,
            ),
          ),
          Text(
            trainingVideoEntity.name,
            style: headerTextStyle,
          ),
          Text(
            trainingVideoEntity.descrpiption,
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: descriptionTextStyle,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.person,
                color: Color.fromRGBO(147, 147, 147, 1),
                size: 20,
              ),
              Text(
                trainingVideoEntity.speaker,
                style: speakerTextStyle,
              )
            ],
          ),
          Text(
            'Доступно до ${trainingVideoEntity.availableUntil}',
            style: TextStyle(
                color: Color.fromRGBO(96, 101, 214, 1),
                letterSpacing: -0.3,
                fontFamily: 'GoogleSans',
                fontStyle: FontStyle.normal,
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
          _StartButton(trainingVideoEntity: trainingVideoEntity),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SizedBox(
              height: 6,
              child: LinearProgressIndicator(
                value: 0,
                color: Color.fromRGBO(67, 178, 98, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// {@template education_video_widget}
/// _StartButton widget.
/// {@endtemplate}
class _StartButton extends StatelessWidget {
  /// {@macro education_video_widget}
  const _StartButton({super.key, required this.trainingVideoEntity});

  final TrainingVideoEntity trainingVideoEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 12),
      child: SizedBox(
        height: 42,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EducationVideoScreen(
                        trainingVideoEntity: trainingVideoEntity,
                      ))),
          child: Text(
            AppLocalizations.of(context)!.begin,
            style: startButtonTextStyle,
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(96, 101, 214, 1)),
        ),
      ),
    );
  }
}
