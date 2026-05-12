import 'package:flutter/material.dart';
import 'package:today_news/core/data_source/local/preferences_manager.dart';
import 'package:today_news/core/theme/light_theme.dart';

import 'package:today_news/feature/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().init();
  // PreferencesManager().clear();
  runApp(const TodayNews());
}

class TodayNews extends StatelessWidget {
  const TodayNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lighTheme,
      home: SplashScreen(),
    );
  }
}
