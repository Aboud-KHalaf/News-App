import 'package:flutter/material.dart';
import 'package:news/models/article_model_api.dart';
import '../helper/helper.dart';
import '../pages/article_page.dart';
import '../widgets/image_container.dart';

class BreakingNews extends StatelessWidget {
  const BreakingNews({
    super.key,
    required this.articles,
    required this.size,
  });
  final Size size;
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style: TextStyle(
                  fontSize: 28,
                  color: colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'more',
                  style: TextStyle(
                    color: colorScheme.tertiary,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 350,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ArticlePage.routeName,
                    arguments: articles[index],
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageContainer(
                        borderRadius: 17,
                        height: 200,
                        width: size.width * 0.5,
                        imageUrl: imageURL(articles[index].urlToImage!),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        articles[index].title!,
                        maxLines: 2,
                        style: TextStyle(
                          color: colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '${DateTime.now().difference(articles[index].publishedAt).inHours} hours ago',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'by ${articles[index].author} ',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
