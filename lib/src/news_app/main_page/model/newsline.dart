import '../../repo/article.dart';

class Newsline {
  final List<Article>? newsline;
  final List<Article>? important;
  final List<Article>? articles;
  final String? url;

//<editor-fold desc="Data Methods">
  const Newsline({this.newsline, this.important, this.articles, this.url});

  @override
  String toString() {
    return 'Newsline{' +
        ' newsline: $newsline,' +
        ' important: $important,' +
        ' articles: $articles,' +
        ' url: $url,' +
        '}';
  }

  Newsline copyWith({
    List<Article>? newsline,
    List<Article>? important,
    List<Article>? articles,
    String? url,
  }) {
    return Newsline(
        newsline: newsline ?? this.newsline,
        important: important ?? this.important,
        articles: articles ?? this.articles,
        url: url ?? this.url);
  }

  Map<String, dynamic> toMap() {
    return {
      'newsline': this.newsline,
      'important': this.important,
      'articles': this.articles,
    };
  }

  factory Newsline.fromMap(Map<String, dynamic> map) {
    return Newsline(
      newsline: map['newsline'] as List<Article>,
      important: map['important'] as List<Article>,
      articles: map['articles'] as List<Article>,
    );
  }

//</editor-fold>
}
