import 'package:flutter/material.dart';
import '../components/errore_screen.dart';
import '../components/new_by_category.dart';
import '../components/wating_screen.dart';
import '../models/article_model_api.dart';
import '../providers/news_provide.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  static const String routeName = 'search page';

  @override
  Widget build(BuildContext context) {
    final searchBy = ModalRoute.of(context)!.settings.arguments as String;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final newsProvider = NewsProvider();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height * 0.10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Search results for ',
                      style:
                          TextStyle(color: colorScheme.secondary, fontSize: 25),
                    ),
                    Text(
                      searchBy,
                      style: TextStyle(
                        color: colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: newsProvider.fetchArticlesWithSearch(searchBy),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const WatingScreen();
                  } else if (snapshot.hasError) {
                    return const ErrorScreen();
                  } else {
                    List<Article> articlesList =
                        newsProvider.articleListWithSearch;
                    return NewsByCategory(
                        articlesList: articlesList, colorScheme: colorScheme);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
