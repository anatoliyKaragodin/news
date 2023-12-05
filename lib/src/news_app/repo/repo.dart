import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news/src/news_app/repo/article_details.dart';

import 'article.dart';

class Repo {
  Future<List<Article>> fetchNewsline({required String from}) async {
    final url = 'https://sarnovosti.ru/api/list.php?from=$from';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List<dynamic>;
      final articleList =
          jsonList.map((json) => Article.fromMap(json)).toList();
      return articleList;
    } else {
      throw Exception('Failed to fetch news');
    }
  }

  Future<List<Article>> fetchMain({required String from}) async {
    final url = 'https://sarnovosti.ru/api/list.php?from=$from&catId=top';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List<dynamic>;
      final articleList =
          jsonList.map((json) => Article.fromMap(json)).toList();
      return articleList;
    } else {
      throw Exception('Failed to fetch main');
    }
  }

  Future<List<Article>> fetchArticles({required String from}) async {
    final url = 'https://sarnovosti.ru/api/list.php?from=$from&catId=article';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List<dynamic>;
      final articleList =
          jsonList.map((json) => Article.fromMap(json)).toList();
      return articleList;
    } else {
      throw Exception('Failed to fetch articles');
    }
  }

  Future<String?> getUrlArticle({required String id}) async {
    final url = 'https://sarnovosti.ru/api/news.php?id=$id';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonArticleDetails = json.decode(response.body);
      final articleDetails = ArticleDetails.fromMap(jsonArticleDetails);
      if (kDebugMode) {
        print(articleDetails.url);
      }
      return articleDetails.url;
    } else {
      throw Exception('Failed to get url');
    }
  }
}
