import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Container(
              width: size.width * 0.179,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 3, 50, 122),
                    Color.fromARGB(255, 4, 62, 150),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.014),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/splash-text.png',
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: size.width * 0.0286),
                    Text(
                      'Administrator Panel',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.012,
                      ),
                    ),
                    const Divider(color: Colors.white),
                    Expanded(
                      child: ListView(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.dashboard_outlined,
                                  color: Colors.white),
                              SizedBox(width: size.width * 0.01),
                              Expanded(
                                child: Text(
                                  'Dashboard',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.012,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.width * 0.02),
                          Row(
                            children: [
                              const Icon(Icons.message, color: Colors.white),
                              SizedBox(width: size.width * 0.01),
                              Expanded(
                                child: Text(
                                  'Reports',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.012,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.width * 0.02),
                          Row(
                            children: [
                              const Icon(Icons.bus_alert_outlined,
                                  color: Colors.white),
                              SizedBox(width: size.width * 0.01),
                              Expanded(
                                child: Text(
                                  'Track Student',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.012,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.width * 0.02),
                          Row(
                            children: [
                              const Icon(
                                Icons.sos,
                                color: Colors.white,
                              ),
                              SizedBox(width: size.width * 0.01),
                              Expanded(
                                child: Text(
                                  'SOS Alerts',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.012,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.width * 0.02),
                          Row(
                            children: [
                              const Icon(Icons.person_2_outlined,
                                  color: Colors.white),
                              SizedBox(width: size.width * 0.01),
                              Expanded(
                                child: Text(
                                  'Student Search',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.012,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.021,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.021, vertical: size.width * 0.014),
              child: Expanded(
                child: Container(
                    width: size.width * 0.564,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width * 0.164,
                              height: size.width * 0.107,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                              ),
                            ),
                            // SizedBox(width: size.width * 0.0358),
                            Container(
                              width: size.width * 0.164,
                              height: size.width * 0.107,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                              ),
                            ),
                            // SizedBox(width: size.width * 0.0358),
                            Container(
                              width: size.width * 0.164,
                              height: size.width * 0.107,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                              ),
                            ),
                            // SizedBox(width: size.width * 0.0358),
                          ],
                        ),
                        SizedBox(height: size.width * 0.012),
                        Container(
                          width: double.infinity,
                          height: size.width * 0.1850,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(height: size.width * 0.012),
                        Container(
                          width: double.infinity,
                          height: size.width * 0.1100,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              width: size.width * 0.1100,
              height: size.width * 0.1100,
              decoration: const BoxDecoration(
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
