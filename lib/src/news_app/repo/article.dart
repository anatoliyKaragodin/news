class Article {
  final String id;
  final String img;
  final String date;
  final String title;
  final String? subtitle;
  final int important;

//<editor-fold desc="Data Methods">
  const Article({
    required this.id,
    required this.img,
    required this.date,
    required this.title,
    this.subtitle,
    required this.important,
  });

  @override
  String toString() {
    return 'Article{' +
        ' id: $id,' +
        ' img: $img,' +
        ' date: $date,' +
        ' title: $title,' +
        ' subtitle: $subtitle,' +
        ' important: $important,' +
        '}';
  }

  Article copyWith({
    String? id,
    String? img,
    String? date,
    String? title,
    String? subtitle,
    int? important,
  }) {
    return Article(
      id: id ?? this.id,
      img: img ?? this.img,
      date: date ?? this.date,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      important: important ?? this.important,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'img': this.img,
      'date': this.date,
      'title': this.title,
      'subtitle': this.subtitle,
      'important': this.important,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] as String,
      img: map['img'] as String,
      date: map['date'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      important: map['important'] as int,
    );
  }

//</editor-fold>
}
