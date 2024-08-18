import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slam/pages/admin/register_student.dart';

import 'home_fragment.dart';
import 'reports_fragment.dart';
import 'track_students_fragment.dart';
import 'sos_alerts_fragment.dart';
import 'student_search_fragment.dart';

enum SideBarItem {
  home(value: 'Home', iconData: Icons.home, body: HomeFragment()),
  reports(value: 'reports', iconData: Icons.report, body: ReportsFragment()),
  track(
      value: 'Track',
      iconData: Icons.track_changes,
      body: TrackStudentsFragment()),
  alerts(value: 'Alerts', iconData: Icons.dangerous, body: SOSAlertsFragment()),
  studentSearch(
      value: 'Search', iconData: Icons.search, body: StudentSearchFragment()),
  registerStudent(
      value: 'Register Student',
      iconData: Icons.account_balance,
      body: RegistrationForm()),
  logout(value: 'Logout', iconData: Icons.logout, body: HomeFragment());

  const SideBarItem(
      {required this.value, required this.iconData, required this.body});
  final String value;
  final IconData iconData;
  final Widget body;
}

final sideBarItemProvider =
    StateProvider<SideBarItem>((ref) => SideBarItem.home);

class AdminDashboard extends ConsumerStatefulWidget {
  const AdminDashboard({super.key});

  @override
  AdminDashboardState createState() => AdminDashboardState();
}

class AdminDashboardState extends ConsumerState<AdminDashboard> {
  String selectedRoute = '/home';
  SideBarItem getSideBarItem(AdminMenuItem item) {
    for (var value in SideBarItem.values) {
      if (item.route == value.name) {
        return value;
      }
    }
    return SideBarItem.home;
  }

  @override
  Widget build(BuildContext context) {
    final sideBarItem = ref.watch(sideBarItemProvider);
    final sideBarkey = ValueKey(Random().nextInt(1000000));
    const String stringParam = 'String parameter';
    const int intParam = 1000000;
    return AdminScaffold(
      sideBar: SideBar(
        key: sideBarkey,
        backgroundColor: Colors.blue[800]!,
        textStyle: const TextStyle(color: Colors.white),
        activeBackgroundColor: Colors.white,
        activeTextStyle: const TextStyle(color: Colors.black),
        items: SideBarItem.values
            .map((e) =>
                AdminMenuItem(title: e.value, icon: e.iconData, route: e.name))
            .toList(),
        selectedRoute: sideBarItem.name,
        onSelected: (item) => ref
            .read(sideBarItemProvider.notifier)
            .update((state) => getSideBarItem(item)),
        header: Container(
          height: 150,
          color: Colors.blue[800],
          child: const Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SLAM',
                    style: TextStyle(fontSize: 45, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Student Location and',
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                      Text(
                        'Apprehension Model',
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  'Administrator panel',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Divider(),
              )
            ],
          )),
        ),
        footer: Container(
          height: 50,
          color: Colors.blue[800],
          child: const Center(
            child: Text(
              '© 2024 SLAM',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: ProviderScope(child: sideBarItem.body),
    );
  }
}
