import 'package:news/src/news_app/main_page/model/newsline.dart';
import 'package:news/src/news_app/repo/repo.dart';
import 'package:news/src/utils/library.dart';

import 'package:news/src/news_app/repo/article.dart';

class NewslineModel extends StateNotifier<Newsline> {
  NewslineModel() : super(const Newsline()) {
    fetchNewsline();
  }

  Future<void> fetchNewsline() async {
    try {
      var repo = Repo();
      var newsline = await repo.fetchNewsline(from: '0');
      var important = await repo.fetchMain(from: '0');
      var articles = await repo.fetchArticles(from: '0');
      state = state.copyWith(
          newsline: newsline, important: important, articles: articles);
    } catch (e) {
      print("Failed to fetch newsline: $e");
    }
  }

  Future<void> getUrl(String id) async {
    try {
      var repo = Repo();
      String? url = await repo.getUrlArticle(id: id);
      print('NEW URL: $url');
      state = state.copyWith(url: url);
    } catch (e) {
      print("Failed to get url MODEL: $e");
    }
  }

  Future<void> updateAllNews(String date) async {
    try {
      var repo = Repo();
      var updNewsline = await repo.fetchNewsline(from: date);
      var updImportant = await repo.fetchMain(from: date);
      var updArticles = await repo.fetchArticles(from: date);
      var existingNewslineIds = state.newsline!.map((item) => item.id).toSet();

      var newNewsline = updNewsline
          .where((item) => !existingNewslineIds.contains(item.id))
          .toList();
      var newsline = state.newsline! + newNewsline;
      newsline.toSet().toList();
      // var newsline = state.newsline! + updNewsline;
      state.important?.addAll(updImportant);
      state.articles?.addAll(updArticles);
      state = state.copyWith(newsline: newsline);
    } catch (e) {
      print("Failed to fetch newsline: $e");
    }
  }

  void resetUrl() {
    state = state.copyWith(url: '');
  }
}
