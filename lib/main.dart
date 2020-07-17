import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_demo/localization/app_localization.dart';
import 'package:localization_demo/ui/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'localization Demo',
    localizationsDelegates: [
      AppLocalization.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('en', ''),
      const Locale('ar', ''),
    ],
    localeResolutionCallback: (deviceLocale, supportedLocale) {
      for (var locale in supportedLocale) {
        if (locale.languageCode == deviceLocale.languageCode) {
          return deviceLocale;
        }
      }
      return supportedLocale.first;
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: MyHomePage(),
  ));
}
