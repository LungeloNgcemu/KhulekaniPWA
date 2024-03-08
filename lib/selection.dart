import 'package:flutter/material.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'components/subtitle.dart';
import 'package:khulekani_app/data_base.dart';

class Selection extends StatefulWidget {
  Selection(
      {this.onTap1,
      this.onTap2,
      this.onTap3,
      this.onTap4,
      this.onTap5,
      this.onTap6,
      this.onTap7,
      this.onTap8,
      this.onTap9,
      this.onTap10,
      this.onTap11,
      this.color1,
      this.color2,
      this.color3,
      this.color4,
      this.color5,
      this.color6,
      this.color7,
      this.color8,
      this.color9,
      this.color10,
      this.color11,
      key});

  VoidCallback? onTap1;
  VoidCallback? onTap2;
  VoidCallback? onTap3;
  VoidCallback? onTap4;
  VoidCallback? onTap5;
  VoidCallback? onTap6;
  VoidCallback? onTap7;
  VoidCallback? onTap8;
  VoidCallback? onTap9;
  VoidCallback? onTap10;
  VoidCallback? onTap11;

  Color? color1;
  Color? color2;
  Color? color3;
  Color? color4;
  Color? color5;
  Color? color6;
  Color? color7;
  Color? color8;
  Color? color9;
  Color? color10;
  Color? color11;

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  void createImageTable() async {
    final conn = await connectToDatabase();
    try {
      await conn.execute('CREATE TABLE IF NOT EXISTS pictures ('
          ' id SERIAL PRIMARY KEY,'
          ' info_id INTEGER,'
          ' image1 VARCHAR(500),'
          ' image2 VARCHAR(500),'
          ' image3 VARCHAR(500),'
          ' image4 VARCHAR(500),'
          ' image5 VARCHAR(500),'
          ' image6 VARCHAR(500),'
          ' image7 VARCHAR(500),'
          ' image8 VARCHAR(500),'
          ' image9 VARCHAR(500),'
          ' image10 VARCHAR(500),'
          ' FOREIGN KEY (info_id) REFERENCES info(info_id)'
          ')');
      conn.close();
      print("created pictures table");
    } catch (error) {
      print(error);
    }
  }

  void createChildrenTable() async {
    final conn = await connectToDatabase();
    try {
      await conn.execute('CREATE TABLE IF NOT EXISTS children ('
          ' id SERIAL PRIMARY KEY,'
          ' info_id INTEGER,'
          ' name VARCHAR(45),'
          ' birthdate VARCHAR(45),'
          ' gender VARCHAR(45),'
          ' age VARCHAR(45),'
          ' school VARCHAR(45),'
          ' grade VARCHAR(45),'
          ' shoeSize VARCHAR(45),'
          ' uniformSize VARCHAR(45),'
          ' additionalInfo VARCHAR(45),'
          ' FOREIGN KEY (info_id) REFERENCES info(info_id)'
          ')');
      conn.close();
      print("created children table");
    } catch (error) {
      print(error);
    }
  }

  void createFull() async {
    final conn = await connectToDatabase();

    try {
      await conn.execute('CREATE TABLE IF NOT EXISTS info ('
          '   info_id SERIAL PRIMARY KEY, '
          '  districtMunicipality VARCHAR(255), '
          '  localMunicipality VARCHAR(255), '
          '  ward VARCHAR(255), '
          '  areaName VARCHAR(255), '
          '  streetAddress VARCHAR(255), '
          '  wardCouncillor VARCHAR(255), '
          '  wardCouncillorNumber VARCHAR(255), '
          '  dateOfIncident VARCHAR(255), '
          '  dateReported VARCHAR(255), '
          '  dateResponded VARCHAR(255), '
          '  timeOfIncident VARCHAR(255), '
          '  timeReported VARCHAR(255), '
          '  timeResponded VARCHAR(255), '
          '  gpsCoordinatesLong VARCHAR(255), '
          '  gpsCoordinatesLatt VARCHAR(255), '
          '  earlyWarningReceived VARCHAR(255), '
          '  typeOfIncident VARCHAR(255), '
          '  otherIncident VARCHAR(255), '
          '  causeOfIncident VARCHAR(255), '
          '  otherCause VARCHAR(255), '
          '  nameofFamily VARCHAR(255), '
          '  headOfHousehold VARCHAR(255), '
          '  identityNumber VARCHAR(255), '
          '  contactNumber VARCHAR(255), '
          '  alternitiveNumber VARCHAR(255), '
          '  numberOfHouseholdMembers VARCHAR(255), '
          '  numberOfPensioners VARCHAR(255), '
          '  numberOfWomanEffected VARCHAR(255), '
          '  numberOfMenEffected VARCHAR(255), '
          '  numberOfChildrenEffected VARCHAR(255), '
          '  numberOfDisabled VARCHAR(255), '
          '  anyInjured VARCHAR(255), '
          '  numberOfInjuries VARCHAR(255), '
          '  emergencyAssistanceRequired VARCHAR(255), '
          '  evacuatadeTo VARCHAR(255), '
          '  modeofTransport VARCHAR(255), '
          '  anyFatalities VARCHAR(255), '
          '  numberOfFatalities VARCHAR(255), '
          '  fatalitiesConfirmed VARCHAR(255), '
          '  anyScholarsEffeccted VARCHAR(255), '
          '  textbookDamage VARCHAR(255), '
          '  anyLostDocument VARCHAR(255), '
          '  lostDocumentAmount VARCHAR(255), '
          '  itemsLost VARCHAR(255), '
          '  numberOfStructuresInHousehold VARCHAR(255), '
          '  numberOfPartiallyDamagedStructures VARCHAR(255), '
          '  anyHomeless VARCHAR(255), '
          '  numberOfHomeless VARCHAR(255), '
          '  temporalAccomidation VARCHAR(255), '
          '  otherDamages VARCHAR(255), '
          '  numberOfMudHouseStructures VARCHAR(255), '
          '  numberOfShackStructures VARCHAR(255), '
          '  numberOfEffectedDwellings VARCHAR(255), '
          '  numberOfRDP VARCHAR(255), '
          '  roofDamages VARCHAR(255), '
          '  structuralDamages VARCHAR(255), '
          '  essentialServicesDamaged VARCHAR(255), '
          '  assitanceIssued VARCHAR(255), '
          '  TempShelter VARCHAR(255), '
          '  soupKitchen VARCHAR(255), '
          '  foodParcels VARCHAR(255), '
          '  tents VARCHAR(255), '
          '  blankets VARCHAR(255), '
          '  sponges VARCHAR(255), '
          '  plasticSheeting VARCHAR(255), '
          '  stove VARCHAR(255), '
          '  pots VARCHAR(255), '
          '  Other VARCHAR(255), '
          '  typeOfIntervention VARCHAR(255), '
          '  infrastructure VARCHAR(255), '
          '  livestock VARCHAR(255), '
          '  croplosses VARCHAR(255), '
          '  soilDegredation VARCHAR(255), '
          '  jobOpportunities VARCHAR(255), '
          '  Veld VARCHAR(255), '
          '  numberOfMattreses VARCHAR(255), '
          '  numberoOfLightingConductor VARCHAR(255), '
          '  otherIntervention VARCHAR(255), '
          '  notes VARCHAR(255) '
          ')');
      print("successful");
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(23.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: Divider(
                  color: Colors.black26,
                ),
              ),
              SubTitle2(
                title: 'Sections',
              ),
              const Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: Divider(
                  color: Colors.black26,
                ),
              ),
              // Divider(),
              ButtonSelection(
                inSide: "1. SPATIAL LOCATION",
                onTap: widget.onTap1,
                color: widget.color1!,
              ),
              ButtonSelection(
                inSide: "2. INCIDENT DETAILS",
                onTap: widget.onTap2,
                color: widget.color2!,
              ),
              ButtonSelection(
                inSide: "3. HOUSEHOLD EFFECTED",
                onTap: widget.onTap3,
                color: widget.color3!,
              ),
              ButtonSelection(
                inSide: "4. WELLBEING IMPACT ON THE HOUSEHOLD MEMBERS",
                onTap: widget.onTap4,
                color: widget.color4!,
              ),
              ButtonSelection(
                inSide: "5. CONDITION OF THE INFRASTRUCTURE",
                onTap: widget.onTap5,
                color: widget.color5!,
              ),
              ButtonSelection(
                inSide: "6. SOCIAL RELIEF SUPPORT",
                onTap: widget.onTap6,
                color: widget.color6!,
              ),
              ButtonSelection(
                inSide: "7. AGRICULTURAL DAMAGE – PRELIMINARY SURVEY",
                onTap: widget.onTap7,
                color: widget.color7!,
              ),
              ButtonSelection(
                inSide: "8. Pictures Selection",
                onTap: widget.onTap8,
                color: widget.color8,
              ),
              ButtonSelection(
                inSide: "9. Special Notes       ",
                onTap: widget.onTap9,
                color: widget.color9,
              ),
              ButtonSelection(
                inSide: "10. Submit               ",
                onTap: widget.onTap10,
                color: widget.color10,
              ),
              ButtonSelection2(
                inSide: "View Map",
                size: 24.0,
                color: widget.color11,
                onTap: widget.onTap11,
              ),
              Divider(),
              // Padding(
              //   padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: ElevatedButton(
              //           onPressed: () {
              //             createFull();
              //           },
              //           child: Text("CREATE MAIN DATABASE"),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: ElevatedButton(
              //           onPressed: () {
              //             createChildrenTable();
              //           },
              //           child: Text("CREAT CHILD DATABASE"),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: ElevatedButton(
              //           onPressed: () {
              //             createImageTable();
              //           },
              //           child: Text("CREAT IMAGE DATABASE"),
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonSelection extends StatelessWidget {
  ButtonSelection({
    this.color,
    this.onTap,
    this.inSide,
    this.size,
    super.key,
  });

  VoidCallback? onTap;
  String? inSide;
  Color? color;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
            color: color!,
          ),
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 60.0, top: 10, bottom: 10, right: 15.0),
            child: Center(
              child: Text(
                inSide ?? "",
                style: TextStyle(fontSize: size ?? 18.0),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonSelection2 extends StatelessWidget {
  ButtonSelection2({
    this.color,
    this.onTap,
    this.inSide,
    this.size,
    super.key,
  });

  VoidCallback? onTap;
  String? inSide;
  Color? color;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
            color: color!,
          ),
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    inSide ?? "",
                    style: TextStyle(
                        fontSize: size ?? 18.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
