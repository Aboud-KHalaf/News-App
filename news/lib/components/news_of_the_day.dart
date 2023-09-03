import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news/models/article_model_api.dart';
import '../pages/article_page.dart';
import '../widgets/custom_tag.dart';
import '../widgets/image_container.dart';

class NewsOfTheDay extends StatefulWidget {
  const NewsOfTheDay({
    super.key,
    required this.articles,
    required this.size,
  });

  final List<Article> articles;
  final Size size;

  @override
  State<NewsOfTheDay> createState() => _NewsOfTheDayState();
}

class _NewsOfTheDayState extends State<NewsOfTheDay> {
  int _index = 0;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        _index = (_index + 1) % widget.articles.length;
      });
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(microseconds: 800),
      transitionBuilder: (Widget image, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: image,
        );
      },
      child: ImageContainer(
        noTopRadios: true,
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        imageUrl: widget.articles[_index].urlToImage!,
        height: widget.size.height * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTag(
              backgroundColor: Colors.grey.withAlpha(150),
              children: const [
                Text(
                  "News of the day",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              widget.articles[_index].title!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.25, // space between lines
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {
                Navigator.of(context).pushNamed(ArticlePage.routeName,
                    arguments: widget.articles[_index]);
              },
              child: Row(
                children: [
                  Text(
                    'show more',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Theme.of(context).colorScheme.tertiary,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
