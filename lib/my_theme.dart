import 'package:flutter/material.dart';

class MyThemeData {
  static Color colorBlack = Color.fromRGBO(36, 36, 36, 1.0);
  static Color colorGold = Color.fromRGBO(183, 147, 95, 1.0);
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: colorBlack,
        ),
        subtitle1: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: colorBlack,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorGold,
        unselectedItemColor: Colors.white,
        selectedItemColor: colorBlack,
      ));

  static ThemeData DarkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme:
          AppBarTheme(backgroundColor: Colors.transparent, elevation: 0.0),
      textTheme: TextTheme(
          headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)));
}
