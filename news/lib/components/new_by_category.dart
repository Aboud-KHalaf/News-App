import 'package:flutter/material.dart';

import '../helper/helper.dart';
import '../models/article_model_api.dart';
import '../pages/article_page.dart';
import '../widgets/image_container.dart';

class NewsByCategory extends StatelessWidget {
  const NewsByCategory({
    super.key,
    required this.articlesList,
    required this.colorScheme,
  });

  final List<Article> articlesList;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articlesList.length,
      itemBuilder: (context, index) {
        return (articlesList.isEmpty)
            ? Center(
                child: Text(
                  "No Resalut",
                  style: TextStyle(
                    color: colorScheme.tertiary,
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ArticlePage.routeName,
                    arguments: articlesList[index],
                  );
                },
                child: Row(
                  children: [
                    ImageContainer(
                      margin: const EdgeInsets.all(10.0),
                      width: 80,
                      borderRadius: 5,
                      height: 80,
                      imageUrl: imageURL(articlesList[index].urlToImage!),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            articlesList[index].title!,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              color: colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 18,
                                color: colorScheme.tertiary,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${DateTime.now().difference(articlesList[index].publishedAt).inHours} hours ago',
                                style: TextStyle(
                                  color: colorScheme.secondary,
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Icon(
                                Icons.visibility,
                                color: colorScheme.tertiary,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '102 views',
                                style: TextStyle(
                                  color: colorScheme.secondary,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
