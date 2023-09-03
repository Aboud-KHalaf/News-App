import 'package:flutter/material.dart';
import 'package:news/models/article_model_api.dart';

import '../widgets/custom_tag.dart';

class NewsHeadLine extends StatelessWidget {
  const NewsHeadLine({
    required this.article,
    super.key,
  });
  final Article article;
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                'News',
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            article.title!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.25, // space between lines
            ),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: article.url,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              // recognizer: TapGestureRecognizer()
              //   ..onTap = () {
              //     print("gdsgjksglksjgs");
             
              //     launch(
              //         'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
              //   },
            ),
          ])),
        ],
      ),
    );
  }
}
