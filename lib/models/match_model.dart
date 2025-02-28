class MatchData {
  final String homeTeam;
  final String awayTeam;
  final String? score;
  final String timeOrDate;

  MatchData({
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
    required this.timeOrDate,
  });

  factory MatchData.fromJson(Map<String, dynamic> json) {
    return MatchData(
      homeTeam: json["teams"]["home"]["name"] ?? "Unknown",
      awayTeam: json["teams"]["away"]["name"] ?? "Unknown",
      score: json["goals"]["home"] != null && json["goals"]["away"] != null
          ? "${json["goals"]["home"]} - ${json["goals"]["away"]}"
          : "--",
      timeOrDate:
          json["fixture"]["date"] ?? "No Date", // Ensure this is correct
    );
  }
}
