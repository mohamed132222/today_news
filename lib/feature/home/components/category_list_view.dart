import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/core/theme/light_color.dart';
import 'package:today_news/feature/home/category_screen.dart';
import 'package:today_news/feature/home/components/shared_view_all.dart';
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
          return Column(
            children: [
              SharedViewAll(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider.value(
                        value: controller,
                        child: CategoryScreen(),
                      ),
                    ),
                  );
                },
                title: "Categories",
                titleColor: LightColor.blackColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSize.ph16,
                  horizontal: AppSize.pw16,
                ),
                child: SizedBox(
                  height: AppSize.ph35,
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
                                  fontSize: AppSize.sp16,
                                  fontWeight: FontWeight.w400,
                                  color: LightColor.darkColor,
                                ),
                              ),
                              if (isSelected) ...[
                                SizedBox(height: AppSize.ph6),
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
                    separatorBuilder: (context, index) =>
                        SizedBox(width: AppSize.pw12),
                    itemCount: categoryList.length,
                  ),
                ),
              ),
            ],
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
