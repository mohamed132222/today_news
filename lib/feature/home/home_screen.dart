import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_news/core/extentions/date_time_extention.dart';
import 'package:today_news/core/theme/light_color.dart';
import 'package:today_news/feature/home/components/category_list_view.dart';
import 'package:today_news/feature/home/components/shared_view_all.dart';
import 'package:today_news/feature/home/components/trending_news.dart';
import 'package:today_news/feature/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext _) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: Consumer<HomeController>(
        builder: (context, value, _) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                TrendingNews(),
                SliverToBoxAdapter(
                  child: SharedViewAll(
                    onTap: () {},
                    title: "Categories",
                    titleColor: LightColor.blackColor,
                  ),
                ),
                CategoryListView(),
                SliverPadding(
                  padding: EdgeInsetsGeometry.only(bottom: 16),
                  sliver: SliverList.separated(
                    itemBuilder: (context, index) {
                      final model = value.headlineList[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                model.urlToImage ?? "",
                                height: 74,
                                width: 134,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.title ?? "",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: LightColor.blackColor,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 2,
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundImage: NetworkImage(
                                          model.urlToImage ?? "",
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        (model.author ?? "").substring(
                                          0,
                                          min((model.author ?? "").length, 10),
                                        ),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        model.publishedAt.formaterDateTime(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                          color: LightColor.blackColor,
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.bookmark_border_rounded,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                    itemCount: value.headlineList.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ///todo refactor
}
