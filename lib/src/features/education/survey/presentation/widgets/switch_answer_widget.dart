import 'package:eneler_mariia/src/common/components/colors/colors.dart';
import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:eneler_mariia/src/common/widgets/custom_check_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// {@template switch_answer_widget}
/// SwitchAnswerWidget widget.
/// {@endtemplate}
class SwitchAnswerWidget extends StatefulWidget {
  /// {@macro switch_answer_widget}
  const SwitchAnswerWidget({super.key});

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  @internal
  static _SwitchAnswerWidgetState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_SwitchAnswerWidgetState>();

  @override
  State<SwitchAnswerWidget> createState() => _SwitchAnswerWidgetState();
}

/// State for widget SwitchAnswerWidget.
class _SwitchAnswerWidgetState extends State<SwitchAnswerWidget> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(SwitchAnswerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }
  /* #endregion */

  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Какие признаки характеризуют синдром самозванца',
                style: headerSurveyTextStyle,
              ),
              const SizedBox(height: 20),
              CustomCheckBoxWidget(
                value: isCheck,
                title: 'Низкая самооценка',
                onPressed: () {
                  setState() {
                    isCheck = !isCheck;
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
