import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: '', backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: '', backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: '', backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: '', backgroundColor: Colors.green),
        ],
      ),
    );
  }
}
