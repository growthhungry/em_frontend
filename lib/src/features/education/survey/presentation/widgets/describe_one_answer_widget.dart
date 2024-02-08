import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// {@template describe_one_answer_widget}
/// DescribeOneAnswerWidget widget.
/// {@endtemplate}
class DescribeOneAnswerWidget extends StatefulWidget {
  /// {@macro describe_one_answer_widget}
  const DescribeOneAnswerWidget({super.key});

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  @internal
  static _DescribeOneAnswerWidgetState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_DescribeOneAnswerWidgetState>();

  @override
  State<DescribeOneAnswerWidget> createState() =>
      _DescribeOneAnswerWidgetState();
}

/// State for widget DescribeOneAnswerWidget.
class _DescribeOneAnswerWidgetState extends State<DescribeOneAnswerWidget> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(DescribeOneAnswerWidget oldWidget) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const Text('Опишите одним словом синдром самозванца',
                  style: headerSurveyTextStyle),
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
            ],
          ),
        ),
      ),
    );
  }
}
