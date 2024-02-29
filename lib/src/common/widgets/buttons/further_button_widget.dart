import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

const activeFurtherButtonTextStyle = TextStyle(
    fontFamily: 'GoogleSans',
    fontStyle: FontStyle.normal,
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600);
const notActiveurtherButtonTextStyle = TextStyle(
    fontFamily: 'GoogleSans',
    fontStyle: FontStyle.normal,
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w600);

/// {@template further_button_widget}
/// FurtherButtonWidget widget.
/// {@endtemplate}
class FurtherButtonWidget extends StatelessWidget {
  /// {@macro further_button_widget}
  const FurtherButtonWidget(
      {super.key, required this.isActive, required this.onPressed});

  final VoidCallback onPressed;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onPressed.call();
        },
        style: isActive
            ? ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                backgroundColor: const Color.fromRGBO(96, 101, 214, 1),
              )
            : ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                backgroundColor: const Color.fromRGBO(202, 202, 202, 1),
              ),
        child: Text(
          AppLocalizations.of(context)!.further,
          style: isActive
              ? activeFurtherButtonTextStyle
              : notActiveurtherButtonTextStyle,
        ),
      ),
    );
  }
}
