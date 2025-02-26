import 'package:flutter/material.dart';
import 'package:elkaweer/models/transfer_model.dart';

class TransfersProvider extends ChangeNotifier {
  bool isLoading = true;
  final List<TransferData> _transfers = [
    TransferData(playerName: "Lionel Messi", newClub: "Inter Miami", transferFee: "Free"),
    TransferData(playerName: "Jude Bellingham", newClub: "Real Madrid", transferFee: "€103M"),
    TransferData(playerName: "Harry Kane", newClub: "Bayern Munich", transferFee: "€100M"),
  ];

  List<TransferData> get transfers => _transfers;

  TransfersProvider() {
    fetchTransfers();
  }

  void fetchTransfers() {
    Future.delayed(const Duration(seconds: 1), () {
      isLoading = false;
      notifyListeners();
    });
  }
}
