import 'package:easy_localization/easy_localization.dart';
import 'package:elkaweer/resources/assets_manager.dart';
import 'package:elkaweer/resources/consts_manager.dart';
import 'package:elkaweer/resources/icons_manager.dart';
import 'package:elkaweer/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.aboutApp.tr()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(AppImages.appLogo),
            ),
            const SizedBox(height: 12),

            const Text(
              "Elkaweer",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text(
              "${AppStrings.version.tr()} ${AppConsts.versionNumber}",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            Text(
              AppStrings.appDescription.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Developer Info
            ListTile(
              leading: const Icon(AppIcons.developer, color: Colors.blue),
              title: Text(AppStrings.developer.tr()),
              subtitle: const Text(AppStrings.myName).tr(),
            ),

            ListTile(
              leading: const Icon(AppIcons.facebook, color: Colors.green),
              title: Text(AppStrings.facebook.tr()),
              onTap: () {
                launchFacebookUrl();
              },
            ),

            ListTile(
              leading: const Icon(AppIcons.instagram, color: Colors.red),
              title: Text(AppStrings.instagram.tr()),
              onTap: () {
                launchInstagramUrl();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launchFacebookUrl() async {
    if (!await launchUrl(AppConsts.facebookUrl)) {
      throw Exception('Could not launch $AppConsts.facebookUrl');
    }
  }

  Future<void> launchInstagramUrl() async {
    if (!await launchUrl(AppConsts.instagramUrl)) {
      throw Exception('Could not launch $AppConsts.instagramUrl');
    }
  }
}
