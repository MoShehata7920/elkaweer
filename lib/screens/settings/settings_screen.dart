import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elkaweer/provider/language_provider.dart';
import 'package:elkaweer/resources/consts_manager.dart';
import 'package:elkaweer/resources/icons_manager.dart';
import 'package:elkaweer/resources/languages_manager.dart';
import 'package:elkaweer/resources/strings_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settings.tr()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.generalSettings.tr(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildLanguageSetting(context),
            const SizedBox(height: 20),
            _buildDarkModeSetting(context),
            const SizedBox(height: 20),
            _buildSettingsOption(
              icon: AppIcons.info,
              title: AppStrings.aboutApp.tr(),
              onTap: () {},
            ),
            _buildSettingsOption(
              icon: AppIcons.help,
              title: AppStrings.helpSupport.tr(),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSetting(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return ListTile(
      leading: const Icon(AppIcons.language, color: Colors.blue),
      title: Text(AppStrings.language.tr()),
      subtitle: Text(
        languageProvider.locale.languageCode == "ar"
            ? AppLanguages.arabic
            : AppLanguages.english,
      ),
      trailing: DropdownButton<Locale>(
        value: languageProvider.locale,
        items: LanguageManager.supportedLocales.map((locale) {
          return DropdownMenuItem(
            value: locale,
            child: Text(locale.languageCode == "ar"
                ? AppLanguages.arabic
                : AppLanguages.english),
          );
        }).toList(),
        onChanged: (Locale? newLocale) {
          if (newLocale != null) {
            languageProvider.changeLanguage(context, newLocale);
          }
        },
      ),
    );
  }

  Widget _buildDarkModeSetting(BuildContext context) {
    return ListTile(
      leading: const Icon(AppIcons.mode, color: Colors.orange),
      title: Text(AppStrings.darkMode.tr()),
      trailing: Switch(
        value: false,
        onChanged: (bool value) {},
      ),
    );
  }

  Widget _buildSettingsOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      trailing: const Icon(AppIcons.arrowForward, size: 16),
      onTap: onTap,
    );
  }
}
