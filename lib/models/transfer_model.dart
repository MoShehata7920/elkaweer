class Transfer {
  final String id;
  final String playerName;
  final String playerPhoto;
  final String fromTeam;
  final String fromTeamLogo;
  final String toTeam;
  final String toTeamLogo;
  final String transferDate;

  Transfer({
    required this.id,
    required this.playerName,
    required this.playerPhoto,
    required this.fromTeam,
    required this.fromTeamLogo,
    required this.toTeam,
    required this.toTeamLogo,
    required this.transferDate,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) {
    final player = json['player'];
    final transfers = json['transfers'] as List;
    final latestTransfer = transfers.isNotEmpty ? transfers[0] : null;

    return Transfer(
      id: json['id'] ?? '',
      playerName: player['name'] ?? 'Unknown Player',
      playerPhoto: player['photo'] ?? '',
      fromTeam: latestTransfer?['teams']['out']['name'] ?? 'Unknown',
      fromTeamLogo: latestTransfer?['teams']['out']['logo'] ?? '',
      toTeam: latestTransfer?['teams']['in']['name'] ?? 'Unknown',
      toTeamLogo: latestTransfer?['teams']?['in']?['logo']?.isNotEmpty == true
          ? latestTransfer['teams']['in']['logo']
          : 'https://th.bing.com/th/id/R.d8f54b8bd0aab85b3a0e5bdcc688f6d8?rik=1x2q3JFTCbQOjA&pid=ImgRaw&r=0',
      transferDate: latestTransfer?['date'] ?? 'N/A',
    );
  }
}
