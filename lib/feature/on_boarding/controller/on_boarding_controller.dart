import 'package:flutter/material.dart';
import 'package:today_news/core/data_source/local/preferences_manager.dart';
import 'package:today_news/core/mixin/safe_notify_mixin.dart';
import 'package:today_news/feature/auth/login_screen.dart';

class OnBoardingController extends ChangeNotifier with SafeNotifyMixin {
  int currentIndex = 0;
  PageController pageController = PageController();
  bool lastPage = false;
  void changeIndex(int index) {
    currentIndex = index;
    if (currentIndex == 2) {
      lastPage = true;
    } else {
      lastPage = false;
    }
    safeNotify();
  }

  void onFinish(BuildContext context) {
    PreferencesManager().setBool("is_onboarding", true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
