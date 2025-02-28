import 'dart:convert';
import 'package:elkaweer/resources/consts_manager.dart';
import 'package:http/http.dart' as http;
import 'package:elkaweer/models/match_model.dart';

class MatchesApiService {
  static Future<List<MatchData>> fetchMatches(String status) async {
    final url =
        Uri.parse('${ApiConstants.matchesApiBaseUrl}/fixtures?status=$status');
    final response = await http.get(
      url,
      headers: {'x-apisports-key': ApiConstants.matchesApiKey},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> matches = data['response'];
      return matches.map((match) => MatchData.fromJson(match)).toList();
    } else {
      throw Exception('Failed to load matches');
    }
  }
}
