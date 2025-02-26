import 'package:elkaweer/screens/transfers/transfer_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elkaweer/models/transfer_model.dart';
import 'package:elkaweer/provider/transfer_provider.dart';
import 'package:elkaweer/resources/strings_manager.dart';

class TransfersScreen extends StatelessWidget {
  const TransfersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.transfers),
        centerTitle: true,
      ),
      body: Consumer<TransfersProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: provider.transfers.length,
            itemBuilder: (context, index) {
              final TransferData transfer = provider.transfers[index];
              return TransferCard(
                  playerName: transfer.playerName,
                  newClub: transfer.newClub,
                  transferFee: transfer.transferFee);
            },
          );
        },
      ),
    );
  }
}
