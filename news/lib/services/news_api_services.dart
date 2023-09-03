import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:news/models/article_model_api.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  String apiKey = '9bde4066b5a84805a5a6cecd037cc102';
  String baseUrl = 'https://newsapi.org/v2/';
  Future<List<Article>> fetchArticles(String country) async {
    Uri url =
        Uri.parse('${baseUrl}top-headlines?country=$country&apiKey=$apiKey');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      if (kDebugMode) {
        print("hello form Article list.........");
      }
      return articles;
    } else {
      throw Exception('damn .... Failed to load articles ');
    }
  }
}

class NewsApiWithCategory extends NewsApi {
  Future<List<Article>> fetchArticlesWithCategory(
      String category, String country) async {
    Uri url = Uri.parse(
        '${baseUrl}top-headlines?country=$country&category=$category&apiKey=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      if (kDebugMode) {
        print("hello form Article Category list.........");
      }
      return articles;
    } else {
      throw Exception('damn .... Failed to load articles ');
    }
  }
}

class NewsApiWithSearch extends NewsApi{
  
  Future<List<Article>> fetchArticleWithSearch(
      String searchFor, String country) async {
    Uri url = Uri.parse(
        '${baseUrl}top-headlines?country=$country&q=$searchFor&apiKey=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      if (kDebugMode) {
        print("hello form Article Category list.........");
      }
      return articles;
    } else {
      throw Exception('damn .... Failed to load articles ');
    }
  }
}
