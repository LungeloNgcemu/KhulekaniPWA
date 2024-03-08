import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
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

  // List<Marker> markersA = [];

  // @override
  // void initState() {
  //   super.initState();
  //   // Generate sample markers
  //   generateMarkersA();
  // }

  // List<Marker> generateMarkersA() {
  //   // Add your logic to generate markers dynamically
  //   List<Marker> markersList = [];
  //
  //   for (int i = 0; i < 10; i++) {
  //     markersList.add(
  //       Marker(
  //         point: LatLng(-29.8587 + i * 0.01, 31.0218 + i * 0.01),
  //         width: 80,
  //         height: 80,
  //         child: Pin(),
  //       ),
  //     );
  //   }
  //
  //   return markersList;
  // }

  // void getRed(String target) async {
  //   final conn = await connectToDatabase();
  //
  //   final result = await conn.execute(
  //     Sql.named('SELECT headOfHousehold,gpsCoordinatesLong, gpsCoordinatesLatt,typeOfIncident  FROM info WHERE typeOfIncident=@type'),
  //     parameters: {'type': target },
  //   );
  //   if (result.isNotEmpty) {
  //     List<dynamic> items = result.map((item) {
  //       return {
  //         'name': item[0].toString(),
  //         'gpsLng': item[1].toString(),
  //         'gpsLat': item[2].toString(),
  //       };
  //     }).toList();
  //     print(items);
  //   } else {
  //     print('No records found.');
  //   }
  // }
  //
  // void vonvertToMArkerList(items){
  //
  //   final List<Marker> markersStresm = items.map((item){
  //
  //     Marker(
  //       point: LatLng(item.gpsLat, item.gpsLng),
  //       width: 80,
  //       height: 80,
  //       child: Pin(
  //         color: Colors.blue,
  //       ),
  //     );
  //
  //   }).toList();
  //
  //
  // }

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

  void showT(context, String type, String familyName,String adress) {
    Alert(
      context: context,
      type: AlertType.none,
      title: familyName ?? '',
      desc: adress ?? '',
      id: type ?? "",
      buttons: [
        DialogButton(
          child: Text(
            "Done",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
   // SmartDialog.showToast('test toast');
    print("hello");
  }

  @override
  void initState() {
    super.initState();
    // _initializeMarkers('Snow', Colors.red).then((markers) {
    //   setState(() {
    //     snow = markers!;
    //     print('SNOW : $snow');
    //   });
    // });
/////////////////////////////////////////////////////////

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

//////////////////////////////////////////////////
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

  // Future<void> _initializeMarkers(String type,List<Marker>? name ) async {
  //   List<Marker> newMarkers = await getForMap(type);
  //   setState(() {
  //     name = newMarkers;
  //   });
  // }

  Future<List<Marker>> getForMap(String target, Color color) async {

try {
  final conn = await connectToDatabase();
  final result = await conn.execute(
    Sql.named(
        'SELECT headOfHousehold, gpsCoordinatesLong, gpsCoordinatesLatt, typeOfIncident, streetAddress FROM info WHERE typeOfIncident=@type'),
    parameters: {'type': target},
  );

  if (result.isNotEmpty) {
    List<dynamic> items = await result.map((item) {
      return {
        'name': item[0].toString() ?? 'No Family Name',
        'gpsLng': double.tryParse(item[1]) ?? 0.0,
        'gpsLat': double.tryParse(item[2]) ?? 0.0,
        'type': item[3].toString() ?? '',
        'adress': item[4].toString() ?? 'No Adress',
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
            showT(context, item['type'], item['type'], item['type']);
          },
        ),
      );
    }).toList();

    print('these are items : ${items}');
    print(markersStream);
    return markersStream;
  } else {
    print('No records found.');
    return [];
  }
}catch(error){
  print(error);
  return [];
}
  }

  // IconButton(
  // splashColor: null,
  // icon: Icon(Icons.location_on),
  // onPressed: () {
  // showT(context, item['type']);
  // },
  // color: color!,
  // ),

  @override
  Widget build(BuildContext context) {
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
                        // You can implement custom error handling logic here


                    ),
                    TileLayer(
                      urlTemplate:
                      'https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}',
                      userAgentPackageName: 'com.example.app',
                      // You can implement custom error handling logic here

                    ),




                    // https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}
                    // 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    // https://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z},


                    MarkerLayer(markers: snow ?? []),
                    MarkerLayer(markers: veldFire ?? []),
                    MarkerLayer(markers: lightning ?? []),

                    MarkerLayer(
                      markers: snow ?? [],
                    ),
                    MarkerLayer(
                      markers: veldFire ?? [],
                    ),
                    MarkerLayer(
                      markers: heavyRainfall ?? [],
                    ),
                    MarkerLayer(
                      markers: lightning ?? [],
                    ),
                    MarkerLayer(
                      markers: strongWind ?? [],
                    ),
                    MarkerLayer(
                      markers: hailstorm ?? [],
                    ),
                    MarkerLayer(
                      markers: railAccident ?? [],
                    ),
                    MarkerLayer(
                      markers: roadAccident ?? [],
                    ),
                    MarkerLayer(
                      markers: earthquake ?? [],
                    ),
                    MarkerLayer(
                      markers: diseaseOutbreak ?? [],
                    ),
                    MarkerLayer(
                      markers: plantationFire ?? [],
                    ),
                    MarkerLayer(
                      markers: severeThunderstorm ?? [],
                    ),
                    MarkerLayer(
                      markers: drought ?? [],
                    ),
                    MarkerLayer(
                      markers: mudSlide ?? [],
                    ),
                    MarkerLayer(
                      markers: airCrash ?? [],
                    ),
                    MarkerLayer(
                      markers: hazmatSpillage ?? [],
                    ),
                    MarkerLayer(
                      markers: industrialPollution ?? [],
                    ),
                    MarkerLayer(
                      markers: civilUnrest ?? [],
                    ),
                    MarkerLayer(
                      markers: industrialFire ?? [],
                    ),
                    MarkerLayer(
                      markers: structuralFailure ?? [],
                    ),
                    MarkerLayer(
                      markers: shipWreck ?? [],
                    ),
                    //
                    // Cluster(
                    //   markers1: snow ?? [],
                    // ),
                    // Cluster(
                    //   markers1: veldFire ?? [],
                    // ),
                    // Cluster(
                    //   markers1: heavyRainfall ?? [],
                    // ),
                    // Cluster(
                    //   markers1: lightning ?? [],
                    // ),
                    // Cluster(
                    //   markers1: strongWind ?? [],
                    // ),
                    // Cluster(
                    //   markers1: hailstorm ?? [],
                    // ),
                    // Cluster(
                    //   markers1: railAccident ?? [],
                    // ),
                    // Cluster(
                    //   markers1: roadAccident ?? [],
                    // ),
                    // Cluster(
                    //   markers1: earthquake ?? [],
                    // ),
                    // Cluster(
                    //   markers1: diseaseOutbreak ?? [],
                    // ),
                    // Cluster(
                    //   markers1: plantationFire ?? [],
                    // ),
                    // Cluster(
                    //   markers1: severeThunderstorm ?? [],
                    // ),
                    // Cluster(
                    //   markers1: drought ?? [],
                    // ),
                    // Cluster(
                    //   markers1: mudSlide ?? [],
                    // ),
                    // Cluster(
                    //   markers1: airCrash ?? [],
                    // ),
                    // Cluster(
                    //   markers1: hazmatSpillage ?? [],
                    // ),
                    // Cluster(
                    //   markers1: industrialPollution ?? [],
                    // ),
                    // Cluster(
                    //   markers1: civilUnrest ?? [],
                    // ),
                    // Cluster(
                    //   markers1: industrialFire ?? [],
                    // ),
                    // Cluster(
                    //   markers1: structuralFailure ?? [],
                    // ),
                    // Cluster(
                    //   markers1: shipWreck ?? [],
                    // ),
                    // RichAttributionWidget(
                    //   attributions: [
                    //     TextSourceAttribution(
                    //       'Secret',
                    //       onTap: () =>
                    //           launchUrl(Uri.parse('https://mt1.google.com')),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              SubTitle(
                title: "Legend Description",
              ),
              // const  Padding(
              //   padding: EdgeInsets.symmetric(vertical: 8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         "Legend Description",
              //         style: TextStyle(fontSize: 25.0),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 8.0),
              //         child: Icon(color: Colors.black, Icons.location_on),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 100.0,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisExtent: 30,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1.0),
                  children: <Widget>[
                    LegendDiscription(text: "Snow", color: Colors.red),
                    LegendDiscription(text: "Veld Fire", color: Colors.orange),
                    LegendDiscription(text: "Lightning", color: Colors.yellow),
                    LegendDiscription(text: "Hailstorm", color: Colors.blue),
                    LegendDiscription(
                        text: "Road Accident", color: Colors.green),
                    LegendDiscription(
                        text: "Heavy Rainfall", color: Colors.blue),
                    LegendDiscription(text: "Strong Wind", color: Colors.green),
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
                    LegendDiscription(text: "Drought", color: Colors.amber),
                    LegendDiscription(text: "Mud Slide", color: Colors.brown),
                    LegendDiscription(
                        text: "Air Crash", color: Colors.deepPurple),
                    LegendDiscription(
                        text: "Hazmat Spillage", color: Colors.lightGreen),
                    LegendDiscription(
                        text: "Industrial Pollution", color: Colors.lightBlue),
                    LegendDiscription(
                        text: "Civil Unrest", color: Colors.redAccent),
                    LegendDiscription(
                        text: "Industrial Fire", color: Colors.orangeAccent),
                    LegendDiscription(
                        text: "Structural Failure", color: Colors.blueAccent),
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
