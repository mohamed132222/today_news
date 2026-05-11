/// author : "Al Jazeera"
/// title : "Three police officers killed in car bomb attack in northwest Pakistan - Al Jazeera"
/// description : "Bomber and several fighters detonate explosives-laden vehicle near security post in Bannu, Khyber Pakhtunkhwa."
/// url : "https://www.aljazeera.com/news/2026/5/9/three-police-officers-killed-in-car-bomb-attack-in-northwest-pakistan"
/// urlToImage : "https://www.aljazeera.com/wp-content/uploads/2013/07/201373121053486734_20.jpeg?resize=1200%2C675"
/// publishedAt : "2026-05-10T06:09:41Z"
/// content : "A car bombing at a police post, followed by an intense firefight, has killed at least 12 officers in northwestern Pakistan, according to police and security sources.\r\nThe attack took place in Bannu, … [+2565 chars]"

class NewsArticleModel {
  NewsArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      author: json["author"] as String?,
      description: json["description"] as String?,
      title: json["title"] as String?,
      content: json["content"] as String?,
      publishedAt: json["publishedAt"] as String?,
      url: json["url"] as String?,
      urlToImage: json["urlToImage"] as String?,
    );
  }
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
