import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconly/iconly.dart';

import '../bottom_navigation_bar/bottom_nav_bar.dart';
import 'confirm_panic_mode_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(6.672420244953847, -1.5726434686637931),
    zoom: 10,
  );

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'mapHero',
            child: GoogleMap(
              initialCameraPosition: _initialPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),
          ),
          Positioned(
            height: 50,
            top: 40,
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyBottomNavBar(),
                        ),
                      );
                    },
                    icon: const Icon(IconlyBold.arrow_left),
                  ),
                  const Text(
                    'Track Bus',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 36),
                ],
              ),
            ),
          ),
          Positioned(
            right: 14,
            bottom: 110,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isSelected = !_isSelected;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfirmPanicModeScreen()));
              },
              child: CircleAvatar(
                backgroundColor: Colors.red[600],
                radius: 32,
                child: ImageIcon(
                  const AssetImage('assets/images/emergency.png'),
                  color: _isSelected ? Colors.white : Colors.white60,
                ),

                // IconButton(
                //   icon: const Icon(Icons.warning, color: Colors.white),
                //   onPressed: () {Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) =>
                //                   const ConfirmPanicModeScreen()));
                // },
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:iconly/iconly.dart';

// import '../bottom_navigation_bar/bottom_nav_bar.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   GoogleMapController? _controller;

//   static const CameraPosition _initialPosition = CameraPosition(
//     target: LatLng(6.672420244953847, -1.5726434686637931),
//     zoom: 10,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Hero(
//             tag: 'mapHero',
//             child: GoogleMap(
//               initialCameraPosition: _initialPosition,
//               onMapCreated: (GoogleMapController controller) {
//                 _controller = controller;
//               },
//             ),
//           ),
//           Positioned(
//             height: 50,
//             top: 40,
//             left: 10,
//             right: 10,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 color: Colors.white60,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const MyBottomNavBar()));
//                     },
//                     icon: const Icon(IconlyBold.arrow_left),
//                   ),
//                   const Text(
//                     'Track Bus',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(width: 36),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             right: 14,
//             bottom: 110,
//             child: CircleAvatar(
//               backgroundColor: Colors.red[600],
//               radius: 32,
//               child: IconButton(
//                 icon: const Icon(Icons.warning, color: Colors.white),
//                 onPressed: () {},
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
