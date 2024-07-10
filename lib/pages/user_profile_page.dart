import 'package:flutter/material.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  // final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                  SizedBox(height: 8),
                  Text('John Doe',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Status: Student',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ProfileDetailRow(
                        icon: Icons.person,
                        title: 'Name',
                        value: 'Godfred Adams'),
                    ProfileDetailRow(
                        icon: Icons.email,
                        title: 'Email',
                        value: 'johndoe@gmail.com'),
                    ProfileDetailRow(
                        icon: Icons.book,
                        title: 'Course',
                        value: 'Bsc. Computer Science'),
                    ProfileDetailRow(
                        icon: Icons.home,
                        title: 'Hostel',
                        value: 'Victory Towers'),
                    ProfileDetailRow(
                        icon: Icons.lock,
                        title: 'Password',
                        value: '************'),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text('Log Out'),
              style: ElevatedButton.styleFrom(
                // primary: Colors.red,
                // onPrimary: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: SalomonBottomBar(
      //   currentIndex: _currentIndex,
      //   onTap: (i) => setState(() => _currentIndex = i),
      //   items: [
      //     SalomonBottomBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text("Home"),
      //       selectedColor: Colors.blue,
      //     ),
      //     SalomonBottomBarItem(
      //       icon: Icon(Icons.calendar_today),
      //       title: Text("Schedule"),
      //       selectedColor: Colors.blue,
      //     ),
      //     SalomonBottomBarItem(
      //       icon: Icon(Icons.message),
      //       title: Text("Chats"),
      //       selectedColor: Colors.blue,
      //     ),
      //     SalomonBottomBarItem(
      //       icon: Icon(Icons.person),
      //       title: Text("Profile"),
      //       selectedColor: Colors.blue,
      //     ),
      //   ],
      // ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileDetailRow(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
