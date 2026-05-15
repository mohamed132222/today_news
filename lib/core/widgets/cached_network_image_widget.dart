import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:today_news/core/constant/app_size.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });

  final String imagePath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      height: height ?? AppSize.h74,
      width: width ?? AppSize.w134,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: height ?? AppSize.h74,
              width: width ?? AppSize.w134,
              color: Colors.white,
            ),
          ),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover,
    );
  }
}
