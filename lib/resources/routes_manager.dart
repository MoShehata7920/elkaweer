import 'package:easy_localization/easy_localization.dart';
import 'package:elkaweer/screens/settings/settings_screens/help_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elkaweer/provider/home_provider.dart';
import 'package:elkaweer/resources/strings_manager.dart';
import 'package:elkaweer/screens/home/home_screen.dart';
import 'package:elkaweer/screens/settings/settings_screens/about_screen.dart';
import 'package:elkaweer/screens/splash_screen/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String aboutScreenRoute = '/aboutScreenRoute';
  static const String helpScreenRoute = '/helpScreenRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.aboutScreenRoute:
        return MaterialPageRoute(builder: (context) => const AboutScreen());

      case Routes.helpScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const HelpSupportScreen());

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => HomeProvider(),
            child: const HomeScreen(),
          ),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteTitle.tr()),
              ),
              body: Center(child: Text(AppStrings.noRouteFound.tr())),
            ));
  }
}
