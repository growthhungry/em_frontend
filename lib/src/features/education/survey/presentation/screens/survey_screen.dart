import 'package:eneler_mariia/src/common/widgets/buttons/further_button_widget.dart';
import 'package:eneler_mariia/src/features/education/survey/presentation/widgets/answer_to_question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _questions = <String>[
  'Людей с высокой самооценкой',
  'Людей с низкой самооценокой',
  'Нет правильного ответа',
  'Оба варианта'
];

/// {@template survey_screen}
/// SurveyScreen widget.
/// {@endtemplate}
class SurveyScreen extends StatefulWidget {
  /// {@macro survey_screen}
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int? selectedIndex;

  void showAnswer(String answer) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.fromLTRB(10, 24, 10, 24),
            height: MediaQuery.of(context).size.height * 2.7 / 10,
            child: identical(answer, trueAnswer)
                ? AnswerToQuestionWidget(
                    assetImage: 'assets/icons/true.svg',
                    right: true,
                    correctAnswer: trueAnswer,
                    onPressed: () {})
                : AnswerToQuestionWidget(
                    assetImage: 'assets/icons/ph_x.svg',
                    right: false,
                    correctAnswer: trueAnswer,
                    onPressed: () {}),
          );
        });
  }

  String trueAnswer = 'Людей с высокой самооценкой';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Синдром самозванца больше характерен для',
                style: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontStyle: FontStyle.normal,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _questions.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: ClipRRect(
                          child: Material(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 40,
                              decoration: selectedIndex == index
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color:
                                          const Color.fromRGBO(96, 101, 214, 1)
                                              .withOpacity(0.1),
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              96, 101, 214, 1),
                                          width: 1.5))
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                          color: Colors.grey, width: 1.5)),
                              child: Center(
                                  child: Text(
                                _questions[index],
                                style: const TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    letterSpacing: 0.3),
                              )),
                            ),
                          ),
                        ),
                      );
                    })),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    showAnswer('Людей с высокой амооценкой');
                  },
                  style: selectedIndex != null
                      ? ElevatedButton.styleFrom(
                          maximumSize: const Size(343, 50),
                          minimumSize: const Size(343, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          backgroundColor:
                              const Color.fromRGBO(96, 101, 214, 1),
                        )
                      : ElevatedButton.styleFrom(
                          maximumSize: const Size(343, 50),
                          minimumSize: const Size(343, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          backgroundColor: Colors.grey,
                        ),
                  child: Text(
                    AppLocalizations.of(context)!.further,
                    style: selectedIndex != null
                        ? const TextStyle(
                            fontFamily: 'GoogleSans',
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)
                        : const TextStyle(
                            fontFamily: 'GoogleSans',
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(202, 202, 202, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
