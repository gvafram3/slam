import 'package:flutter/material.dart';

import '../pages/user_profile_page.dart';
import 'favorite.dart';
import 'setting.dart';
import '../pages/welcome_page.dart'; // Import the WelcomePage

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<MyBottomNavBar> {
  int myCurrentIndex = 0;
  List pages = const [
    WelcomePage(),
    FavoritePage(),
    SettingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 25,
              offset: const Offset(8, 20),
            )
          ],
          color: Colors.transparent, // Set background color here if needed
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            selectedItemColor: Colors.redAccent,
            unselectedItemColor: Colors.black,
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Setting"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: "Profile"),
            ],
          ),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}
