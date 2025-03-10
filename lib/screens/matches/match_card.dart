import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:elkaweer/resources/icons_manager.dart';
import 'package:elkaweer/resources/strings_manager.dart';

class MatchCard extends StatelessWidget {
  final String homeTeam, awayTeam, matchScore, matchTimeOrDate;
  final bool isLive;
  const MatchCard(
      {super.key,
      required this.homeTeam,
      required this.awayTeam,
      required this.matchScore,
      required this.matchTimeOrDate,
      required this.isLive});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text("$homeTeam ${AppStrings.vs.tr()} $awayTeam",
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(isLive
            ? "${AppStrings.score.tr()} $matchScore | ${AppStrings.time.tr()} $matchTimeOrDate"
            : "${AppStrings.dateAndTime.tr()} $matchTimeOrDate"),
        trailing: isLive ? const Icon(AppIcons.match, color: Colors.red) : null,
      ),
    );
  }
}
