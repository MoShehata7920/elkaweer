import 'package:elkaweer/provider/transfer_provider.dart';
import 'package:elkaweer/resources/strings_manager.dart';
import 'package:elkaweer/screens/transfers/transfer_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransfersScreen extends StatelessWidget {
  const TransfersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transfersProvider = Provider.of<TransfersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.transfers),
        centerTitle: true,
      ),
      body: transfersProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: transfersProvider.transfers.length,
              itemBuilder: (context, index) {
                final transfer = transfersProvider.transfers[index];
                return TransferCard(
                    playerName: transfer.playerName,
                    newClub: transfer.newClub,
                    transferFee: transfer.transferFee);
              },
            ),
    );
  }
}
