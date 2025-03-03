import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:elkaweer/resources/consts_manager.dart';

import '../models/transfer_model.dart';

class TransfersApiService {
  static const String _apiKey = ApiConstants.matchesApiKey;
  static const String _baseUrl = ApiConstants.matchesApiBaseUrl;

  Future<List<Transfer>> fetchTransfers(int teamId) async {
    final url = Uri.parse('$_baseUrl/transfers?team=$teamId');
    final response = await http.get(
      url,
      headers: {
        'x-apisports-key': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final transfersList = jsonData['response'] as List;

      return transfersList.map((data) => Transfer.fromJson(data)).toList();
    }
    return [];
  }
}
