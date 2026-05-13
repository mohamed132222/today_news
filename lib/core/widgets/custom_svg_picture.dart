import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:today_news/core/theme/light_color.dart';

class CustomSvgPicture extends StatelessWidget {
  final String imgPath;
  bool withFilterColor;
  double? width;
  double? height;

  CustomSvgPicture({
    super.key,
    required this.imgPath,
    this.withFilterColor = true,
    this.width,
    this.height,
  });

  CustomSvgPicture.withOutFilterColor({
    super.key,
    required this.imgPath,
    this.width,
    this.height,
  }) : withFilterColor = false;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/images/$imgPath",
      width: width,
      height: height,
      colorFilter: withFilterColor
          ? ColorFilter.mode(LightColor.primaryColor, BlendMode.srcIn)
          : null,
    );
  }
}
