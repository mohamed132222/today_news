import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:today_news/core/theme/light_color.dart';
import 'package:today_news/feature/book_mark/book_mark_screen.dart';
import 'package:today_news/feature/home/home_screen.dart';
import 'package:today_news/feature/profile/profile_screen.dart';
import 'package:today_news/feature/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    BookMarkScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/home_icon.svg",
              colorFilter: currentIndex == 0
                  ? ColorFilter.mode(LightColor.primaryColor, BlendMode.srcIn)
                  : ColorFilter.mode(LightColor.darkColor, BlendMode.srcIn),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/search_icon.svg",
              colorFilter: currentIndex == 1
                  ? ColorFilter.mode(LightColor.primaryColor, BlendMode.srcIn)
                  : ColorFilter.mode(LightColor.darkColor, BlendMode.srcIn),
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/bookmark_icon.svg",
              colorFilter: currentIndex == 2
                  ? ColorFilter.mode(LightColor.primaryColor, BlendMode.srcIn)
                  : ColorFilter.mode(LightColor.darkColor, BlendMode.srcIn),
            ),
            label: "BookMark",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/profile_icon.svg",
              colorFilter: currentIndex == 3
                  ? ColorFilter.mode(LightColor.primaryColor, BlendMode.srcIn)
                  : ColorFilter.mode(LightColor.darkColor, BlendMode.srcIn),
            ),
            label: "Profile",
          ),
        ],
      ),
      body: _screens[currentIndex],
    );
  }
}
