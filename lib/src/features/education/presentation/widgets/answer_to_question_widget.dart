import 'package:eneler_mariia/src/common/widgets/buttons/further_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template answer_to_question_widget}
/// AnswerToQuestionWidget widget.
/// {@endtemplate}
class AnswerToQuestionWidget extends StatelessWidget {
  /// {@macro answer_to_question_widget}
  const AnswerToQuestionWidget({
    super.key,
    required this.assetImage,
    required this.right,
    required this.correctAnswer,
    required this.onPressed,
  });

  final String assetImage;
  final bool right;
  final String correctAnswer;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final rightText = AppLocalizations.of(context)!.right;
    final wrongText = AppLocalizations.of(context)!.wrong;
    final correctAnswerText = AppLocalizations.of(context)!.correctAnswer;
    final youAnsweredCorrectly =
        AppLocalizations.of(context)!.youAnsweredCorrectly;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SvgPicture.asset(assetImage),
            Text(
              right ? rightText : wrongText,
              style: right
                  ? const TextStyle(
                      color: Colors.green,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'GoogleSans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500)
                  : const TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'GoogleSans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            right
                ? '$youAnsweredCorrectly $correctAnswer'
                : '$correctAnswerText $correctAnswer',
            style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: 'GoogleSans',
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
          ),
        ),
        const Spacer(),
        FurtherButtonWidget(
            isActive: true,
            onPressed: () {
              onPressed.call();
            })
      ],
    );
  }
}
