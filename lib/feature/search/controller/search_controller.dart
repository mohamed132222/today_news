import 'package:flutter/material.dart';
import 'package:today_news/core/enums/request_data_status.dart';
import 'package:today_news/core/mixin/safe_notify_mixin.dart';
import 'package:today_news/core/repos/news_repo.dart';
import 'package:today_news/feature/home/models/NewsArticleModel.dart';

class MySearchController extends ChangeNotifier with SafeNotifyMixin {
  MySearchController({required this.newsRepo});
  final TextEditingController searchController = TextEditingController();

  RequestDataStatus searchStatus = RequestDataStatus.loading;
  List<NewsArticleModel> everythingList = [];
  final NewsRepo newsRepo;

  String? errorMessage;

  void everythingEndPoint() async {
    try {
      errorMessage = null;

      everythingList = await newsRepo.everythingEndPoint(
        q: searchController.text,
      );
      searchStatus = RequestDataStatus.loaded;

      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
      searchStatus = RequestDataStatus.error;
    }
    safeNotify();
  }
}
