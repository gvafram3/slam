import 'package:flutter/material.dart';
import 'package:slam/widgets/available_buses.dart';
import 'package:slam/widgets/grey_background.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Track Bus',
      home: Scaffold(
        body: greyBackgroundImage(
          mainWidget: Padding(
            padding: EdgeInsets.all(size.height * 0.034),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Welcome, Visca!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    CircleAvatar(
                      radius: size.height * 0.04,
                      backgroundImage: const AssetImage(
                        'assets/images/visca.jpg',
                      ),
                    )
                  ],
                ),
                const Text(
                  'Track your bus effectively',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue),
                ),
                const Text(
                  'Your destination, our priority. \nHit the panic button in case you have an emergency!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: size.height * 0.017),
                Center(
                  child: Container(
                    height: size.height * 0.36,
                    width: size.height * 0.63,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      image: const DecorationImage(
                          image: AssetImage('assets/images/Live-Map.png'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const Text(
                  'Available Buses',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey.shade300,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(size.height * 0.024),
                        child: Column(
                          children: [
                            availableBusesCard(context,
                                route: 'Commercial Area - KSB',
                                busNo: 'GS-000-345',
                                nextStop: 'Casely Hayford',
                                arrivalTime: '5 mins'),
                            const SizedBox(height: 12),
                            availableBusesCard(context,
                                route: 'Commercial Area - KSB',
                                busNo: 'GS-000-345',
                                nextStop: 'Casely Hayford',
                                arrivalTime: '5 mins'),
                            const SizedBox(height: 12),
                            availableBusesCard(context,
                                route: 'Commercial Area - KSB',
                                busNo: 'GS-000-345',
                                nextStop: 'Casely Hayford',
                                arrivalTime: '5 mins'),
                            const SizedBox(height: 12),
                            availableBusesCard(context,
                                route: 'Commercial Area - KSB',
                                busNo: 'GS-000-345',
                                nextStop: 'Casely Hayford',
                                arrivalTime: '5 mins'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          // color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const GNav(
                    color: Colors.grey,
                    activeColor: Colors.blue,
                    gap: 8,
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.star,
                        text: 'Likes',
                      ),
                      GButton(
                        icon: Icons.search,
                        text: 'Search',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                icon: const Icon(Icons.emergency_outlined),
                onPressed: () {
                  // Add your onPressed code here!
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
