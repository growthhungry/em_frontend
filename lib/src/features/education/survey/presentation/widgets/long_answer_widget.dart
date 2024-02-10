import 'package:eneler_mariia/src/common/widgets/buttons/further_button_widget.dart';
import 'package:eneler_mariia/src/features/education/videos/domain/entities/questions_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template long_answer_widget}
/// LongAnswerWidget widget.
/// {@endtemplate}
class LongAnswerWidget extends StatefulWidget {
  /// {@macro long_answer_widget}
  const LongAnswerWidget(
      {super.key, required this.questionEntity, required this.onPressed});

  final QuestionEntity questionEntity;
  final VoidCallback onPressed;
  @override
  State<LongAnswerWidget> createState() => _LongAnswerWidgetState();
}

/// State for widget LongAnswerWidget.
class _LongAnswerWidgetState extends State<LongAnswerWidget> {
  @override
  Widget build(BuildContext context) {
    final data = widget.questionEntity;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                data.question,
                style: const TextStyle(
                    fontFamily: 'GoogleSans',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    wordSpacing: 0.2),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null,
                  expands: true,
                  scrollPadding: const EdgeInsets.all(20),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintStyle: const TextStyle(
                        fontFamily: 'GoogleSans',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.black)),
                      hintText:
                          AppLocalizations.of(context)!.writeYourTextHere),
                ),
              ),
              const SizedBox(height: 20),
              FurtherButtonWidget(onPressed: () => widget.onPressed.call())
            ],
          ),
        ),
      ),
    );
  }
}
