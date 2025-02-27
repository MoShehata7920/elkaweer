import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elkaweer/provider/home_provider.dart';
import 'package:elkaweer/resources/icons_manager.dart';
import 'package:elkaweer/resources/strings_manager.dart';
import 'package:elkaweer/screens/matches/matches_screen.dart';
import 'package:elkaweer/screens/news/news_screen.dart';
import 'package:elkaweer/screens/settings/settings_screen.dart';
import 'package:elkaweer/screens/transfers/transfers_screen.dart';
import 'package:elkaweer/service/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> _screens = const [
    NewsScreen(),
    MatchesScreen(),
    TransfersScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final Color bottomNavBarColor = Utils(context).bottomNavBarColor;

    return Scaffold(
      body: PageView(
        controller: homeProvider.pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeProvider.currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red, 
        unselectedItemColor: Colors.grey,
        backgroundColor: bottomNavBarColor,
        items: _navBarItems(),
        onTap: homeProvider.changeTab, 
      ),
    );
  }

  List<BottomNavigationBarItem> _navBarItems() {
    return [
      _buildNavBarItem(AppIcons.news, AppStrings.news.tr()),
      _buildNavBarItem(AppIcons.match, AppStrings.matches.tr()),
      _buildNavBarItem(AppIcons.transfer, AppStrings.transfers.tr()),
      _buildNavBarItem(AppIcons.settings, AppStrings.settings.tr()),
    ];
  }

  BottomNavigationBarItem _buildNavBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 30),
      label: label,
    );
  }
}
