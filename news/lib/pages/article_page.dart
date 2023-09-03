import 'package:flutter/material.dart';
import 'package:news/models/article_model_api.dart';
import 'package:news/widgets/image_container.dart';
import '../components/article_body.dart';
import '../components/article_news_headline.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});
  static String routeName = '/articlePage';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return ImageContainer(
      imageUrl: article.urlToImage!,
      height: double.infinity,
      width: double.infinity,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          children: [
            NewsHeadLine(
              article: article,
            ),
            ArticleBody(
              article: article,
            ),
          ],
        ),
      ),
    );
  }
}
