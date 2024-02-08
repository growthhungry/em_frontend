import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template fill_text_field_widget}
/// FillTextFieldWidget widget.
/// {@endtemplate}
class FillTextFieldWidget extends StatefulWidget {
  /// {@macro fill_text_field_widget}
  const FillTextFieldWidget({super.key});

  @override
  State<FillTextFieldWidget> createState() => _FillTextFieldWidgetState();
}

class _FillTextFieldWidgetState extends State<FillTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                'Напиште эссе на тему синдром самозванца',
                style: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    wordSpacing: 0.2),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null,
                  expands: true,
                  scrollPadding: EdgeInsets.all(20),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(),
                      hintText:
                          AppLocalizations.of(context)!.writeYourTextHere),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
