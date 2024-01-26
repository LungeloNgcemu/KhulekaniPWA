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
      key});

  VoidCallback? onTap1;
  VoidCallback? onTap2;
  VoidCallback? onTap3;
  VoidCallback? onTap4;
  VoidCallback? onTap5;
  VoidCallback? onTap6;
  VoidCallback? onTap7;

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {


  void createFull() async {
    final conn = await connectToDatabase();

    try {
      await conn.execute('CREATE TABLE IF NOT EXISTS info ('
          '   id SERIAL PRIMARY KEY, '
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
          '  Veld VARCHAR(255) '
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
              SubTitle(
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
              ),
              ButtonSelection(
                inSide: "2. INCIDENT DETAILS",
                onTap: widget.onTap2,
              ),
              ButtonSelection(
                inSide: "3. HOUSEHOLD EFFECTED",
                onTap: widget.onTap3,
              ),
              ButtonSelection(
                inSide: "4. WELLBEING IMPACT ON THE HOUSEHOLD MEMBERS",
                onTap: widget.onTap4,
              ),
              ButtonSelection(
                inSide: "5. CONDITION OF THE INFRASTRUCTURE",
                onTap: widget.onTap5,
              ),
              ButtonSelection(
                inSide: "6. SOCIAL RELIEF SUPPORT",
                onTap: widget.onTap6,
              ),
              ButtonSelection(
                inSide: "7. AGRICULTURAL DAMAGE – PRELIMINARY SURVEY",
                onTap: widget.onTap7,
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(

                            onPressed: () {
                              createFull();
                            },
                            child: Text("CREAT DATABASE"))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonSelection extends StatelessWidget {
  ButtonSelection({
    this.onTap,
    this.inSide,
    super.key,
  });

  VoidCallback? onTap;
  String? inSide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
            color: Colors.grey[100],
          ),
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                inSide ?? "",
                style: const TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
