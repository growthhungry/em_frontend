// ignore_for_file: must_be_immutable

import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:eneler_mariia/src/common/widgets/buttons/further_button_widget.dart';
import 'package:eneler_mariia/src/common/widgets/header_text_widget.dart';
import 'package:eneler_mariia/src/features/education/domain/entities/questions_entity.dart';
import 'package:flutter/material.dart';

/// {@template checkboxes_answer_widget}
/// CheckboxesAnswerWidget widget.
/// {@endtemplate}
class CheckboxesAnswerWidget extends StatefulWidget {
  /// {@macro checkboxes_answer_widget}
  const CheckboxesAnswerWidget(
      {super.key, required this.questionEntity, required this.onPressed});

  final QuestionEntity questionEntity;
  final VoidCallback onPressed;

  @override
  State<CheckboxesAnswerWidget> createState() => _CheckboxesAnswerWidgetState();
}

class _CheckboxesAnswerWidgetState extends State<CheckboxesAnswerWidget> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                HeaderTextWidget(
                  title: widget.questionEntity.question,
                  padding: const EdgeInsets.all(10),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return _CustomCheckBoxListTileWidget(
                            title: widget.questionEntity.answers[index],
                            isCheck: isCheck);
                      }),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FurtherButtonWidget(
                    isActive: true, onPressed: () => widget.onPressed.call()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// {@template checkboxes_answer_widget}
/// _CustomCheckBoxListTileWidget widget.
/// {@endtemplate}
class _CustomCheckBoxListTileWidget extends StatefulWidget {
  /// {@macro checkboxes_answer_widget}
  _CustomCheckBoxListTileWidget({required this.title, required this.isCheck});

  final String title;
  bool isCheck;
  @override
  State<_CustomCheckBoxListTileWidget> createState() =>
      _CustomCheckBoxListTileWidgetState();
}

class _CustomCheckBoxListTileWidgetState
    extends State<_CustomCheckBoxListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.isCheck,
          onChanged: (bool? value) {
            setState(() {
              widget.isCheck = value!;
            });
          },
          checkColor: Colors.black,
          fillColor: MaterialStateProperty.all(Colors.transparent),
          side: MaterialStateBorderSide.resolveWith((Set<MaterialState> state) {
            if (state.contains(MaterialState.selected)) {
              return const BorderSide(
                color: Colors.black,
                width: 2,
              );
            } else {
              return const BorderSide(
                color: Colors.grey,
                width: 2,
              );
            }
          }),
        ),
        Text(widget.title, style: checkBoxTitleTextStyle)
      ],
    );
  }
}
