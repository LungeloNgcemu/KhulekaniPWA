import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'data_base.dart';
import 'package:postgres/postgres.dart';
import 'components/save_button.dart';

class NotGoogle extends StatefulWidget {
  const NotGoogle({super.key});

  @override
  State<NotGoogle> createState() => _NotGoogleState();
}

class _NotGoogleState extends State<NotGoogle> {
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
  List<Marker>? car;

  @override
  void initState() {
    super.initState();
    _initializeMarkers('Snow',Colors.red).then((markers) {
      setState(() {
        snow = markers;
      });
    });

    // _initializeMarkers('car').then((markers) {
    //   setState(() {
    //     car = markers;
    //   });
    // });
  }

  Future<List<Marker>?> _initializeMarkers(String type,Color? color) async {
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
    final conn = await connectToDatabase();

    final result = await conn.execute(
      Sql.named(
          'SELECT headOfHousehold, gpsCoordinatesLong, gpsCoordinatesLatt, typeOfIncident FROM info WHERE typeOfIncident=@type'),
      parameters: {'type': target},
    );

    if (result.isNotEmpty) {
      List<dynamic> items = result.map((item) {
        return {
          'name': item[0].toString(),
          'gpsLng': double.tryParse(item[1]) ?? 0.0,
          'gpsLat': double.tryParse(item[2]) ?? 0.0,
        };
      }).toList();

      final List<Marker> markersStream = items.map((item) {
        return Marker(
          point: LatLng(item['gpsLat'], item['gpsLng']),
          width: 80,
          height: 80,
          child: Pin(
            color: color!,
          ),
        );
      }).toList();

      print('these are items : ${items}' );
      print(markersStream);
      return markersStream;
    } else {
      print('No records found.');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(-29.8587, 31.0218),
              initialZoom: 12.0,
              keepAlive: true,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}',
                userAgentPackageName: 'com.example.app',
              ),
              Cluster(
                markers1: snow ?? [],
                //Differrent marker list
              ),
              Cluster(
                markers1: [
                  Marker(
                    point: LatLng(-29.8878, 30.9925),
                    width: 80,
                    height: 80,
                    child: Pin(
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
              Cluster(
                markers1: [
                  Marker(
                    point: LatLng(30, 40),
                    width: 80,
                    height: 80,
                    child: Pin(),
                  ),
                ],
              ),
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'Secret',
                    onTap: () => launchUrl(Uri.parse('https://www.google.cn')),
                  ),
                ],
              ),
            ],
          ),
        ),
        SaveButton(
          onPressed: () {
            // getForMap('Snow');
          },
        )
      ],
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
        maxClusterRadius: 45,
        size: const Size(40, 40),
        alignment: Alignment.center,
        maxZoom: 15,
        padding: const EdgeInsets.all(50),
        // Use AnchorPosAlign
        markers: markers1,
        builder: (context, markers1) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                markers1.length.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Pin extends StatelessWidget {
  Pin({this.color, super.key});

  Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.location_on,
      size: 50.0,
      color: color ?? Colors.grey,
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
