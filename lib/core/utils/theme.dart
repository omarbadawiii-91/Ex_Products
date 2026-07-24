import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData lighttheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffFAF9F8),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Color(0xffD94F6E),
        foregroundColor: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: "poppins",
      ),
    ),
  );
}
