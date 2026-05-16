import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/core/enums/request_data_status.dart';
import 'package:today_news/feature/details/news_details_screen.dart';
import 'package:today_news/feature/home/components/news_item.dart';
import 'package:today_news/feature/home/components/top_headline_shimmer.dart';
import 'package:today_news/feature/home/controller/home_controller.dart';

import '../../../core/theme/light_color.dart';

class TopHeadline extends StatelessWidget {
  const TopHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, value, child) {
        switch (value.topHeadlineStatus) {
          case RequestDataStatus.loading:
            return TopHeadlineShimmer();
          case RequestDataStatus.loaded:
            return SliverPadding(
              padding: EdgeInsetsGeometry.only(bottom: AppSize.ph16),
              sliver: SliverList.separated(
                itemBuilder: (context, index) {
                  final model = value.headlineList[index];

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
                itemCount: value.headlineList.take(10).length,
              ),
            );
          case RequestDataStatus.error:
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.pw16,
                  vertical: AppSize.ph16,
                ),
                child: Text(
                  value.errorMessage ?? "",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
        }
      },
    );
  }
}
