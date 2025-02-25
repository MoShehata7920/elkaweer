class MatchData {
  final String homeTeam;
  final String awayTeam;
  final String? score;
  final String timeOrDate;
  final bool isLive;

  MatchData({
    required this.homeTeam,
    required this.awayTeam,
    this.score,
    required this.timeOrDate,
    required this.isLive,
  });
}
