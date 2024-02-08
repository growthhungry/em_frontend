import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

/// {@template further_button_widget}
/// FurtherButtonWidget widget.
/// {@endtemplate}
class FurtherButtonWidget extends StatelessWidget {
  /// {@macro further_button_widget}
  const FurtherButtonWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        return onPressed.call();
      },
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(343, 50),
        minimumSize: const Size(343, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: const Color.fromRGBO(96, 101, 214, 1),
      ),
      child: Text(
        AppLocalizations.of(context)!.further,
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
