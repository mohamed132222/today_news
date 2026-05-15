import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/core/data_source/remote/api_service_impl.dart';
import 'package:today_news/core/repos/news_repo_impl.dart';
import 'package:today_news/feature/home/components/news_item.dart';
import 'package:today_news/feature/search/controller/search_controller.dart';
import 'package:today_news/feature/search/widgets/text_field_widget.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MySearchController(
        newsRepo: NewsRepoImpl(apiService: ApiServiceImpl()),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("Search Screen")),
        body: Consumer<MySearchController>(
          builder: (context, controller, child) {
            return Column(
              children: [
                TextFieldWidget(
                  onChange: (value) {
                    controller.everythingEndPoint();
                  },
                  controller: controller.searchController,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSize.ph20,
                      horizontal: AppSize.pw4,
                    ),
                    itemBuilder: (context, index) {
                      final model = controller.everythingList[index];
                      return NewsItem(model: model);
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSize.ph12),
                    itemCount: controller.everythingList.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
