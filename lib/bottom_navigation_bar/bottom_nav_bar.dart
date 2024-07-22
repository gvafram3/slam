import 'package:flutter/material.dart';
import 'package:slam/pages/confirm_panic_mode_screen.dart';
import 'package:slam/pages/user_profile_page.dart';

import '../pages/report_screen.dart';

import '../pages/welcome_page.dart';
import 'package:iconly/iconly.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<MyBottomNavBar> {
  int myCurrentIndex = 0;
  List pages = [
    const WelcomePage(),
    const ReportScreen(),
    const ProfilePage(),
  ];
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 95, 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 25,
              offset: const Offset(8, 20),
            )
          ],
          color: Colors.transparent, // Set background color here if needed
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/busss.png',
                    ),
                    size: 24,
                  ),
                  label: "Track Bus"),
              BottomNavigationBarItem(
                  icon: Icon(IconlyBroken.message), label: "Report"),
              BottomNavigationBarItem(
                  icon: Icon(IconlyBroken.profile), label: "Profile"),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          pages[myCurrentIndex],
          Positioned(
            right: 20,
            bottom: 16,
            child: CircleAvatar(
              backgroundColor: Colors.red[600],
              radius: 30,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ConfirmPanicModeScreen()));
                  },
                  child: ImageIcon(
                    const AssetImage('assets/images/emergency.png'),
                    color: _isSelected ? Colors.white : Colors.white60,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
