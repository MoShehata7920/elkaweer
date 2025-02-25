import 'dart:async';

import 'package:elkaweer/resources/assets_manager.dart';
import 'package:elkaweer/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(JsonAssets.splashScreen),
    );
  }

  void navigateToHome() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, Routes.homeRoute));
  }
}
