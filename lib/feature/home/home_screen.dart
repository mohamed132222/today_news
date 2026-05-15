import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_news/core/data_source/remote/api_service.dart';
import 'package:today_news/core/data_source/remote/api_service_impl.dart';

import 'package:today_news/feature/home/components/category_list_view.dart';
import 'package:today_news/feature/home/components/top_headline.dart';
import 'package:today_news/feature/home/components/trending_news.dart';
import 'package:today_news/feature/home/controller/home_controller.dart';
import 'package:today_news/feature/home/repo/news_repo_impl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext _) {
    return ChangeNotifierProvider(
      create: (_) =>
          HomeController(newsRepo: NewsRepoImpl(apiService: ApiServiceImpl())),
      child: Consumer<HomeController>(
        builder: (context, value, _) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [TrendingNews(), CategoryListView(), TopHeadline()],
            ),
          );
        },
      ),
    );
  }
}
