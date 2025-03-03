import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:elkaweer/models/transfer_model.dart';
import 'package:elkaweer/resources/assets_manager.dart';
import 'package:elkaweer/resources/strings_manager.dart';

class TransferCard extends StatelessWidget {
  final Transfer transfer;

  const TransferCard({super.key, required this.transfer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
          title: Text(transfer.playerName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${transfer.fromTeam} → ${transfer.toTeam}'),
              Text('${AppStrings.transferDate.tr()} ${transfer.transferDate}'),
            ],
          ),
          trailing: Image.network(
            transfer.toTeamLogo,
            width: 40,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(AppImages.appLogo, width: 40);
            },
          )),
    );
  }
}
