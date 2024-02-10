import 'package:eneler_mariia/src/features/application/widgets/navigation_widget.dart';
import 'package:eneler_mariia/src/features/education/videos/presentation/screens/video_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template home_button}
/// HomeButton widget.
/// {@endtemplate}
class HomeButton extends StatelessWidget {
  /// {@macro home_button}
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NavigationWidget()));
      },
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(343, 50),
        minimumSize: const Size(343, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: const Color.fromRGBO(96, 101, 214, 1),
      ),
      child: Text(
        AppLocalizations.of(context)!.toMain,
        style: const TextStyle(
            fontFamily: 'GoogleSans',
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
