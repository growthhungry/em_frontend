import 'dart:async';

import 'package:eneler_mariia/src/common/external/options/firebase_options.dart';
import 'package:eneler_mariia/src/features/application/application_scope.dart';
import 'package:eneler_mariia/src/features/application/dependencies/dependencies.dart';
import 'package:eneler_mariia/src/features/application/wrappers/localizations_wrapper.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/utils/logger/logger.dart';

class Runner {
  static Future<void> runApplication() async => runZonedGuarded(() async {
        WidgetsBinding widgetsBinding =
            WidgetsFlutterBinding.ensureInitialized();
        FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);

        await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform);

        await FirebaseAppCheck.instance.activate(
          androidProvider: AndroidProvider.debug,
          appleProvider: AppleProvider.debug,
        );

        final Dependencies dependencies = Dependencies();
        await dependencies.init();

        await LocalizationHelper.getLocale(dependencies.sharedPreferences).then(
            (locale) =>
                ApplicationScope(dependencies: dependencies, locale: locale)
                    .launch(FlutterNativeSplash.remove()));
      }, (error, stack) {
        logger.e('Zoned E: ', error: error, stackTrace: stack);
      });
}
