import 'package:flutter/material.dart';
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: "BookMark",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: _screens[currentIndex],
    );
  }
}
