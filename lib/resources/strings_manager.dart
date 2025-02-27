import 'dart:convert';
import 'package:flutter/services.dart';

class AppStrings {
  static Map<String, String> _localizedStrings = {};

  static Future<void> load(String languageCode) async {
    String jsonString =
        await rootBundle.loadString('assets/lang/$languageCode.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  static String getString(String key) {
    return _localizedStrings[key] ?? key;
  }

  // String keys (for reference)
  static const String noRouteTitle = 'noRouteTitle';
  static const String noRouteFound = 'noRouteFound';

  // Navigation Bar
  static const String news = 'news';
  static const String matches = 'matches';
  static const String transfers = 'transfers';
  static const String settings = 'settings';

  // News Screen
  static const String footballNews = "footballNews";

  // Matches Screen
  static const String liveMatches = "liveMatches";
  static const String upcomingMatches = "upcomingMatches";
  static const String vs = "vs";
  static const String score = "score";
  static const String time = "time";
  static const String dateAndTime = "dateAndTime";

  // Transfers Screen
  static const String newClub = "newClub";

  //
  static const String generalSettings = "generalSettings";
  static const String aboutApp = "aboutApp";
  static const String helpSupport = "helpSupport";
  static const String language = "language";
  static const String darkMode = "darkMode";
}
