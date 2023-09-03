import 'dart:async';
import 'package:flutter/material.dart';
import '../providers/news_provide.dart';
import '../widgets/bottom_nav_bar.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static String routeName = 'splash page';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  NewsProvider themeChangeProvider = NewsProvider();
  //?DarkThemePreference darkThemePreference = DarkThemePreference();

  @override
  void initState() {
    getCurrentAppTheme();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, BottomNavBar.routeName);
    });
    super.initState();
  }

  getCurrentAppTheme() async {
    themeChangeProvider.isDark =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/sp.png',
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
