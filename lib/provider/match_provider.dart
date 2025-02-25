import 'package:flutter/material.dart';
import '../models/match_model.dart';

class MatchesProvider extends ChangeNotifier {
  List<MatchData> _liveMatches = [];
  List<MatchData> _upcomingMatches = [];
  bool _isLoading = true;

  List<MatchData> get liveMatches => _liveMatches;
  List<MatchData> get upcomingMatches => _upcomingMatches;
  bool get isLoading => _isLoading;

  Future<void> fetchMatches() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _liveMatches = [
      MatchData(
          homeTeam: "Barcelona",
          awayTeam: "Real Madrid",
          score: "2 - 1",
          timeOrDate: "78'",
          isLive: true),
      MatchData(
          homeTeam: "Liverpool",
          awayTeam: "Man City",
          score: "1 - 1",
          timeOrDate: "45'",
          isLive: true),
    ];

    _upcomingMatches = [
      MatchData(
          homeTeam: "Arsenal",
          awayTeam: "Chelsea",
          score: null,
          timeOrDate: "Feb 28, 20:00",
          isLive: false),
      MatchData(
          homeTeam: "Bayern",
          awayTeam: "Dortmund",
          score: null,
          timeOrDate: "March 3, 18:30",
          isLive: false),
    ];

    _isLoading = false;
    notifyListeners();
  }
}
