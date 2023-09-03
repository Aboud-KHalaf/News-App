import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news/models/article_model_api.dart';
import 'package:news/providers/news_provide.dart';

import '../components/breaking_news.dart';
import '../components/error_screen.dart';
import '../components/errore_screen.dart';
import '../components/news_of_the_day.dart';
import '../components/wating_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    final newsProvider = NewsProvider();
    bool isDark = newsProvider.isDark;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              (isDark) ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: () async {
              await Provider.of<NewsProvider>(context, listen: false)
                  .changeTheme();
            },
          ),
          // actions: [
          //   GestureDetector(
          //     onTap: () {
          //       Provider.of<NewsProvider>(context, listen: false)
          //           .changeCountry();
          //     },
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Image.asset(
          //         (Provider.of<NewsProvider>(context).country == 'eg')
          // /            ? 'assets/eg.png'
          //             : 'assets/us.png',
          //         width: 30,
          //       ),
          //     ),
          //   )
          // ],
        ),
        extendBodyBehindAppBar: true,
        body: FutureBuilder(
          future: newsProvider.fetchArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const WatingScreen();
            } else if (snapshot.hasError) {
              return const ErrorScreen();
            } else {
              List<Article> articlesList = newsProvider.articleList;
              return ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  NewsOfTheDay(articles: articlesList, size: size),
                  BreakingNews(
                    size: size,
                    articles: articlesList,
                  ),
                ],
              );
            }
          },
        ));
  }
}
