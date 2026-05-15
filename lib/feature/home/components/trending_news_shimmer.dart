import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:today_news/core/constant/app_size.dart';

class TrendingNewsShimmer extends StatelessWidget {
  const TrendingNewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: AppSize.pw16),
      separatorBuilder: (context, index) => SizedBox(width: AppSize.pw12),
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.r12),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: AppSize.w240,
            height: AppSize.h140,
            color: Colors.white,
          ),
        ),
      ),
      scrollDirection: Axis.horizontal,
      itemCount: 6,
    );
  }
}
