import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'home_fragment.dart';
import 'reports_fragment.dart';
import 'track_students_fragment.dart';
import 'sos_alerts_fragment.dart';
import 'student_search_fragment.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String selectedRoute = '/';

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: const Text('SLAM Admin Panel'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Home',
            route: '/',
            icon: Icons.home,
          ),
          AdminMenuItem(
            title: 'Reports',
            route: '/reports',
            icon: Icons.report,
          ),
          AdminMenuItem(
            title: 'Track Student',
            route: '/track-student',
            icon: Icons.track_changes,
          ),
          AdminMenuItem(
            title: 'SOS Alerts',
            route: '/sos-alerts',
            icon: Icons.warning,
          ),
          AdminMenuItem(
            title: 'Student Search',
            route: '/student-search',
            icon: Icons.search,
          ),
          AdminMenuItem(
            title: 'Log Out',
            route: '/logout',
            icon: Icons.logout,
          ),
        ],
        selectedRoute: selectedRoute,
        onSelected: (item) {
          setState(() {
            selectedRoute = item.route!;
          });
        },
        header: Container(
          height: 150,
          color: Colors.blue[800],
          child: Center(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          color: Colors.blue[800],
          child: Center(
            child: Text(
              '© 2024 SLAM',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    switch (selectedRoute) {
      case '/':
        return HomeFragment();
      case '/reports':
        return ReportsFragment();
      case '/track-student':
        return TrackStudentsFragment();
      case '/sos-alerts':
        return SOSAlertsFragment();
      case '/student-search':
        return StudentSearchFragment();
      default:
        return HomeFragment();
    }
  }
}
