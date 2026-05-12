import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_news/core/theme/light_color.dart';
import 'package:today_news/feature/home/controller/home_controller.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/home_background.png",
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            top: 60,
            child: Column(
              children: [
                Text(
                  "NEWST",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending News",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: LightColor.whiteColor,
                          fontFamily: "Times New Roman",
                        ),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: LightColor.whiteColor,
                          decoration: TextDecoration.underline,
                          decorationColor: LightColor.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 140,
                  child: Consumer<HomeController>(
                    builder: (context, HomeController value, child) {
                      return (value.errorMessage?.isNotEmpty ?? false)
                          ? Center(
                              child: Text(
                                value.errorMessage!,
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : value.everythingLoading
                          ? Center(child: CircularProgressIndicator())
                          : ListView.separated(
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 12),
                              itemCount: value.everythingList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    if (value
                                            .everythingList[index]
                                            .urlToImage !=
                                        null)
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(12),
                                        child: Image.network(
                                          value
                                              .everythingList[index]
                                              .urlToImage!,
                                          height: 140,
                                          width: 240,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                  ],
                                );
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
