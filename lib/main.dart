import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elkaweer/provider/home_provider.dart';
import 'package:elkaweer/provider/language_provider.dart';
import 'package:elkaweer/provider/match_provider.dart';
import 'package:elkaweer/provider/news_provider.dart';
import 'package:elkaweer/provider/prefs_provider.dart';
import 'package:elkaweer/provider/theme_provider.dart';
import 'package:elkaweer/provider/transfer_provider.dart';
import 'package:elkaweer/resources/consts_manager.dart';
import 'package:elkaweer/resources/routes_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(
            create: (_) {
              final prefsProvider = PrefsProvider();
              prefsProvider.initPrefs();
              return prefsProvider;
            },
          ),
          ChangeNotifierProvider(create: (_) => NewsProvider()),
          ChangeNotifierProvider(create: (_) => MatchesProvider()),
          ChangeNotifierProvider(create: (_) => TransferProvider()),
          ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ],
        child: EasyLocalization(
          path: AppConsts.assetPathLocalization,
          supportedLocales: const [Locale('en'), Locale('ar')],
          fallbackLocale: const Locale('en'),
          child: const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Consumer<LanguageProvider>(builder: (context, provider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        themeMode: themeProvider.themeMode,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
      );
    });
  }
}
