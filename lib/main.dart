import 'package:elkaweer/provider/match_provider.dart';
import 'package:elkaweer/provider/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elkaweer/provider/prefs_provider.dart';
import 'package:elkaweer/resources/routes_manager.dart';
import 'package:elkaweer/screens/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final prefsProvider = PrefsProvider();
            prefsProvider.initPrefs(); // Initialize inside provider
            return prefsProvider;
          },
        ),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => MatchesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      home: SplashScreen(),
    );
  }
}
