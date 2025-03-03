import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elkaweer/provider/transfer_provider.dart';
import 'package:elkaweer/resources/strings_manager.dart';
import 'package:elkaweer/screens/transfers/transfer_card.dart';

class TransfersScreen extends StatefulWidget {
  const TransfersScreen({super.key});

  @override
  TransfersScreenState createState() => TransfersScreenState();
}

class TransfersScreenState extends State<TransfersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int teamId = 33; // Replace with a valid team ID or get it dynamically
      Provider.of<TransferProvider>(context, listen: false)
          .loadTransfers(teamId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransferProvider>(context);
    final transfers = provider.transfers;

    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.latestTransfers.tr())),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : transfers.isEmpty
              ? Center(child: Text(AppStrings.noTransfersAvailable.tr()))
              : ListView.builder(
                  itemCount: transfers.length,
                  itemBuilder: (context, index) {
                    final transfer = transfers[index];

                    return TransferCard(transfer: transfer);
                  },
                ),
    );
  }
}
