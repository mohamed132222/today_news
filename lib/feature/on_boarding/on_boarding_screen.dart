import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/feature/on_boarding/controller/on_boarding_controller.dart';
import 'package:today_news/feature/on_boarding/models/on_boarding_model.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext _) {
    return ChangeNotifierProvider<OnBoardingController>(
      create: (_) => OnBoardingController(),
      builder: (context, _) {
        final controller = context.read<OnBoardingController>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFF0F0F0),
            elevation: 0,
            actions: [
              Consumer<OnBoardingController>(
                builder: (context, controller, _) {
                  return controller.lastPage
                      ? SizedBox()
                      : TextButton(
                          onPressed: () {
                            controller.onFinish(context);
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: AppSize.sp14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.pw16,
                vertical: AppSize.ph30,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: (index) => controller.changeIndex(index),
                      itemCount: OnBoardingModel.onBoardingList.length,
                      itemBuilder: (context, index) {
                        final OnBoardingModel model =
                            OnBoardingModel.onBoardingList[index];
                        return Column(
                          children: [
                            SizedBox(height: AppSize.ph16),
                            Expanded(child: Image.asset(model.imagePath)),
                            SizedBox(height: AppSize.ph24),
                            Text(
                              model.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppSize.sp20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF4E4B66),
                                fontFamily: "Times New Roman",
                              ),
                            ),
                            SizedBox(height: AppSize.ph14),

                            Text(
                              model.description,
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: AppSize.sp16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF6E7191),
                                fontFamily: "Times New Roman",
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: AppSize.ph24),
                  Consumer<OnBoardingController>(
                    builder: (context, controller, _) {
                      return SmoothPageIndicator(
                        controller: controller.pageController,
                        count: 3,
                        effect: SwapEffect(activeDotColor: Color(0xFFC53030)),
                      );
                    },
                  ),
                  SizedBox(height: AppSize.ph116),

                  Consumer<OnBoardingController>(
                    builder: (context, controller, _) {
                      return ElevatedButton(
                        onPressed: () {
                          if (!controller.lastPage) {
                            controller.pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            controller.onFinish(context);
                          }
                        },

                        child: Text(
                          controller.lastPage ? "Get Started" : "Next",
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
