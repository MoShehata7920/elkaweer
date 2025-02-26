import 'package:elkaweer/models/match_model.dart';
import 'package:elkaweer/provider/match_provider.dart';
import 'package:elkaweer/resources/icons_manager.dart';
import 'package:elkaweer/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MatchesProvider()..fetchMatches(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.matches),
          centerTitle: true,
        ),
        body: Consumer<MatchesProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(AppStrings.liveMatches,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    _buildMatchList(provider.liveMatches, isLive: true),
                    const SizedBox(height: 20),
                    const Text(AppStrings.upcomingMatches,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    _buildMatchList(provider.upcomingMatches),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMatchList(List<MatchData> matches, {bool isLive = false}) {
    return Column(
      children: matches.map((match) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text("${match.homeTeam} ${AppStrings.vs} ${match.awayTeam}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(isLive
                ? "${AppStrings.score} ${match.score} | ${AppStrings.time} ${match.timeOrDate}"
                : "${AppStrings.dateAndTime} ${match.timeOrDate}"),
            trailing:
                isLive ? const Icon(AppIcons.match, color: Colors.red) : null,
          ),
        );
      }).toList(),
    );
  }
}
