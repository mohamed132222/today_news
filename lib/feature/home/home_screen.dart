import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            body: (value.errorMessage?.isNotEmpty ?? false)
                ? Center(
                    child: Text(
                      value.errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : value.everythingLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.everythingList.length,
                          itemBuilder: (context, index) => Text(
                            value.everythingList[index].title ?? "",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
