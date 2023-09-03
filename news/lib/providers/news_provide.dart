import 'package:flutter/foundation.dart';
import 'package:news/services/news_api_services.dart';
import '../models/article_model_api.dart';
import '../services/upload_data_service.dart';

class NewsProvider extends ChangeNotifier {
  String _country = 'us';
  String get country => _country;
  void setCountry(String country) {
    _country = country;
    notifyListeners();
  }

  void changeCountry() {
    if (country == 'eg') {
      setCountry('us');
    } else {
      setCountry('eg');
    }
  }

  List<Article> _articlesList = [];
  List<Article> _articlesListWithCategory = [];
  List<Article> _articlesListWithSearch = [];

  NewsApi newsApi = NewsApi();
  NewsApiWithCategory newsApiWithCategory = NewsApiWithCategory();
  NewsApiWithSearch newsApiWithSearch = NewsApiWithSearch();

  fetchArticles() async {
    _articlesList = await newsApi.fetchArticles(_country);
    if (kDebugMode) {
      print("fetch Done");
    }
    notifyListeners();
  }

  fetchArticlesWithCategory(String category) async {
    _articlesListWithCategory =
        await newsApiWithCategory.fetchArticlesWithCategory(category, _country);
    if (kDebugMode) {
      print(
          "fetch with category $category Done ans ${_articlesListWithCategory.length}");
    }
    notifyListeners();
  }

  fetchArticlesWithSearch(String searchFor) async {
    _articlesListWithSearch =
        await newsApiWithSearch.fetchArticleWithSearch(searchFor, _country);
    if (kDebugMode) {
      print(
          "fetch with Search about $searchFor Done : ${articleListWithSearch.length}");
    }
    notifyListeners();
  }

  List<Article> get articleList => _articlesList;
  List<Article> get articleListWithCategory => _articlesListWithCategory;
  List<Article> get articleListWithSearch => _articlesListWithSearch;

  //? //////\ Theme Data \/////////////

  DarkThemePreference darkThemePreference = DarkThemePreference();

  bool isDark = true;

  changeTheme() async {
    (isDark) ? isDark = false : isDark = true;
    await darkThemePreference.setTheme(isDark);
    if (kDebugMode) {
      print("change theme done $isDark");
    }
    notifyListeners();
  }
}