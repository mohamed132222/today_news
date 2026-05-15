import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:today_news/core/constant/app_size.dart';

class TopHeadlineShimmer extends StatelessWidget {
  const TopHeadlineShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.only(bottom: AppSize.pw16),
      sliver: SliverList.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.pw16),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(height: AppSize.h74, color: Colors.white),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: AppSize.ph12),
        itemCount: 10,
      ),
    );
  }
}
