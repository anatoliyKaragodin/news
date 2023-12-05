class ArticleDetails {
  final String id;
  final String title;
  final String imageUrl;
  final String date;
  final String? text;
  final String url;
  final List<GalleryItem> gallery;

  ArticleDetails({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.url,
    this.text,
    required this.gallery,
  });

  factory ArticleDetails.fromMap(Map<String, dynamic> map) {
    final galleryList = List<Map<String, dynamic>>.from(map['data']['gallery']);
    return ArticleDetails(
      id: map['data']['id'] as String,
      title: map['data']['title'] as String,
      imageUrl: map['data']['img'] as String,
      date: map['data']['date'] as String,
      text: map['data']['text'] as String?,
      url: map['data']['url'] as String,
      gallery: galleryList
          .map((galleryMap) => GalleryItem.fromMap(galleryMap))
          .toList(),
    );
  }
}

class GalleryItem {
  final int sortId;
  final String smallImageUrl;
  final String bigImageUrl;

  GalleryItem({
    required this.sortId,
    required this.smallImageUrl,
    required this.bigImageUrl,
  });

  factory GalleryItem.fromMap(Map<String, dynamic> map) {
    return GalleryItem(
      sortId: map['sortId'] as int,
      smallImageUrl: map['smallImg'] as String,
      bigImageUrl: map['bigImg'] as String,
    );
  }
}
