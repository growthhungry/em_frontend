import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:flutter/material.dart';

/// {@template header_text_widget}
/// HeaderTextWidget widget.
/// {@endtemplate}
class HeaderTextWidget extends StatelessWidget {
  /// {@macro header_text_widget}
  const HeaderTextWidget({
    super.key,
    required this.title,
    this.padding = EdgeInsets.zero,
  });
  final String title;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(title, style: headerSurveyTextStyle),
    );
  }
}
