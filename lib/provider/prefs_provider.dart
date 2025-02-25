import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsProvider with ChangeNotifier {
  SharedPreferences? _prefs;

  SharedPreferences get prefs => _prefs!;

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    notifyListeners();
  }

  bool get isReady => _prefs != null;
}
