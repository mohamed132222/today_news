import 'package:flutter/material.dart';
import 'package:today_news/core/data_source/remote/api_config.dart';
import 'package:today_news/core/data_source/remote/api_service.dart';
import 'package:today_news/feature/home/models/NewsArticleModel.dart';

class HomeController with ChangeNotifier {
  bool headlineLoading = true;
  bool everythingLoading = true;
  String? errorMessage;
  ApiService apiService = ApiService();
  List<NewsArticleModel> headlineList = [];
  List<NewsArticleModel> everythingList = [];

  HomeController() {
    headLineEndPoint();
    everythingEndPoint();
  }

  void headLineEndPoint() async {
    try {
      errorMessage = null;

      Map<String, dynamic> json = await apiService.get(
        ApiConfig.headLine,
        params: {"country": "us"},
      );

      headlineList = (json["articles"] as List)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
      headlineLoading = false;
      errorMessage = null;
    } catch (e) {
      headlineLoading = false;

      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void everythingEndPoint() async {
    try {
      errorMessage = null;

      Map<String, dynamic> json = await apiService.get(
        ApiConfig.everyThing,
        params: {"q": "bitcoin"},
      );

      everythingList = (json["articles"] as List)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
      everythingLoading = false;

      errorMessage = null;
    } catch (e) {
      everythingLoading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
