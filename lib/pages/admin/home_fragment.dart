import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.transparent,
                width: size.width * 0.6,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCard('128', 'Reports', Icons.report),
                        _buildCard('14', 'Track Student', Icons.track_changes),
                        _buildCard('145', 'SOS Alerts', Icons.warning),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildPerformanceChart(),
                    Card(
                        elevation: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Active SOS Alerts'),
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 300,
                                      width: 600,
                                      child: GoogleMapWidget()),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blue[800],
                                      ),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('On campus',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'SOS alerts',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '- 6 active',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 55,
                                    ),
                                    Container(
                                      height: 80,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blue[800],
                                      ),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Off-campus',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'SOS alerts',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '- 6 active',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  _buildProfileCard(),
                  const SizedBox(height: 20),
                  _buildStudentsOnlineCard(),
                  const SizedBox(height: 20),
                  _buildSearchCard(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String count, String label, IconData icon) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                count,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(width: 32),
              Icon(
                icon,
                color: Colors.red,
                size: 36,
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              // onTap functionality here
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View more',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ).decorateContainer(),
        ],
      ),
    );
  }
}

extension DecorateContainer on Widget {
  Widget decorateContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: this,
    );
  }

  Widget _buildPerformanceChart() {
    final data = [
      PerformanceData('Jan', 30, 50, 10),
      PerformanceData('Feb', 70, 20, 30),
      PerformanceData('Mar', 50, 60, 20),
      PerformanceData('Apr', 40, 30, 60),
      PerformanceData('May', 90, 80, 40),
      PerformanceData('Jun', 60, 40, 70),
      PerformanceData('Jul', 100, 90, 50),
      PerformanceData('Aug', 80, 70, 30),
    ];

    final seriesList = [
      charts.Series<PerformanceData, String>(
        id: 'Reports',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (PerformanceData data, _) => data.month,
        measureFn: (PerformanceData data, _) => data.reports,
        data: data,
      ),
      charts.Series<PerformanceData, String>(
        id: 'Student Population',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (PerformanceData data, _) => data.month,
        measureFn: (PerformanceData data, _) => data.studentPopulation,
        data: data,
      ),
      charts.Series<PerformanceData, String>(
        id: 'Alerts',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (PerformanceData data, _) => data.month,
        measureFn: (PerformanceData data, _) => data.alerts,
        data: data,
      ),
    ];

    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(5),
        height: 400,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 15, left: 8, right: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Performance',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                          const Text('Reports')
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                color: Colors.yellow,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                          const Text('Student Population')
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                          const Text('SOS Alerts')
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 350,
              child: charts.BarChart(
                seriesList,
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      elevation: 2,
      child: Container(
        width: 260,
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              radius: 30,
            ),
            SizedBox(height: 10),
            Text('John Doe'),
            Text('Sr. System Administrator'),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentsOnlineCard() {
    return Card(
      elevation: 2,
      child: Container(
        width: 260,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Students Online',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildStudentStatus('John Doe', 'BSc. Computer Science', true),
            const SizedBox(height: 10),
            _buildStudentStatus('John Doe', 'BSc. Computer Science', true),
            const SizedBox(height: 10),
            _buildStudentStatus('John Doe', 'BSc. Computer Science', true),
            const SizedBox(height: 10),
            _buildStudentStatus('John Doe', 'BSc. Computer Science', true),
            const SizedBox(height: 10),
            _buildStudentStatus('John Doe', 'BSc. Computer Science', true),
            const SizedBox(height: 10),
            _buildStudentStatus(
                'Jane Smith', 'BSc. Information Technology', false),
            const SizedBox(height: 10),
            _buildStudentStatus(
                'David Brown', 'BSc. Software Engineering', true),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentStatus(String name, String course, bool online) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          radius: 15,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name),
            Text(course),
            Text(
              online ? 'Online' : 'Offline',
              style: TextStyle(color: online ? Colors.green : Colors.red),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchCard() {
    return Card(
      elevation: 2,
      child: Container(
        width: 260,
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Search Students',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: 'Search...',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PerformanceData {
  final String month;
  final int reports;
  final int studentPopulation;
  final int alerts;

  PerformanceData(
      this.month, this.reports, this.studentPopulation, this.alerts);
}

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.8688, 151.2093); // Sydney coordinates

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );
  }
}
