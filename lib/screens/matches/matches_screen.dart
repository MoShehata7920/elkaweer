import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elkaweer/models/match_model.dart';
import 'package:elkaweer/provider/match_provider.dart';
import 'package:elkaweer/resources/strings_manager.dart';
import 'package:elkaweer/screens/matches/match_card.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matchesProvider = Provider.of<MatchesProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.matches).tr(),
        centerTitle: true,
      ),
      body: matchesProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.liveMatches.tr(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    _buildMatchList(matchesProvider.liveMatches, isLive: true),
                    const SizedBox(height: 20),
                    Text(AppStrings.upcomingMatches.tr(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    _buildMatchList(matchesProvider.upcomingMatches),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildMatchList(List<MatchData> matches, {bool isLive = false}) {
    return Column(
      children: matches.map((match) {
        return MatchCard(
            homeTeam: match.homeTeam,
            awayTeam: match.awayTeam,
            matchScore: match.score ?? "",
            matchTimeOrDate: match.timeOrDate,
            isLive: isLive);
      }).toList(),
    );
  }
}
