import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elkaweer/models/match_model.dart';
import 'package:elkaweer/provider/match_provider.dart';
import 'package:elkaweer/resources/strings_manager.dart';
import 'package:elkaweer/screens/matches/match_card.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Provider.of<MatchesProvider>(context, listen: false).fetchMatches();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final matchesProvider = Provider.of<MatchesProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.matches).tr(),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await matchesProvider.fetchMatches();
        },
        child: matchesProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.liveMatches.tr(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      _buildMatchList(matchesProvider.liveMatches,
                          isLive: true),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildMatchList(List<MatchData> matches, {bool isLive = false}) {
    return matches.isEmpty
        ? Center(child: Text(AppStrings.noMatchesAvailable.tr()))
        : Column(
            children: matches.map((match) {
              return MatchCard(
                homeTeam: match.homeTeam,
                awayTeam: match.awayTeam,
                matchScore: match.score ?? "",
                matchTimeOrDate: match.timeOrDate,
                isLive: isLive,
              );
            }).toList(),
          );
  }
}
