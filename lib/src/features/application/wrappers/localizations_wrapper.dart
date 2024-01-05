import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationsWrapper extends StatefulWidget {
  const LocalizationsWrapper(
      {super.key,
      required this.locale,
      required this.child,
      required this.prefs});

  final Widget child;
  final String locale;
  final SharedPreferences prefs;

  static LocalizationsWrapperState of(BuildContext context) {
    return context.findAncestorStateOfType<LocalizationsWrapperState>()!;
  }

  @override
  LocalizationsWrapperState createState() => LocalizationsWrapperState();
}

class LocalizationsWrapperState extends State<LocalizationsWrapper> {
  late Locale locale;

  @override
  Widget build(BuildContext context) {
    return LocalizationsScope(data: locale, child: widget.child);
  }

  @override
  void initState() {
    /// Here we are getting [ LangCode ] from local storage
    locale = Locale(widget.locale);
    super.initState();
  }

  String getInitialLangCode() {
    return locale.languageCode;
  }

  Future<void> selectLanguage(String langCode) async {
    if (langCode != locale.languageCode) {
      switch (langCode) {
        case 'en':
          await _saveLocale(langCode)
              .then((value) => _updateLocaleState(langCode));
        case 'ru':
          await _saveLocale(langCode)
              .then((value) => _updateLocaleState(langCode));
        case 'ky':
          await _saveLocale(langCode)
              .then((value) => _updateLocaleState(langCode));
        case 'kk':
          await _saveLocale(langCode)
              .then((value) => _updateLocaleState(langCode));
      }
    }
  }

  Future<void> _saveLocale(String langCode) async {
    try {
      await widget.prefs.setString('locale', langCode);
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }

  void _updateLocaleState(final String langCode) {
    setState(() {
      locale = Locale(langCode);
    });
  }
}

class LocalizationsScope extends InheritedWidget {
  const LocalizationsScope({
    super.key,
    required this.data,
    required super.child,
  });

  final Locale data;

  static LocalizationsScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LocalizationsScope>();
  }

  static LocalizationsScope of(BuildContext context) {
    final LocalizationsScope? result = maybeOf(context);
    assert(result != null, 'No LocalizationsScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(LocalizationsScope oldWidget) =>
      data != oldWidget.data;
}

class LocalizationHelper {
  /// If there is no value included in shared preference, then we return [ RU ]
  static Future<String> getLocale(SharedPreferences prefs) async {
    return prefs.getString('locale') ?? 'ru';
  }
}
