import 'package:elkaweer/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class TransferCard extends StatelessWidget {
  final String playerName, newClub, transferFee;
  const TransferCard(
      {super.key,
      required this.playerName,
      required this.newClub,
      required this.transferFee});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(playerName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("${AppStrings.newClub}: $newClub"),
        trailing: Text(transferFee,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
