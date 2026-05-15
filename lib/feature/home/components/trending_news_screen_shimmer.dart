import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:today_news/core/constant/app_size.dart';

class TrendingNewsScreenShimmer extends StatelessWidget {
  const TrendingNewsScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.pw16),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: AppSize.w134,
              height: AppSize.h74,
              color: Colors.white,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: AppSize.ph12),
      itemCount: 10,
    );
  }
}
