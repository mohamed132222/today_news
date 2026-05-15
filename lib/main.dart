import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:today_news/core/data_source/local/preferences_manager.dart';
import 'package:today_news/core/theme/light_theme.dart';
import 'package:today_news/feature/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await PreferencesManager().init();
  runApp(TodayNews());
}

class TodayNews extends StatelessWidget {
  const TodayNews({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,

      designSize: Size(375, 832),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lighTheme,
        home: SplashScreen(),
      ),
    );
  }
}
