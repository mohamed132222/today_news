import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrendingNewsScreenShimmer extends StatelessWidget {
  const TrendingNewsScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(width: 134, height: 74, color: Colors.white),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 12),
      itemCount: 10,
    );
  }
}
