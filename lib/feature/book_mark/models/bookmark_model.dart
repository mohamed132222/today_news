import 'package:hive_ce/hive.dart';

part 'bookmark_model.g.dart';

@HiveType(typeId: 1)
class BookmarkModel {
  @HiveField(0)
  final String? author;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? url;
  @HiveField(4)
  final String? urlToImage;
  @HiveField(5)
  final DateTime publishedAt;
  @HiveField(6)
  final String? content;
  @HiveField(7)
  final DateTime bookmarkAt;

  BookmarkModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
    required this.bookmarkAt,
  });

  factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.tryParse(json["publishedAt"] ?? "") ?? DateTime.now(),
    content: json["content"],
    bookmarkAt: DateTime.tryParse(json["bookmarkAt"] ?? "") ?? DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
    "bookmarkAt": bookmarkAt.toIso8601String(),
  };

  BookmarkModel copyWith({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
    DateTime? bookmarkAt,
  }) {
    return BookmarkModel(
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      bookmarkAt: bookmarkAt ?? this.bookmarkAt,
    );
  }
}
