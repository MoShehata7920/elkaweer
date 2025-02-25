import 'package:flutter/material.dart';

import 'package:elkaweer/resources/icons_manager.dart';
import 'package:elkaweer/resources/strings_manager.dart';
import 'package:elkaweer/screens/matches/matches_screen.dart';
import 'package:elkaweer/screens/news/news_screen.dart';
import 'package:elkaweer/screens/settings/settings_screen.dart';
import 'package:elkaweer/screens/transfers/transfers_screen.dart';
import 'package:elkaweer/service/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  final List<Widget> _screens = [
    const NewsScreen(),
    const MatchesScreen(),
    const TransfersScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final Color bottomNavBarColor = Utils(context).bottomNavBarColor;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red, // Customize color
        unselectedItemColor: Colors.grey,
        backgroundColor: bottomNavBarColor,
        items: _navBarItems(),
        onTap: _onNavBarTapped,
      ),
    );
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  List<BottomNavigationBarItem> _navBarItems() {
    return [
      _buildNavBarItem(AppIcons.news, AppStrings.news),
      _buildNavBarItem(AppIcons.match, AppStrings.matches),
      _buildNavBarItem(AppIcons.transfer, AppStrings.transfers),
      _buildNavBarItem(AppIcons.settings, AppStrings.settings),
    ];
  }

  BottomNavigationBarItem _buildNavBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 30),
      label: label,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
