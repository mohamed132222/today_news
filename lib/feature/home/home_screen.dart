import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:today_news/feature/home/components/category_list_view.dart';
import 'package:today_news/feature/home/components/top_headline.dart';
import 'package:today_news/feature/home/components/trending_news.dart';
import 'package:today_news/feature/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext _) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: Consumer<HomeController>(
        builder: (context, value, _) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [TrendingNews(), CategoryListView(), TopHeadline()],
            ),
          );
        },
      ),
    );
  }
}
