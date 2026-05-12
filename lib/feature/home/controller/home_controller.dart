import 'package:flutter/material.dart';
import 'package:today_news/core/data_source/remote/api_config.dart';
import 'package:today_news/core/data_source/remote/api_service.dart';
import 'package:today_news/core/enums/request_data_status.dart';
import 'package:today_news/feature/home/models/NewsArticleModel.dart';

class HomeController with ChangeNotifier {
  RequestDataStatus everythingStatus = RequestDataStatus.loading;
  bool headlineLoading = true;
  String? errorMessage;
  ApiService apiService = ApiService();
  List<NewsArticleModel> headlineList = [];
  List<NewsArticleModel> everythingList = [];
  String? selectedCategory;

  HomeController() {
    headLineEndPoint();
    everythingEndPoint();
  }

  void headLineEndPoint({String? category}) async {
    try {
      errorMessage = null;

      Map<String, dynamic> json = await apiService.get(
        ApiConfig.headLine,
        params: {"country": "us", "category": category},
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
      everythingStatus = RequestDataStatus.loaded;

      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
      everythingStatus = RequestDataStatus.error;
    }
    notifyListeners();
  }

  void changeCategory(String category) {
    selectedCategory = category;
    headLineEndPoint(category: category);
    notifyListeners();
  }
}
