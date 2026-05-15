import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/core/enums/request_data_status.dart';
import 'package:today_news/core/theme/light_color.dart';

import 'package:today_news/feature/home/components/category_screen_shimmer.dart';
import 'package:today_news/feature/home/components/news_item.dart';
import 'package:today_news/feature/home/controller/home_controller.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category Screen")),
      body: Consumer<HomeController>(
        builder: (context, value, child) {
          switch (value.topHeadlineStatus) {
            case RequestDataStatus.loading:
              return CategoryScreenShimmer();
            case RequestDataStatus.loaded:
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSize.ph16,
                      horizontal: AppSize.pw16,
                    ),
                    child: SizedBox(
                      height: AppSize.ph35,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (context, index) {
                          bool isSelected =
                              value.selectedCategory == categoryList[index];
                          return GestureDetector(
                            onTap: () {
                              value.changeCategory(categoryList[index]);
                            },
                            child: IntrinsicWidth(
                              child: Column(
                                children: [
                                  Text(
                                    categoryList[index][0].toUpperCase() +
                                        categoryList[index].substring(1),
                                    style: TextStyle(
                                      fontSize: AppSize.sp16,
                                      fontWeight: FontWeight.w400,
                                      color: LightColor.darkColor,
                                    ),
                                  ),
                                  if (isSelected) ...[
                                    SizedBox(height: AppSize.ph6),
                                    Container(
                                      height: 3,
                                      color: LightColor.primaryColor,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: AppSize.pw12),
                        itemCount: categoryList.length,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final model = value.headlineList[index];

                        return NewsItem(model: model);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: AppSize.ph12),
                      itemCount: value.headlineList.length,
                    ),
                  ),
                ],
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

  List<String> categoryList = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology",
  ];
}
