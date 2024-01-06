import 'dart:io';

import 'package:flutter/material.dart';
import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const _questionList = [
  'Людей с низкой самооценкой',
  'Людей с высокой самооценкой',
  'Нет правильного ответа',
  'Оба варианта',
];

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
            const Flexible(
                child: Text(
              'Синдром самозванца больше характерен',
              style: headerSurveyTextStyle,
            )),
            Expanded(
                child: ListView.builder(
                    itemCount: _questionList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 40,
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                                color: const Color.fromRGBO(202, 202, 202, 1),
                                width: 2)),
                        child: Center(child: Text(_questionList[index])),
                      );
                    })),
            // const Spacer(),
            ElevatedButton(onPressed: () {}, child: Text(''))
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
