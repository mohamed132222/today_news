import 'package:today_news/feature/home/models/NewsArticleModel.dart';

abstract class NewsRepo {
  Future<List<NewsArticleModel>> headLineEndPoint({
    String? category = "general",
  });

  Future<List<NewsArticleModel>> everythingEndPoint();
}
