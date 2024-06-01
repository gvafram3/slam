import 'package:flutter/material.dart';
import 'package:slam/widgets/available_buses.dart';
import 'package:slam/widgets/grey_background.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Track Bus',
      home: greyBackgroundImage(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                CircleAvatar(
                  radius: size.height * 0.04,
                  backgroundImage: const AssetImage(
                    'assets/images/visca.jpg',
                  ),
                )
              ],
            ),
            // SizedBox(height: size.height * 0.017),
            const Text(
              'Track your bus effectively',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue),
            ),
            // SizedBox(height: size.height * 0.017),
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
                height: size.height * 0.46,
                width: size.height * 0.73,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  image: const DecorationImage(
                      image: AssetImage('assets/images/Live-Map.png'),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(5),
                  // border: Border.all(color: Colors.blue, width: 2),
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
                child: Expanded(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.024),
                    child:
                        // Container(
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(5)),
                        //     // height: size.height * 0.227,
                        //     width: double.infinity,
                        //     child: Padding(
                        //       padding: EdgeInsets.all(size.height * 0.027),
                        //       child: const Column(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Text(
                        //             'Commercial Area - KSB',
                        //             style: TextStyle(
                        //               fontSize: 14,
                        //             ),
                        //           ),
                        //           Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               Column(
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     'Bus No.',
                        //                     style: TextStyle(
                        //                       fontSize: 10,
                        //                       color: Colors.orange,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                   ),
                        //                   Text(
                        //                     'GS-000-345',
                        //                     style: TextStyle(
                        //                       fontSize: 14,
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               Column(
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     'Next Stop',
                        //                     style: TextStyle(
                        //                       fontSize: 10,
                        //                       color: Colors.orange,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                   ),
                        //                   Text(
                        //                     'Casely Hayford',
                        //                     style: TextStyle(
                        //                       fontSize: 14,
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               Column(
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     'Arrival Time',
                        //                     style: TextStyle(
                        //                       fontSize: 10,
                        //                       color: Colors.orange,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                   ),
                        //                   Text(
                        //                     '5 min',
                        //                     style: TextStyle(
                        //                       fontSize: 14,
                        //                       fontWeight: FontWeight.w700,
                        //                     ),
                        //                   ),
                        //                 ],
                        //               )
                        //             ],
                        //           )
                        //         ],
                        //       ),
                        //     )),
                        SingleChildScrollView(
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
                        // availableBusesCard(context,
                        //     route: 'KSB - Brunei',
                        //     busNo: 'GS-111-345',
                        //     nextStop: 'Library',
                        //     arrivalTime: '4 mins'),
                      ],
                    )),
                  ),
                )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
