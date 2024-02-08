import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template about_me_screen}
/// AboutMeScreen widget.
/// {@endtemplate}
class AboutMeScreen extends StatefulWidget {
  /// {@macro about_me_screen}
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.language))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.aboutMe,
              style: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontStyle: FontStyle.normal,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                maxLines: null,
                expands: true,
                scrollPadding: EdgeInsets.all(20),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: AppLocalizations.of(context)!.writeYourTextHere),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context)!.further))
          ],
        ),
      )),
    );
  }
}
