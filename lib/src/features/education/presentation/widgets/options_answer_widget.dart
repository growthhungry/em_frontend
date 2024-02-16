import 'package:flutter/material.dart';
import 'package:eneler_mariia/src/features/education/presentation/widgets/answer_to_question_widget.dart';
import 'package:eneler_mariia/src/features/education/domain/entities/questions_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template options_answer_widget}
/// OptionsAnswerWidget widget.
/// {@endtemplate}
class OptionsAnswerWidget extends StatefulWidget {
  /// {@macro options_answer_widget}
  const OptionsAnswerWidget({
    super.key,
    required this.questionEntity,
    required this.onPressed,
  });

  final QuestionEntity questionEntity;
  final VoidCallback onPressed;
  @override
  State<OptionsAnswerWidget> createState() => _OptionsAnswerWidgetState();
}

class _OptionsAnswerWidgetState extends State<OptionsAnswerWidget> {
  int? selectedIndex;

  void callBack() {
    widget.onPressed.call();
    Navigator.of(context).pop();
  }

  void showAnswer(String answer, String trueAnswer) {
    showModalBottomSheet(
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.fromLTRB(10, 24, 10, 24),
            height: MediaQuery.of(context).size.height * 2.7 / 10,
            child: answer == trueAnswer
                ? AnswerToQuestionWidget(
                    assetImage: 'assets/icons/true.svg',
                    right: true,
                    correctAnswer: trueAnswer,
                    onPressed: () => callBack())
                : AnswerToQuestionWidget(
                    assetImage: 'assets/icons/ph_x.svg',
                    right: false,
                    correctAnswer: trueAnswer,
                    onPressed: () => callBack()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.questionEntity;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                data.question,
                style: const TextStyle(
                    fontFamily: 'GoogleSans',
                    fontStyle: FontStyle.normal,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Center(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.answers.length,
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
                            padding: const EdgeInsets.all(12),
                            constraints: const BoxConstraints(minHeight: 40),
                            margin: const EdgeInsets.all(5),
                            decoration: selectedIndex == index
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color.fromRGBO(96, 101, 214, 1)
                                        .withOpacity(0.1),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            96, 101, 214, 1),
                                        width: 1.5))
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.grey, width: 1.5)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Text(
                                data.answers[index],
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    letterSpacing: -0.2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    showAnswer(
                        data.answers[selectedIndex!], data.correctlyAnswer!);
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
                  child: Center(
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
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
