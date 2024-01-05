import 'package:eneler_mariia/src/features/application/app.dart';
import 'package:eneler_mariia/src/features/application/dependencies/dependencies.dart';
import 'package:eneler_mariia/src/features/application/wrappers/localizations_wrapper.dart';
import 'package:flutter/material.dart';

class ApplicationScope extends StatelessWidget {
  const ApplicationScope(
      {super.key, required this.dependencies, required this.locale});

  final Dependencies dependencies;
  final String locale;

  void launch(void call) {
    call;
    runApp(this);
  }

  @override
  Widget build(BuildContext context) {
    return DependenciesScope(dependencies,
        child: LocalizationsWrapper(
            locale: locale,
            prefs: dependencies.sharedPreferences,
            child: const App()));
  }
}
