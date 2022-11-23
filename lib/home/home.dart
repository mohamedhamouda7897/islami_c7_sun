import 'package:flutter/material.dart';
import 'package:islami_c7_sun/home/ahadeth.dart';
import 'package:islami_c7_sun/home/quran.dart';
import 'package:islami_c7_sun/home/radio.dart';
import 'package:islami_c7_sun/home/sebha.dart';
import 'package:islami_c7_sun/my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/main_background.png',
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Islami',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              print(index);
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/quran.png'),
                  size: 30,
                ),
                label: 'Quran',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/sebha.png'),
                  size: 30,
                ),
                label: 'Sebha',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/radio.png'),
                  size: 30,
                ),
                label: 'Radio',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/ahadeth.png'),
                  size: 30,
                ),
                label: 'Ahadeth',
              ),
            ],
          ),
          body: tabs[currentIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [QuranTab(), SebhaTab(), RadioTab(), AhadethTab()];
}
