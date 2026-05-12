import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_news/core/theme/light_color.dart';
import 'package:today_news/feature/home/controller/home_controller.dart';

class CategoryListView extends StatefulWidget {
  CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<HomeController>(
        builder: (context, controller, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 35,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                  bool isSelected =
                      controller.selectedCategory == categoryList[index];
                  return GestureDetector(
                    onTap: () {
                      controller.changeCategory(categoryList[index]);
                    },
                    child: IntrinsicWidth(
                      child: Column(
                        children: [
                          Text(
                            categoryList[index][0].toUpperCase() +
                                categoryList[index].substring(1),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: LightColor.darkColor,
                            ),
                          ),
                          if (isSelected) ...[
                            SizedBox(height: 6),
                            Container(
                              height: 3,
                              color: LightColor.primaryColor,
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 12),
                itemCount: categoryList.length,
              ),
            ),
          );
        },
      ),
    );
  }

  List<String> categoryList = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology",
  ];
}
