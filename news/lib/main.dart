import 'package:flutter/material.dart';
import 'package:news/pages/search_page.dart';
import 'package:news/pages/splash_page.dart';
import 'package:news/providers/news_provide.dart';
import 'package:news/pages/article_page.dart';
import 'package:news/pages/discover_page.dart';
import 'package:news/pages/home_page.dart';
import 'package:news/themes/dark_theme.dart';
import 'package:news/themes/light_theme.dart';
import 'package:news/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<NewsProvider>(context).isDark;
    return MaterialApp(
      theme: (isDark) ? darkTheme : lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ArticlePage.routeName: (context) => const ArticlePage(),
        DiscoverPage.routeName: (context) => const DiscoverPage(),
        BottomNavBar.routeName: (context) => const BottomNavBar(),
        SearchPage.routeName:(context) => const SearchPage(),
      },
      initialRoute: SplashPage.routeName,
    );
  }
}
