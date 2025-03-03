import 'package:flutter/material.dart';

import 'package:elkaweer/api/transfers_api_service.dart';

import '../models/transfer_model.dart';

class TransferProvider with ChangeNotifier {
  List<Transfer> _transfers = [];
  bool _isLoading = false;

  List<Transfer> get transfers => _transfers;
  bool get isLoading => _isLoading;

  final TransfersApiService _apiService = TransfersApiService();

  Future<void> loadTransfers(int teamId) async {
    _isLoading = true;
    notifyListeners();

    _transfers = await _apiService.fetchTransfers(teamId);

    _transfers.sort((a, b) {
      DateTime dateA = DateTime.tryParse(a.transferDate) ?? DateTime(2000);
      DateTime dateB = DateTime.tryParse(b.transferDate) ?? DateTime(2000);
      return dateB.compareTo(dateA);
    });

    _isLoading = false;
    notifyListeners();
  }
}
