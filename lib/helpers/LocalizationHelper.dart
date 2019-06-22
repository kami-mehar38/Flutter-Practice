import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MyLocalizations {
  /// list of languages supported by the application
  static List<String> languages = ['en', 'ar'];

  final Map<String, Map<String, String>> _localizedValues;
  final Locale _locale;

  /// Constructor that initializes the locale instance and localized values instance
  MyLocalizations(this._locale, this._localizedValues);

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  String get submit {
    return _localizedValues[_locale.languageCode]['submit'];
  }

  String get settings {
    return _localizedValues[_locale.languageCode]['settings'];
  }

  String get email {
    return _localizedValues[_locale.languageCode]['email'];
  }

  String get password {
    return _localizedValues[_locale.languageCode]['password'];
  }

  String get login {
    return _localizedValues[_locale.languageCode]['login'];
  }

  String get loginCapital {
    return _localizedValues[_locale.languageCode]['loginCapital'];
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  Map<String, Map<String, String>> localizedValues;

  MyLocalizationsDelegate(this.localizedValues);

  @override
  bool isSupported(Locale locale) => MyLocalizations.languages.contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) {
    return SynchronousFuture<MyLocalizations>(
        MyLocalizations(locale, localizedValues));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}


///////////////// File Functions /////////////////

/*
  This function gets the translation json file from the assets according to the
  provided language code

  - parameter
    language: language code of the current locale

  - return
    Future<String>: future of json string file
 */
Future<String> loadJsonFromAsset(language) async {
  return await rootBundle.loadString('assets/i18n/' + language + '.json');
}

Map<String, String> convertValueToString(obj) {
  Map<String, String> result = {};
  obj.forEach((key, value) {
    result[key] = value.toString();
  });
  return result;
}

Future<Map<String, Map<String, String>>> initializeI18n() async {
  Map<String, Map<String, String>> values = {};
  for (String language in MyLocalizations.languages) {
    Map<String, dynamic> translation =
    json.decode(await loadJsonFromAsset(language));
    values[language] = convertValueToString(translation);
  }
  return values;
}
