import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:eneler_mariia/src/common/widgets/buttons/further_button_widget.dart';
import 'package:eneler_mariia/src/features/education/domain/entities/questions_entity.dart';
import 'package:flutter/material.dart';

/// {@template short_answer_widget}
/// ShortAnswerWidget widget.
/// {@endtemplate}
class ShortAnswerWidget extends StatefulWidget {
  /// {@macro short_answer_widget}
  const ShortAnswerWidget(
      {super.key, required this.questionEntity, required this.onPressed});

  final QuestionEntity questionEntity;
  final VoidCallback onPressed;
  @override
  State<ShortAnswerWidget> createState() => _ShortAnswerWidgetState();
}

class _ShortAnswerWidgetState extends State<ShortAnswerWidget> {
  @override
  Widget build(BuildContext context) {
    final data = widget.questionEntity;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(data.question, style: headerSurveyTextStyle),
              const SizedBox(height: 20),
              SizedBox(
                height: 46,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Напишите свой текст здесь',
                      hintStyle: hintSurveyTextSyle,
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2))),
                ),
              ),
              const Spacer(),
              FurtherButtonWidget(onPressed: () => widget.onPressed.call())
            ],
          ),
        ),
      ),
    );
  }
}
