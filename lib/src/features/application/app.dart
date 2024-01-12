import 'package:eneler_mariia/src/features/application/widgets/navigation_widget.dart';
import 'package:eneler_mariia/src/features/application/wrappers/localizations_wrapper.dart';
import 'package:eneler_mariia/src/features/profile/presentation/screen/profile_screen.dart';
import 'package:flutter/material.dart';

import '../authentication/authentication_listener/authentication_listener.dart';
import '../authentication/presentation/screens/authentication_screen.dart';
import '../education/survey/presentation/screens/multiple_choice_screen.dart';
import '../education/survey/presentation/screens/one_answer_screen.dart';
import '../education/survey/presentation/screens/short_paragraph_screen.dart';
import '../education/videos/presentation/screens/education_video_screen.dart';
import '../education/videos/presentation/screens/video_list_screen.dart';
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
        home: ShortParagraphScreen());
  }
}
