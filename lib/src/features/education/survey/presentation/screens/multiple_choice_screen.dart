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

const _buttonText = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'GoogleSans');

class MultipleChoiceScreen extends StatefulWidget {
  const MultipleChoiceScreen({super.key});

  @override
  State<MultipleChoiceScreen> createState() => _MultipleChoiceScreenState();
}

class _MultipleChoiceScreenState extends State<MultipleChoiceScreen> {
  final _isActive = List.generate(_questionList.length, (index) => false);

  bool activeButton = false;

  void onTap(int index) => setState(() {
        if (_isActive[index] == true) {
          _isActive[index] = false;
        } else {
          _isActive[index] = true;
        }
      });

  /// currentIndex
  ///
  /// List => true, true, false;
  ///
  /// false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Flexible(
                child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Синдром самозванца больше характерен для:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    letterSpacing: -0.48,
                    fontFamily: 'GoogleSans'),
              ),
            )),
            ListView.builder(
                padding: const EdgeInsets.only(right: 16, left: 16),
                shrinkWrap: true,
                itemCount: _questionList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onTap(index),
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(top: 6, bottom: 6),
                      decoration: _isActive[index]
                          ? BoxDecoration(
                              color: const Color.fromRGBO(229, 231, 248, 1),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                  color: const Color.fromRGBO(202, 202, 202, 1),
                                  width: 2))
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                  color: const Color.fromRGBO(202, 202, 202, 1),
                                  width: 2)),
                      child: Center(
                          child: Text(
                        _questionList[index],
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: -0.32,
                            fontFamily: 'GoogleSans'),
                      )),
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(202, 202, 202, 1),
                  fixedSize: const Size(343, 44),
                  minimumSize: const Size(300, 44),
                ),
                child: Text(
                  AppLocalizations.of(context)!.further,
                  style: _buttonText,
                ),
              ),
            )
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
