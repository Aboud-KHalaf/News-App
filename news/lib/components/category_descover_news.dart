import 'package:flutter/material.dart';
import 'package:news/components/wating_screen.dart';
import 'package:news/providers/news_provide.dart';
import '../helper/helper.dart';
import '../models/article_model_api.dart';
import '../pages/home_page.dart';
import 'errore_screen.dart';
import 'new_by_category.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({
    super.key,
    required this.tabs,
  });

  final List<String> tabs;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    final newsProvider = NewsProvider();
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tabs.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(5),
                  height: 10,
                  width: 110,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(16),
                    border: (currentIndex == index)
                        ? Border.all(color: colorScheme.tertiary, width: 2)
                        : null,
                  ),
                  child: Text(
                    tabs[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: size.height * 0.60,
          child: FutureBuilder(
            future: newsProvider.fetchArticlesWithCategory(tabs[currentIndex]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const WatingScreen();
              } else if (snapshot.hasError) {
                return const ErrorScreen();
              } else {
                List<Article> articlesList =
                    newsProvider.articleListWithCategory;
                return NewsByCategory(
                    articlesList: articlesList, colorScheme: colorScheme);
              }
            },
          ),
        )
      ],
    );
  }
}
