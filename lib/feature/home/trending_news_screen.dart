import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/core/enums/request_data_status.dart';
import 'package:today_news/feature/details/news_details_screen.dart';
import 'package:today_news/feature/home/components/news_item.dart';
import 'package:today_news/feature/home/components/trending_news_screen_shimmer.dart';
import 'package:today_news/feature/home/controller/home_controller.dart';

class TrendingNewsScreen extends StatelessWidget {
  const TrendingNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trending News"), centerTitle: true),
      body: Consumer<HomeController>(
        builder: (context, value, child) {
          switch (value.everythingStatus) {
            case RequestDataStatus.loading:
              return TrendingNewsScreenShimmer();
            case RequestDataStatus.loaded:
              return ListView.separated(
                itemBuilder: (context, index) {
                  final model = value.everythingList[index];

                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NewsDetailsScreen(newsArticleModel: model),
                      ),
                    ),
                    child: NewsItem(model: model),
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSize.ph12),
                itemCount: value.everythingList.length,
              );
            case RequestDataStatus.error:
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.pw16,
                  vertical: AppSize.ph16,
                ),
                child: Text(
                  value.errorMessage ?? "",
                  style: TextStyle(color: Colors.red),
                ),
              );
          }
        },
      ),
    );
  }
}
