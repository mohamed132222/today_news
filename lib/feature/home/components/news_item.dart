import 'dart:math';

import 'package:flutter/material.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/core/theme/light_color.dart';
import 'package:today_news/core/widgets/cached_network_image_widget.dart';
import 'package:today_news/core/widgets/custom_circler_avatar.dart';
import 'package:today_news/core/widgets/custom_svg_picture.dart';
import 'package:today_news/feature/home/models/NewsArticleModel.dart';

import '../../../core/extentions/date_time_extention.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.model});
  final NewsArticleModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.pw16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.r4),
            child: CachedNetworkImageWidget(imagePath: model.urlToImage ?? ""),
          ),
          SizedBox(width: AppSize.pw8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title ?? "",
                  style: TextStyle(
                    fontSize: AppSize.sp16,
                    fontWeight: FontWeight.w400,
                    color: LightColor.blackColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: AppSize.ph8),
                Row(
                  children: [
                    CustomCirclerAvatar(imagePath: model.urlToImage ?? ""),

                    SizedBox(width: AppSize.pw8),
                    Text(
                      (model.author ?? "").substring(
                        0,
                        min((model.author ?? "").length, 10),
                      ),
                      style: TextStyle(
                        fontSize: AppSize.sp12,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: AppSize.pw8),
                    Expanded(
                      child: Text(
                        model.publishedAt.formaterDateTime(),
                        style: TextStyle(
                          fontSize: AppSize.sp12,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                          color: LightColor.blackColor,
                        ),
                      ),
                    ),

                    CustomSvgPicture.withOutFilterColor(
                      imgPath: "book_mark_icon.svg",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
