import 'package:flutter/material.dart';
import 'package:today_news/core/theme/light_color.dart';

class SharedViewAll extends StatelessWidget {
  const SharedViewAll({
    super.key,
    required this.title,
    this.titleColor,
    required this.onTap,
  });
  final String title;
  final Color? titleColor;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: titleColor ?? LightColor.whiteColor,
              fontFamily: "Times New Roman",
            ),
          ),
          InkWell(
            onTap: () => onTap(),
            child: Text(
              "View all",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: titleColor ?? LightColor.whiteColor,
                decoration: TextDecoration.underline,
                decorationColor: titleColor ?? LightColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
