import 'package:flutter/material.dart';
import 'package:today_news/core/theme/light_color.dart';

ThemeData lighTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: Color(0xFFC53030),
  scaffoldBackgroundColor: const Color(0xFFF0F0F0),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Color(0xFFC53030)),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFFFFFFFF),
    elevation: 0,
    iconTheme: const IconThemeData(color: LightColor.blackColor),
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 16,
      color: LightColor.blackColor,
      fontWeight: FontWeight.w700,
    ),
  ),
  // switchTheme: SwitchThemeData(
  //   trackColor: WidgetStateColor.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return Color(0xFF15B86C);
  //     }
  //     return Color(0xFFFFFCFC);
  //   }),
  //   thumbColor: WidgetStateColor.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return Color(0xFFFFFCFC);
  //     }
  //     return Color(0xFF9E9E9E);
  //   }),
  //   trackOutlineColor: WidgetStateColor.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return Colors.transparent;
  //     }
  //     return Color(0xFF6E6E6E);
  //   }),
  //   trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return 0;
  //     }
  //     return 2;
  //   }),
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.zero),
      ),
      backgroundColor: WidgetStatePropertyAll(Color(0xFFC53030)),
      foregroundColor: WidgetStatePropertyAll(Color(0xFFFFFCFC)),
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    ),
  ),
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   extendedTextStyle: TextStyle(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: "Poppins",
  //   ),
  // ),
  //
  // textTheme: TextTheme(
  //   displayLarge: TextStyle(
  //     fontSize: 32,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF161F1B),
  //     fontFamily: "Poppins",
  //   ),
  //   displayMedium: TextStyle(
  //     fontSize: 28,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF161F1B),
  //     fontFamily: "Poppins",
  //   ),
  //   displaySmall: TextStyle(
  //     fontSize: 24,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF161F1B),
  //     fontFamily: "Poppins",
  //   ),
  //   headlineMedium: TextStyle(
  //     fontSize: 16,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF161F1B),
  //     fontFamily: "Poppins",
  //   ),
  //   headlineSmall: TextStyle(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF3A4640),
  //     fontFamily: "Poppins",
  //   ),
  //   labelSmall: TextStyle(
  //     fontSize: 18,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF161F1B),
  //     fontFamily: "Poppins",
  //   ),
  //   titleLarge: TextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF161F1B),
  //     fontFamily: "Poppins",
  //   ),
  //   //task is not done
  //   titleMedium: TextStyle(
  //     overflow: TextOverflow.ellipsis,
  //     fontSize: 16,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF161F1B),
  //     fontFamily: "Poppins",
  //   ),
  //   //task is done
  //   titleSmall: TextStyle(
  //     overflow: TextOverflow.ellipsis,
  //     fontSize: 16,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF6A6A6A),
  //     fontFamily: "Poppins",
  //     decoration: TextDecoration.lineThrough,
  //     decorationColor: Color(0xFF6A6A6A),
  //     decorationThickness: 1.5,
  //   ),
  // ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: LightColor.darkColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFFFFFFF),
    hintStyle: const TextStyle(
      color: LightColor.darkColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Colors.transparent),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Colors.transparent),
    ),
    outlineBorder: BorderSide(color: Colors.transparent),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: .5),
    ),
  ),

  // checkboxTheme: CheckboxThemeData(
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadiusGeometry.circular(4),
  //   ),
  //   side: BorderSide(color: Color(0xFFD1DAD6), width: 2),
  // ),
  // iconTheme: IconThemeData(color: Color(0xFF3A4640)),
  // dividerColor: Color(0xFFD1DAD6),
  // textSelectionTheme: TextSelectionThemeData(
  //   cursorColor: Colors.black,
  //   selectionColor: Colors.white,
  //   selectionHandleColor: Colors.black,
  // ),
  // listTileTheme: ListTileThemeData(
  //   titleTextStyle: TextStyle(
  //     overflow: TextOverflow.ellipsis,
  //     fontSize: 16,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF161F1B),
  //     fontFamily: "Poppins",
  //   ),
  // ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: LightColor.darkColor,
    selectedItemColor: LightColor.primaryColor,
    backgroundColor: LightColor.backgroundColor,
    type: BottomNavigationBarType.fixed,

    selectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      fontFamily: "Times New Roman",
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      fontFamily: "Times New Roman",
    ),
  ),
  splashFactory: NoSplash.splashFactory,
  // textButtonTheme: TextButtonThemeData(
  //   style: ButtonStyle(
  //     foregroundColor: WidgetStatePropertyAll(Colors.black),
  //     overlayColor: WidgetStatePropertyAll(Colors.transparent),
  //   ),
  // ),
  // popupMenuTheme: PopupMenuThemeData(
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadiusGeometry.circular(20),
  //   ),
  //   color: Color(0xFFF6F7F9),
  //
  //   elevation: 10,
  //   labelTextStyle: WidgetStatePropertyAll(
  //     TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.w400,
  //       color: Color(0xFF161F1B),
  //       fontFamily: "Poppins",
  //     ),
  //   ),
  //   shadowColor: Color(0xFF000000),
  // ),
);
