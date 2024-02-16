import 'package:eneler_mariia/src/common/widgets/buttons/home_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

/// {@template lesson_completed_screen}
/// LessonCompletedScreen widget.
/// {@endtemplate}
class LessonCompletedScreen extends StatelessWidget {
  /// {@macro lesson_completed_screen}
  const LessonCompletedScreen({super.key, required this.completionMessage});

  final String completionMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 50,
                right: 20,
                child: SvgPicture.asset('assets/icons/firework.svg')),
            Positioned(
                top: 170,
                left: -40,
                child: SvgPicture.asset(
                  'assets/icons/firework.svg',
                  height: 139,
                  width: 145,
                )),
            Positioned(
                bottom: 170,
                right: -20,
                child: SvgPicture.asset(
                  'assets/icons/firework.svg',
                  height: 139,
                  width: 145,
                )),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.lessonCompletedSuccesffuly,
                      style: const TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.48)),
                  Text(
                    completionMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'GoogleSans',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w100,
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(padding: EdgeInsets.all(20), child: HomeButton()),
            )
          ],
        ),
      ),
    );
  }
}
