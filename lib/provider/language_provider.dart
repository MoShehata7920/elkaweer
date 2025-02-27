import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elkaweer/resources/languages_manager.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = LanguageManager.english;

  Locale get locale => _locale;

  void changeLanguage(BuildContext context, Locale newLocale) {
    if (!LanguageManager.supportedLocales.contains(newLocale)) return;

    _locale = newLocale;
    context.setLocale(newLocale);
    notifyListeners();
  }
}
