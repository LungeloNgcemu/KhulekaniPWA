import 'package:flutter/material.dart';
import 'pages/spacialLocation.dart';
import 'pages/incident_deatail.dart';
import 'pages/household_effected.dart';
import 'pages/wellbeing_impact.dart';
import 'pages/infrastructure_condtition.dart';
import 'pages/social_relief_support.dart';
import 'pages/agricultural_damages.dart';
//import 'pages/table.dart' as collect;

 List<Widget> _pages = const [
  SpacialLocationPage(),
  IncidentDetails(),
  HouseholdEffected(),
  WellbeingImpact(),
  InfrastructureCondition(),
  SocialReliefSupport(),
  AgriculturalDamages(),
  // collect.Table(),
];


class Viewx extends StatefulWidget {
  Viewx({ this.changer,this.controller});

  dynamic changer;
  PageController? controller;
  @override
  State<Viewx> createState() => _ViewxState();
}

class _ViewxState extends State<Viewx> {







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        onPageChanged: widget.changer?? (){},
        controller: widget.controller!,
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