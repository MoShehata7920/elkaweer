import 'package:elkaweer/resources/consts_manager.dart';
import 'package:flutter/material.dart';
import 'package:elkaweer/resources/icons_manager.dart';
import 'package:elkaweer/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.helpSupport.tr()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.needHelp.tr(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildHelpOption(
              icon: AppIcons.question,
              title: AppStrings.faq.tr(),
              onTap: () {},
            ),
            _buildHelpOption(
              icon: AppIcons.support,
              title: AppStrings.contactSupport.tr(),
              onTap: () {
                launchUrl(Uri(scheme: "mailto", path: AppConsts.mail));
              },
            ),
            _buildHelpOption(
              icon: AppIcons.troubleshoot,
              title: AppStrings.troubleshoot.tr(),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(AppIcons.arrowForward, size: 16),
      onTap: onTap,
    );
  }
}
