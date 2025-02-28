import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:elkaweer/models/match_model.dart';
import 'package:elkaweer/resources/consts_manager.dart';

class MatchesProvider extends ChangeNotifier {
  bool isLoading = true;
  List<MatchData> liveMatches = [];

  Future<void> fetchMatches() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await http.get(
        Uri.parse("${ApiConstants.matchesApiBaseUrl}/fixtures?live=all"),
        headers: {"x-apisports-key": ApiConstants.matchesApiKey},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> fixtures = data["response"];

        liveMatches =
            fixtures.map((match) => MatchData.fromJson(match)).toList();
      } else {
        if (kDebugMode) {
          print("API Error: ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching matches: $e");
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
