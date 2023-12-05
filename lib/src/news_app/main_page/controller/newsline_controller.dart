import 'package:flutter/foundation.dart';
import 'package:news/src/news_app/main_page/model/newsline.dart';
import 'package:news/src/news_app/main_page/model/newsline_model.dart';
import 'package:news/src/utils/library.dart';

import '../../webview_article/view/webview_article_page.dart';

final newsController = StateNotifierProvider<NewslineModel, Newsline>((ref) =>
    NewslineModel());

class NewsController {
  void onNewslineTap(WidgetRef ref, BuildContext context, id) {
    if (kDebugMode) {
      print('ID: $id');
    }
    if(id != null) {ref
        .read(newsController.notifier)
        .getUrl(id);
    Navigator.pushNamed(context, const WebViewArticlePage().route);}

  }

  void onRefresh(WidgetRef ref, String date) {
    ref.read(newsController.notifier).updateAllNews(date);
  }
}