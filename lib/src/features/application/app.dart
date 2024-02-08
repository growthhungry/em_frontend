import 'package:eneler_mariia/src/features/application/wrappers/localizations_wrapper.dart';
import 'package:eneler_mariia/src/features/authentication/presentation/screens/about_me_screen.dart';
import 'package:eneler_mariia/src/features/education/survey/presentation/screens/survey_screen.dart';
import 'package:eneler_mariia/src/features/education/survey/presentation/widgets/describe_one_answer_widget.dart';
import 'package:eneler_mariia/src/features/education/survey/presentation/widgets/fill_text_field_widget.dart';
import 'package:eneler_mariia/src/features/education/survey/presentation/widgets/switch_answer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: LocalizationsScope.of(context).data,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: SwitchAnswerWidget());
  }
}
