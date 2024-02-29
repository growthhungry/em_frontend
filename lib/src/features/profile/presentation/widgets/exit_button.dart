import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:flutter/material.dart';

/// {@template exit_button}
/// ExitButton widget.
/// {@endtemplate}
class ExitButton extends StatelessWidget {
  /// {@macro exit_button}
  const ExitButton(
      {super.key,
      required this.color,
      required this.onPressed,
      required this.title});

  final Color color;
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 166,
      child: ElevatedButton(
          onPressed: () => onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24))),
          child: Text(
            title,
            style: startButtonTextStyle,
          )),
    );
  }
}
