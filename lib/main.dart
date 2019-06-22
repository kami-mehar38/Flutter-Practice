import 'package:flutter/material.dart';
import 'package:mo_delawer/ui/LoginSignup.dart';
import 'ui/HomePage.dart';
import 'ui/PersonalQuestionnaire.dart';
import 'ui/Agreement.dart';
import 'helpers/LocalizationHelper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  Map<String, Map<String, String>> localizedValues = await initializeI18n();
  runApp(MyApp(localizedValues));
}

class MyApp extends StatefulWidget {
  /// localized values
  final Map<String, Map<String, String>> _localizedValues;

  /// Constructor that initializes the localized values
  MyApp(this._localizedValues);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  /// Current Locale
  String _locale = 'en';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: Locale(_locale),
      localizationsDelegates: [
        MyLocalizationsDelegate(widget._localizedValues),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales:
          MyLocalizations.languages.map((language) => Locale(language, '')),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginSignup(),
      routes: <String, WidgetBuilder>{
        'ui/Agreement': (BuildContext context) => Agreement(),
        'ui/Home': (BuildContext context) => HomePage(),
        'ui/PersonalQuestionnaire': (BuildContext context) =>
            PersonalQuestionnaire(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
