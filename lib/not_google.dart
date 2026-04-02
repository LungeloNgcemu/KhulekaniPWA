import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'data_base.dart';
import 'package:postgres/postgres.dart';
import 'components/save_button.dart';
import 'components/subtitle.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NotGoogle extends StatefulWidget {
  const NotGoogle({super.key});

  @override
  State<NotGoogle> createState() => _NotGoogleState();
}

class _NotGoogleState extends State<NotGoogle> {
  bool isLoading = true;
  List<Marker> newMarkers = [];

  List<Marker>? snow;
  List<Marker>? veldFire;
  List<Marker>? heavyRainfall;
  List<Marker>? lightning;
  List<Marker>? strongWind;
  List<Marker>? hailstorm;
  List<Marker>? railAccident;
  List<Marker>? roadAccident;
  List<Marker>? earthquake;
  List<Marker>? diseaseOutbreak;
  List<Marker>? plantationFire;
  List<Marker>? severeThunderstorm;
  List<Marker>? drought;
  List<Marker>? mudSlide;
  List<Marker>? airCrash;
  List<Marker>? hazmatSpillage;
  List<Marker>? industrialPollution;
  List<Marker>? civilUnrest;
  List<Marker>? industrialFire;
  List<Marker>? structuralFailure;
  List<Marker>? shipWreck;

  void showT(context, String type, String familyName, String adress) {
    Alert(
      context: context,
      type: AlertType.none,
      title: familyName ?? '',
      desc: adress ?? '',
      // id: type ?? "",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
          child: const Text(
            "Done",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  Map<String, List<Marker>> markerMap = {};

  @override
  void initState() {
    super.initState();

    final incidentTypes = {
      'Snow': Colors.red,
      'Veld Fire': Colors.orange,
      'Heavy Rainfall': Colors.blue,
      'Lightning': Colors.yellow,
      'Strong Wind': Colors.green,
      'Strong wind': Colors.green,
      'Hailstorm': Colors.purple,
      'Rail Accident': Colors.teal,
      'Road Accident': Colors.indigo,
      'Earthquake': Colors.deepOrange,
      'Disease Outbreak': Colors.pink,
      'Plantation Fire': Colors.lime,
      'Severe Thunderstorm': Colors.cyan,
      'Drought': Colors.amber,
      'Mud Slide': Colors.brown,
      'Air Crash': Colors.deepPurple,
      'Hazmat Spillage': Colors.lightGreen,
      'Industrial Pollution': Colors.lightBlue,
      'Civil Unrest': Colors.redAccent,
      'Industrial Fire': Colors.orangeAccent,
      'Structural Failure': Colors.blueAccent,
      'Ship Wreck': Colors.purpleAccent,
      'Ship Wrec': Colors.purpleAccent,
    };

    for (final entry in incidentTypes.entries) {
      _initializeMarkers(entry.key, entry.value).then((markers) {
        setState(() {
          markerMap[entry.key] = markers ?? [];
        });
      });
    }
    isLoading = false;
  }

  void callHome() {
    _initializeMarkers('Snow', Colors.red).then((markers) {
      setState(() {
        snow = markers;
      });
    });

    _initializeMarkers('Veld Fire', Colors.orange).then((markers) {
      setState(() {
        veldFire = markers;
      });
    });

    _initializeMarkers('Heavy Rainfall', Colors.blue).then((markers) {
      setState(() {
        heavyRainfall = markers;
      });
    });

    _initializeMarkers('Lightning', Colors.yellow).then((markers) {
      setState(() {
        lightning = markers;
      });
    });

    _initializeMarkers('Strong Wind', Colors.green).then((markers) {
      setState(() {
        strongWind = markers;
      });
    });

    _initializeMarkers('Strong wind', Colors.green).then((markers) {
      setState(() {
        strongWind = markers;
      });
    });

    _initializeMarkers('Hailstorm', Colors.purple).then((markers) {
      setState(() {
        hailstorm = markers;
      });
    });

    _initializeMarkers('Rail Accident', Colors.teal).then((markers) {
      setState(() {
        railAccident = markers;
      });
    });

    _initializeMarkers('Road Accident', Colors.indigo).then((markers) {
      setState(() {
        roadAccident = markers;
      });
    });

    _initializeMarkers('Earthquake', Colors.deepOrange).then((markers) {
      setState(() {
        earthquake = markers;
      });
    });

    _initializeMarkers('Disease Outbreak', Colors.pink).then((markers) {
      setState(() {
        diseaseOutbreak = markers;
      });
    });

    _initializeMarkers('Plantation Fire', Colors.lime).then((markers) {
      setState(() {
        plantationFire = markers;
      });
    });

    _initializeMarkers('Severe Thunderstorm', Colors.cyan).then((markers) {
      setState(() {
        severeThunderstorm = markers;
      });
    });

    _initializeMarkers('Drought', Colors.amber).then((markers) {
      setState(() {
        drought = markers;
      });
    });

    _initializeMarkers('Mud Slide', Colors.brown).then((markers) {
      setState(() {
        mudSlide = markers;
      });
    });

    _initializeMarkers('Air Crash', Colors.deepPurple).then((markers) {
      setState(() {
        airCrash = markers;
      });
    });

    _initializeMarkers('Hazmat Spillage', Colors.lightGreen).then((markers) {
      setState(() {
        hazmatSpillage = markers;
      });
    });

    _initializeMarkers('Industrial Pollution', Colors.lightBlue)
        .then((markers) {
      setState(() {
        industrialPollution = markers;
      });
    });

    _initializeMarkers('Civil Unrest', Colors.redAccent).then((markers) {
      setState(() {
        civilUnrest = markers;
      });
    });

    _initializeMarkers('Industrial Fire', Colors.orangeAccent).then((markers) {
      setState(() {
        industrialFire = markers;
      });
    });

    _initializeMarkers('Structural Failure', Colors.blueAccent).then((markers) {
      setState(() {
        structuralFailure = markers;
      });
    });

    _initializeMarkers('Ship Wreck', Colors.purpleAccent).then((markers) {
      setState(() {
        shipWreck = markers;
      });
    });
  }

  Future<List<Marker>?> _initializeMarkers(String type, Color? color) async {
    List<Marker> newMarkers = await getForMap(type, color ?? Colors.blue);
    return newMarkers;
  }

  void getMap() async {}

  Future<List<Marker>> getForMap(String target, Color color) async {
    try {
      final supabase = Supabase.instance.client;

      final List<Map<String, dynamic>> result = await supabase
          .from('Information')
          .select()
          .eq("Type of Incident", target);

      if (result.isNotEmpty) {
        List<dynamic> items = result.map((item) {
          return {
            'name': item['Head of Household'] ?? 'No Family Name',
            'gpsLng': double.tryParse(item['Longitude (E)']) ?? 0.0,
            'gpsLat': double.tryParse(item['Latitude (S)']) ?? 0.0,
            'type': item['Type of Incident'] ?? '',
            'adress': item['Specify street address where possible/applicable']
                    .toString(),
          };
        }).toList();
        final List<Marker> markersStream = items.map((item) {
          return Marker(
            point: LatLng(item['gpsLat'], item['gpsLng']),
            width: 500,
            height: 500,
            child: Pin(
              color: color!,
              call: () {
                showT(context, item['type'], item['type'], item['name']);
              },
            ),
          );
        }).toList();

        return markersStream;
      } else {
        return [];
      }
    } catch (error) {
      print(error);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isSmallScreen = screenWidth < 900;
    return isLoading == true
        ? const Center(
            child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: CircularProgressIndicator(),
          ))
        : Column(
            children: [
              Expanded(
                flex: 10,
                child: FlutterMap(
                  options: const MapOptions(
                    initialCenter: LatLng(-29.8587, 31.0218),
                    initialZoom: 7.0,
                    keepAlive: false,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    TileLayer(
                      urlTemplate:
                          'https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}',
                      userAgentPackageName: 'com.example.app',

                    ),
                    ...markerMap.entries
                        .map((entry) => MarkerLayer(markers: entry.value)),
                  ],
                ),
              ),
              SubTitle(
                title: "Legend Description",
              ),
              isSmallScreen
                  ? SizedBox(
                      height: 100.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            LegendDiscription(text: "Snow", color: Colors.red),
                            LegendDiscription(
                                text: "Veld Fire", color: Colors.orange),
                            LegendDiscription(
                                text: "Lightning", color: Colors.yellow),
                            LegendDiscription(
                                text: "Hailstorm", color: Colors.blue),
                            LegendDiscription(
                                text: "Road Accident", color: Colors.green),
                            LegendDiscription(
                                text: "Heavy Rainfall", color: Colors.blue),
                            LegendDiscription(
                                text: "Strong Wind", color: Colors.green),
                            LegendDiscription(
                                text: "Rail Accident", color: Colors.teal),
                            LegendDiscription(
                                text: "Earthquake", color: Colors.deepOrange),
                            LegendDiscription(
                                text: "Disease Outbreak", color: Colors.pink),
                            LegendDiscription(
                                text: "Plantation Fire", color: Colors.lime),
                            LegendDiscription(
                                text: "Severe Thunderstorm",
                                color: Colors.cyan),
                            LegendDiscription(
                                text: "Drought", color: Colors.amber),
                            LegendDiscription(
                                text: "Mud Slide", color: Colors.brown),
                            LegendDiscription(
                                text: "Air Crash", color: Colors.deepPurple),
                            LegendDiscription(
                                text: "Hazmat Spillage",
                                color: Colors.lightGreen),
                            LegendDiscription(
                                text: "Industrial Pollution",
                                color: Colors.lightBlue),
                            LegendDiscription(
                                text: "Civil Unrest", color: Colors.redAccent),
                            LegendDiscription(
                                text: "Industrial Fire",
                                color: Colors.orangeAccent),
                            LegendDiscription(
                                text: "Structural Failure",
                                color: Colors.blueAccent),
                            LegendDiscription(
                                text: "Ship Wreck", color: Colors.purpleAccent),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 100.0,
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisExtent: 30,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1.0),
                        children: <Widget>[
                          LegendDiscription(text: "Snow", color: Colors.red),
                          LegendDiscription(
                              text: "Veld Fire", color: Colors.orange),
                          LegendDiscription(
                              text: "Lightning", color: Colors.yellow),
                          LegendDiscription(
                              text: "Hailstorm", color: Colors.blue),
                          LegendDiscription(
                              text: "Road Accident", color: Colors.green),
                          LegendDiscription(
                              text: "Heavy Rainfall", color: Colors.blue),
                          LegendDiscription(
                              text: "Strong Wind", color: Colors.green),
                          LegendDiscription(
                              text: "Rail Accident", color: Colors.teal),
                          LegendDiscription(
                              text: "Earthquake", color: Colors.deepOrange),
                          LegendDiscription(
                              text: "Disease Outbreak", color: Colors.pink),
                          LegendDiscription(
                              text: "Plantation Fire", color: Colors.lime),
                          LegendDiscription(
                              text: "Severe Thunderstorm", color: Colors.cyan),
                          LegendDiscription(
                              text: "Drought", color: Colors.amber),
                          LegendDiscription(
                              text: "Mud Slide", color: Colors.brown),
                          LegendDiscription(
                              text: "Air Crash", color: Colors.deepPurple),
                          LegendDiscription(
                              text: "Hazmat Spillage",
                              color: Colors.lightGreen),
                          LegendDiscription(
                              text: "Industrial Pollution",
                              color: Colors.lightBlue),
                          LegendDiscription(
                              text: "Civil Unrest", color: Colors.redAccent),
                          LegendDiscription(
                              text: "Industrial Fire",
                              color: Colors.orangeAccent),
                          LegendDiscription(
                              text: "Structural Failure",
                              color: Colors.blueAccent),
                          LegendDiscription(
                              text: "Ship Wreck", color: Colors.purpleAccent),
                        ],
                      ),
                    ),
              Column(
                children: [
                  // SaveButton(
                  //   onPressed: () async {
                  //     final markers =
                  //         await _initializeMarkers('Snow', Colors.red);
                  //     setState(() {
                  //       snow = markers;
                  //       print('SNOW : $snow');
                  //     });
                  //   },
                  // ),
                ],
              )
            ],
          );
  }
}

class LegendDiscription extends StatelessWidget {
  LegendDiscription({
    this.text,
    this.color,
    super.key,
  });

  String? text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            size: 20.0,
            color: color!,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text!),
          ),
        ],
      ),
    );
  }
}

class Cluster extends StatefulWidget {
  const Cluster({Key? key, required this.markers1}) : super(key: key);

  final List<Marker> markers1;

  @override
  State<Cluster> createState() => _ClusterState();
}

class _ClusterState extends State<Cluster> {
  @override
  Widget build(BuildContext context) {
    final List<Marker> markers1 = widget.markers1;
    return MarkerClusterLayerWidget(
      options: MarkerClusterLayerOptions(
        maxClusterRadius: 1,
        size: const Size(800, 800),
        alignment: Alignment.center,
        maxZoom: 12,
        padding: const EdgeInsets.all(50),
        // Use AnchorPosAlign
        markers: markers1,
        builder: (context, markers1) {
          return Center();
          // return SizedBox(
          //   child: Center(
          //     child: Text(
          //       markers1.length.toString(),
          //       style: const TextStyle(color: Colors.white),
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}

class Pin extends StatelessWidget {
  Pin({this.color, this.call, super.key});

  Color? color;
  VoidCallback? call;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: call ?? () {},
      child: Icon(
        Icons.location_on,
        size: 30.0,
        color: color ?? Colors.grey,
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return FlutterMap(
//     options: MapOptions(
//       initialCenter: LatLng(51.509364, -0.128928),
//       initialZoom: 9.2,
//     ),
//     children: [
//       TileLayer(
//         urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//         userAgentPackageName: 'com.example.app',
//       ),
//       RichAttributionWidget(
//         attributions: [
//           TextSourceAttribution(
//             'OpenStreetMap contributors',
//             onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
//           ),
//         ],
//       ),
//     ],
//   );
//
