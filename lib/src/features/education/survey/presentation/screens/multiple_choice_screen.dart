import 'dart:io';

import 'package:flutter/material.dart';
import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';

class MultipleChoiceScreen extends StatefulWidget {
  const MultipleChoiceScreen({super.key});

  @override
  State<MultipleChoiceScreen> createState() => _MultipleChoiceScreenState();
}

class _MultipleChoiceScreenState extends State<MultipleChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: Text(
              'Синдром самозванца больше характерен',
              style: headerSurveyTextStyle,
            ))
          ],
        ),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(child: Text('jdjdjdjjdjdjdjdjjdjdjjdj'));
  }
}
