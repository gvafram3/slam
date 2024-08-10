import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../pages/map_screen.dart';
import 'package:slam/widgets/available_buses.dart';
import 'package:slam/widgets/grey_background.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  GoogleMapController? _controller;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(6.672420244953847, -1.5726434686637931),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return greyBackgroundImage(
      mainWidget: Padding(
        padding: EdgeInsets.only(
          left: size.height * 0.034,
          right: size.height * 0.034,
          top: size.height * 0.05,
          bottom: size.height * 0.012,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Text(
                      'Welcome,',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const Text(
                      'Visca!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: size.height * 0.04,
                  backgroundImage: const AssetImage('assets/images/visca.jpg'),
                )
              ],
            ),
            const Text(
              'Track your bus effectively',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue,
              ),
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
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapScreen(),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'mapHero',
                      child: Container(
                        height: size.height * 0.36,
                        width: size.height * 0.63,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: GoogleMap(
                          initialCameraPosition: _initialPosition,
                          onMapCreated: (GoogleMapController controller) {
                            _controller = controller;
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Expand Map',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Available Buses',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Container(
                // height: 90,
                color: Colors.grey.shade300,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.014),
                    child: Column(
                      children: [
                        availableBusesCard(
                          context,
                          route: 'Commercial Area - KSB',
                          busNo: 'GS-000-345',
                          nextStop: 'Casely Hayford',
                          arrivalTime: '5 mins',
                        ),
                        const SizedBox(height: 8),
                        availableBusesCard(
                          context,
                          route: 'Commercial Area - KSB',
                          busNo: 'GS-000-345',
                          nextStop: 'Casely Hayford',
                          arrivalTime: '5 mins',
                        ),
                        const SizedBox(height: 8),
                        availableBusesCard(
                          context,
                          route: 'Commercial Area - KSB',
                          busNo: 'GS-000-345',
                          nextStop: 'Casely Hayford',
                          arrivalTime: '5 mins',
                        ),
                        const SizedBox(height: 8),
                        availableBusesCard(
                          context,
                          route: 'Commercial Area - KSB',
                          busNo: 'GS-000-345',
                          nextStop: 'Casely Hayford',
                          arrivalTime: '5 mins',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
