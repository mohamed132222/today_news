import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:today_news/core/theme/light_color.dart';

class CustomCirclerAvatar extends StatelessWidget {
  const CustomCirclerAvatar({
    super.key,
    required this.imagePath,
    this.raduis,
    this.width,
    this.height,
    this.iconSize,
  });
  final String imagePath;
  final double? raduis;
  final double? width;
  final double? height;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: raduis ?? 14,
      child: CachedNetworkImage(
        imageUrl: imagePath,

        imageBuilder: (context, imageProvider) {
          return CircleAvatar(
            radius: raduis ?? 14,
            backgroundImage: imageProvider,
          );
        },
        progressIndicatorBuilder: (context, url, downloadProgress) => ClipRRect(
          borderRadius: BorderRadius.circular(raduis ?? 14),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: height ?? 12,
              width: width ?? 12,
              color: Colors.white,
            ),
          ),
        ),

        errorWidget: (context, url, error) =>
            Icon(Icons.error, color: LightColor.blackColor),
      ),
    );
  }
}
