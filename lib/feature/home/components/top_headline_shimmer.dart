import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TopHeadlineShimmer extends StatelessWidget {
  const TopHeadlineShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.only(bottom: 16),
      sliver: SliverList.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(height: 74, color: Colors.white),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemCount: 10,
      ),
    );
  }
}
