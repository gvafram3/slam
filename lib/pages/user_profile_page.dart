import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:slam/pages/login_page.dart';
import 'package:slam/widgets/grey_background.dart';
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
    final size = MediaQuery.of(context).size.height;

    return greyBackgroundImage(
        mainWidget: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: size * 0.032),
                const Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: size * 0.030),
                const CircleAvatar(
                  radius: 68,
                  backgroundColor: Colors.orange,
                  child: Center(
                    child: CircleAvatar(
                      radius: 64,
                      backgroundImage: AssetImage('assets/images/visca.jpg'),
                    ),
                  ),
                ),
                SizedBox(height: size * 0.020),
                const Text('Kwadwo Visca',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('Status: Student',
                    style: TextStyle(fontSize: 16, color: Colors.grey[900])),
              ],
            ),
          ),
          SizedBox(height: size * 0.016),
          const Text('Account Data',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: size * 0.002),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.00),
              child: Column(
                children: [
                  const ProfileDetailRow(
                      icon: Icons.person,
                      title: 'Name',
                      value: 'Godfred Adams'),
                  Divider(color: Colors.grey[500]),
                  const ProfileDetailRow(
                      icon: Icons.email,
                      title: 'Email',
                      value: 'johndoe@gmail.com'),
                  Divider(color: Colors.grey[500]),
                  const ProfileDetailRow(
                      icon: Icons.book,
                      title: 'Course',
                      value: 'Bsc. Computer Science'),
                  Divider(color: Colors.grey[500]),
                  const ProfileDetailRow(
                      icon: Icons.home,
                      title: 'Hostel',
                      value: 'Victory Towers'),
                  Divider(color: Colors.grey[500]),
                  const ProfileDetailRow(
                      icon: Icons.lock,
                      title: 'Password',
                      value: '************'),
                ],
              ),
            ),
          ),
          SizedBox(height: size * 0.004),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Are you sure you want to log out?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()));
                                      },
                                      child: const Text('Confirm'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  label: const Text(
                    'Log out',
                    style: TextStyle(color: Colors.red),
                  ),
                  icon: const Icon(IconlyBold.logout, color: Colors.red),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: const BorderSide(color: Colors.red, width: 2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
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
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontSize: 16)),
          const Spacer(),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
