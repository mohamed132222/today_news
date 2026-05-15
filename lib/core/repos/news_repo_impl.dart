import 'package:today_news/core/data_source/remote/api_config.dart';
import 'package:today_news/core/data_source/remote/api_service.dart';
import 'package:today_news/core/data_source/remote/api_service_impl.dart';
import 'package:today_news/core/repos/news_repo.dart';
import 'package:today_news/feature/home/models/NewsArticleModel.dart';

class NewsRepoImpl extends NewsRepo {
  final ApiService apiService;

  NewsRepoImpl({required this.apiService});
  @override
  Future<List<NewsArticleModel>> headLineEndPoint({
    String? category = "general",
  }) async {
    Map<String, dynamic> json = await apiService.get(
      ApiConfig.headLine,
      params: {"country": "us", "category": category},
    );

    return (json["articles"] as List)
        .map((e) => NewsArticleModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<NewsArticleModel>> everythingEndPoint({
    String? q = "bitcoin",
  }) async {
    Map<String, dynamic> json = await apiService.get(
      ApiConfig.everyThing,
      params: {"q": q},
    );

    return (json["articles"] as List)
        .map((e) => NewsArticleModel.fromJson(e))
        .toList();
  }
}

class NewsRepoMockImpl extends NewsRepo {
  @override
  Future<List<NewsArticleModel>> headLineEndPoint({
    String? category = "general",
  }) async {
    Map<String, dynamic> json = await ApiServiceImpl().get(
      ApiConfig.headLine,
      params: {"country": "us", "category": category},
    );

    return (json["articles"] as List)
        .map((e) => NewsArticleModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<NewsArticleModel>> everythingEndPoint({
    String? q = "bitcoin",
  }) async {
    Map<String, dynamic> json = await ApiServiceImpl().get(
      ApiConfig.everyThing,
      params: {"q": q},
    );

    return (json["articles"] as List)
        .map((e) => NewsArticleModel.fromJson(e))
        .toList();
  }
}
