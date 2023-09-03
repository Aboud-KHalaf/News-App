import 'package:flutter/material.dart';
import 'package:news/models/article_model_api.dart';
import '../widgets/custom_tag.dart';
import '../widgets/image_container.dart';

class ArticleBody extends StatelessWidget {
  const ArticleBody({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              CustomTag(
                backgroundColor: colorScheme.tertiary.withAlpha(220),
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(article.urlToImage!),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    article.author,
                    style: TextStyle(
                      fontSize: 13,
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              CustomTag(
                backgroundColor: Colors.grey.withAlpha(150),
                children: [
                  Icon(
                    Icons.timer,
                    color: colorScheme.tertiary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${DateTime.now().difference(article.publishedAt).inHours} h',
                    style: TextStyle(
                      fontSize: 13,
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              CustomTag(
                backgroundColor: Colors.grey.withAlpha(150),
                children: [
                  Icon(
                    Icons.visibility,
                    color: colorScheme.tertiary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '102',
                    style: TextStyle(
                      fontSize: 13,
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ]),
          ),
          const SizedBox(height: 15),
          Text(
            article.description,
            style: TextStyle(
              fontSize: 21,
              color: colorScheme.tertiary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            article.content!,
            style: TextStyle(
              color: colorScheme.secondary,
              fontSize: 16,
              //fontWeight: FontWeight.bold,
              height: 1.25, // space between lines
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageContainer(
                    width: MediaQuery.of(context).size.width * 0.40,
                    imageUrl: article.urlToImage!),
                ImageContainer(
                    width: MediaQuery.of(context).size.width * 0.40,
                    imageUrl: article.urlToImage!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
