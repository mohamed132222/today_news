import 'dart:math';

import 'package:flutter/material.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/core/extentions/date_time_extention.dart';
import 'package:today_news/core/theme/light_color.dart';
import 'package:today_news/core/widgets/cached_network_image_widget.dart';
import 'package:today_news/core/widgets/custom_circler_avatar.dart';
import 'package:today_news/core/widgets/custom_svg_picture.dart';
import 'package:today_news/feature/home/models/NewsArticleModel.dart';

class NewsDetailsScreen extends StatelessWidget {
  NewsDetailsScreen({super.key, required this.newsArticleModel});
  final NewsArticleModel newsArticleModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Details")),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.pw16,
          vertical: AppSize.ph20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(AppSize.r4),
                child: Container(
                  width: double.infinity,
                  height: AppSize.h228,
                  child: CachedNetworkImageWidget(
                    imagePath: newsArticleModel.urlToImage ?? "",
                  ),
                ),
              ),
              SizedBox(height: AppSize.ph12),
              Text(
                newsArticleModel.title ?? "",
                style: TextStyle(
                  fontSize: AppSize.sp20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Times New Roman",
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
              SizedBox(height: AppSize.ph8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CustomCirclerAvatar(
                  imagePath: newsArticleModel.urlToImage ?? "",
                  raduis: AppSize.r12,
                ),
                title: Row(
                  children: [
                    Text(
                      (newsArticleModel.author ?? "").substring(
                        0,
                        min((newsArticleModel.author ?? "").length, 20),
                      ),
                      style: TextStyle(
                        fontSize: AppSize.sp14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Times New Roman",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: AppSize.pw8),
                    Text(
                      newsArticleModel.publishedAt.formaterDateTime(),
                      style: TextStyle(
                        fontSize: AppSize.sp12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                trailing: CustomSvgPicture.withOutFilterColor(
                  imgPath: "book_mark_icon.svg",
                ),
              ),
              SizedBox(height: AppSize.ph14),
              Text(
                newsArticleModel.description ?? "",
                style: TextStyle(
                  fontSize: AppSize.sp16,
                  fontWeight: FontWeight.w400,
                  color: LightColor.darkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
