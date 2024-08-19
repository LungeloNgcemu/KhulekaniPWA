import 'package:flutter/material.dart';
import 'package:khulekani_app/pages/table_screen.dart';
import 'pages/spacialLocation.dart';
import 'pages/incident_deatail.dart';
import 'pages/household_effected.dart';
import 'pages/wellbeing_impact.dart';
import 'pages/infrastructure_condtition.dart';
import 'pages/social_relief_support.dart';
import 'pages/agricultural_damages.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'data_base.dart';
import 'pages/map_screen.dart';
import 'not_google.dart';
import 'pages/image_screen.dart';
import 'pages/notes_sceen.dart';
import 'pages/submit_screen.dart';
//import 'pages/table.dart' as collect;

List<Widget> _pages = const [
  SpacialLocationPage(),
  IncidentDetails(),
  HouseholdEffected(),
  WellbeingImpact(),
  InfrastructureCondition(),
  SocialReliefSupport(),
  AgriculturalDamages(),
  ImageScreen(),
  NotesScreen(),
  SubmitScreen(),
  NotGoogle(),
  TableScreen()
];

class Viewx extends StatefulWidget {
  Viewx({this.changer, this.controller});

  // dynamic changer;
  void Function(int)? changer;
  PageController? controller;
  @override
  State<Viewx> createState() => _ViewxState();
}

class _ViewxState extends State<Viewx> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    // Call connect function when the widget is initialized

    connect(context);
  }

  Future<bool?> connect(BuildContext context) async {
    try {
      final conn = await connectToDatabase();
      print('has connection!');
      setState(() {
        isLoading = false;
      });
      return Alert(
        context: context,
        type: AlertType.success,
        title: "Connection Succesful",
        //desc: "Data base is available",
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            width: 120,
            child: const Text(
              "continue",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    } catch (error) {
      setState(() {
        isLoading = false;
      });

      print("THis is tthe connection error :$error");

      return Alert(
        context: context,
        type: AlertType.error,
        title: "No Connection",
        desc: "$error",

        // desc: "Network Error...Close and Reopen App",
        buttons: [
          DialogButton(
            child: Text(
              "Okay",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      // print("problem : ${error}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : PageView(
              scrollDirection: Axis.horizontal,
              onPageChanged: widget.changer ?? (int pageIndex) {},
              controller: widget.controller,
              children: _pages,
            ),
    );
  }
}
//
// (index) {
// setState(() {
// visit = index;
// (context as Element).markNeedsBuild();
// });
// },