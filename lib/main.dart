import 'package:flutter/material.dart';
import 'package:islami_c7_sun/home/home.dart';

import 'my_theme.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.DarkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
