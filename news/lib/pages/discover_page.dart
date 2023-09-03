import 'package:flutter/material.dart';

import '../components/category_descover_news.dart';
import '../components/descover_news.dart';
import '../helper/helper.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  static String routeName = '/discoverPage';

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          leading: Icon(
            Icons.newspaper,
            color: colorScheme.secondary,
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          children: [
            const DescoverNews(),
            CategoryNews(
              tabs: tabs,
            ),
          ],
        ),
      ),
    );
  }
}
