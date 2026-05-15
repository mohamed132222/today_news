import 'package:flutter/material.dart';
import 'package:today_news/core/data_source/remote/api_config.dart';
import 'package:today_news/core/data_source/remote/api_service_impl.dart';
import 'package:today_news/core/enums/request_data_status.dart';
import 'package:today_news/core/mixin/safe_notify_mixin.dart';
import 'package:today_news/feature/home/models/NewsArticleModel.dart';
import 'package:today_news/feature/home/repo/news_repo.dart';
import 'package:today_news/feature/home/repo/news_repo_impl.dart';

class HomeController extends ChangeNotifier with SafeNotifyMixin {
  RequestDataStatus everythingStatus = RequestDataStatus.loading;
  RequestDataStatus topHeadlineStatus = RequestDataStatus.loading;
  String? errorMessage;
  List<NewsArticleModel> headlineList = [];
  List<NewsArticleModel> everythingList = [];
  String? selectedCategory;
  final NewsRepo newsRepo;

  HomeController({required this.newsRepo}) {
    headLineEndPoint();
    everythingEndPoint();
  }

  void headLineEndPoint({String? category}) async {
    try {
      topHeadlineStatus = RequestDataStatus.loading;
      safeNotify();
      errorMessage = null;

      headlineList = await newsRepo.headLineEndPoint(category: category);
      topHeadlineStatus = RequestDataStatus.loaded;
      errorMessage = null;
    } catch (e) {
      topHeadlineStatus = RequestDataStatus.error;

      errorMessage = e.toString();
    }
    safeNotify();
  }

  void everythingEndPoint() async {
    try {
      errorMessage = null;

      everythingList = await newsRepo.everythingEndPoint();
      everythingStatus = RequestDataStatus.loaded;

      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
      everythingStatus = RequestDataStatus.error;
    }
    safeNotify();
  }

  void changeCategory(String category) {
    selectedCategory = category;
    headLineEndPoint(category: category);
    safeNotify();
  }
}
