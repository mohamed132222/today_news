import 'package:flutter/material.dart';
import 'package:today_news/core/data_source/local/preferences_manager.dart';
import 'package:today_news/feature/auth/login_screen.dart';
import 'package:today_news/feature/main/main_screen.dart';
import 'package:today_news/feature/on_boarding/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateAfterSplash();
  }

  void _navigateAfterSplash() async {
    await Future.delayed(Duration(seconds: 2));
    final bool isOnBoardingComplete =
        PreferencesManager().getBool("is_onboarding") ?? false;
    final bool isLoginCompleted =
        PreferencesManager().getBool("is_login") ?? false;
    if (!mounted) return;
    if (!isOnBoardingComplete) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    } else if (!isLoginCompleted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/images/splash.png",
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
