import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_news/core/enums/request_data_status.dart';
import 'package:today_news/core/extentions/date_time_extention.dart';
import 'package:today_news/core/theme/light_color.dart';
import 'package:today_news/core/widgets/cached_network_image_widget.dart';
import 'package:today_news/core/widgets/custom_circler_avatar.dart';
import 'package:today_news/feature/home/components/shared_view_all.dart';
import 'package:today_news/feature/home/components/trending_news_shimmer.dart';
import 'package:today_news/feature/home/controller/home_controller.dart';
import 'package:today_news/feature/home/trending_news_screen.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/home_background.png",
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              top: 60,
              child: Column(
                children: [
                  Text(
                    "NEWST",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 8),
                  SharedViewAll(
                    title: "Trending News",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChangeNotifierProvider.value(
                            value: context.read<HomeController>(),
                            child: TrendingNewsScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 12),

                  SizedBox(
                    height: 140,
                    child: Consumer<HomeController>(
                      builder: (context, HomeController value, child) {
                        switch (value.everythingStatus) {
                          case RequestDataStatus.loading:
                            return TrendingNewsShimmer();
                          case RequestDataStatus.loaded:
                            return ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 12),
                              itemCount: value.everythingList.take(10).length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final model = value.everythingList[index];
                                return SizedBox(
                                  height: 140,
                                  width: 240,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Stack(
                                      children: [
                                        if (model.urlToImage != null)
                                          CachedNetworkImageWidget(
                                            imagePath: model.urlToImage!,
                                            height: 140,
                                            width: 240,
                                          ),
                                        Positioned.fill(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.black.withValues(
                                                    alpha: .5,
                                                  ),
                                                  Colors.black.withValues(
                                                    alpha: .7,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 12,
                                          right: 12,
                                          left: 12,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                model.title ?? "",
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w700,
                                                  color: LightColor.whiteColor,
                                                  fontFamily: "Times New Roman",
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Row(
                                                children: [
                                                  CustomCirclerAvatar(
                                                    imagePath:
                                                        model.urlToImage ?? "",
                                                  ),
                                                  SizedBox(width: 6),

                                                  Expanded(
                                                    child: Text(
                                                      model.author ?? "",
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: LightColor
                                                            .whiteColor,
                                                        fontFamily:
                                                            "Times New Roman",
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    model.publishedAt
                                                        .formaterDateTime(),
                                                    style: TextStyle(
                                                      fontSize: 14,

                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          LightColor.whiteColor,
                                                      fontFamily:
                                                          "Times New Roman",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          case RequestDataStatus.error:
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                value.errorMessage ?? "",
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
