import 'package:flutter/material.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/provider_answers.dart';
import 'package:provider/provider.dart';
import 'package:khulekani_app/data_base.dart  ';

class AgriculturalDamages extends StatefulWidget {
  const AgriculturalDamages({super.key});

  @override
  State<AgriculturalDamages> createState() => _AgriculturalDamagesState();
}


class _AgriculturalDamagesState extends State<AgriculturalDamages> {

  void insertFull(BuildContext context)async{
    final conn = await connectToDatabase();

    try {
      final result1 = await conn.execute(
        r'INSERT INTO info (districtMunicipality, localMunicipality, ward, areaName, streetAddress, wardCouncillor, wardCouncillorNumber, dateOfIncident, dateReported, dateResponded, timeOfIncident, timeReported, timeResponded, gpsCoordinatesLong, gpsCoordinatesLatt, earlyWarningReceived, typeOfIncident, otherIncident, causeOfIncident, otherCause, nameofFamily, headOfHousehold, identityNumber, contactNumber, alternitiveNumber, numberOfHouseholdMembers, numberOfPensioners, numberOfWomanEffected, numberOfMenEffected, numberOfChildrenEffected, numberOfDisabled, anyInjured, numberOfInjuries, emergencyAssistanceRequired, evacuatadeTo, modeofTransport, anyFatalities, numberOfFatalities, fatalitiesConfirmed, anyScholarsEffeccted, textbookDamage, anyLostDocument, lostDocumentAmount,itemsLost,  numberOfStructuresInHousehold, numberOfPartiallyDamagedStructures,       anyHomeless, numberOfHomeless, temporalAccomidation, otherDamages, numberOfMudHouseStructures, numberOfShackStructures,   numberOfEffectedDwellings, numberOfRDP, roofDamages, structuralDamages, essentialServicesDamaged, assitanceIssued, TempShelter, soupKitchen, foodParcels, tents, blankets, sponges, plasticSheeting, stove, pots, Other, typeOfIntervention, infrastructure, livestock, croplosses, soilDegredation, jobOpportunities, Veld)'
        r'VALUES (                          $1,                  $2,           $3,      $4,           $5,            $6,                   $7,                $8,           $9,             $10,        $11,            $12,           $13,             $14,                 $15,                 $16,                $17,          $18,           $19,           $20,         $21,           $22,             $23,             $24,            $25,                  $26,                   $27,                    $28,              $29,                     $30,                 $31,            $32,            $33,                   $34,                $35,           $36,            $37,             $38,               $39,                   $40,                $41,           $42,                 $43,                  $44,        $45,                $46,              $47,              $48,                        $49,                $50,         $51,           $52,                  $53,                    $54,           $55,           $56,       $57,      $58,   $59,       $60,         $61,       $62,  $63,    $64,        $65,             $66,            $67,       $68,           $69,             $70,        $71, $72, $73, $74, $75)',
        parameters: [
          // 'example_row_id',
          Provider
              .of<ProviderOne>(context, listen: false)
              .one,
          Provider
              .of<ProviderTwo>(context, listen: false)
              .two,
          Provider
              .of<ProviderThree>(context, listen: false)
              .three,
          Provider
              .of<ProviderFour>(context, listen: false)
              .four,
          Provider
              .of<ProviderFive>(context, listen: false)
              .five,
          Provider
              .of<ProviderSix>(context, listen: false)
              .six,
          Provider
              .of<ProviderSeven>(context, listen: false)
              .seven,
          Provider
              .of<ProviderEight>(context, listen: false)
              .eight,
          Provider
              .of<ProviderNine>(context, listen: false)
              .nine,
          Provider
              .of<ProviderTen>(context, listen: false)
              .ten,
          Provider
              .of<ProviderEleven>(context, listen: false)
              .eleven,
          Provider
              .of<ProviderTwelve>(context, listen: false)
              .twelve,
          Provider
              .of<ProviderThirteen>(context, listen: false)
              .thirteen,
          Provider
              .of<ProviderFourteen>(context, listen: false)
              .fourteen,
          Provider
              .of<ProviderFifteen>(context, listen: false)
              .fifteen,
          Provider
              .of<ProviderSixteen>(context, listen: false)
              .sixteen,
          Provider
              .of<ProviderSeventeen>(context, listen: false)
              .seventeen,
          Provider
              .of<ProviderEighteen>(context, listen: false)
              .eighteen,
          Provider
              .of<ProviderNineteen>(context, listen: false)
              .nineteen,
          Provider
              .of<ProviderTwenty>(context, listen: false)
              .twenty,
          Provider
              .of<ProviderTwentyOne>(context, listen: false)
              .twentyOne,
          Provider
              .of<ProviderTwentyTwo>(context, listen: false)
              .twentyTwo,
          Provider
              .of<ProviderTwentyThree>(context, listen: false)
              .twentyThree,
          Provider
              .of<ProviderTwentyFour>(context, listen: false)
              .twentyFour,
          Provider
              .of<ProviderTwentyFive>(context, listen: false)
              .twentyFive,
          Provider
              .of<ProviderTwentySix>(context, listen: false)
              .twentySix,
          Provider
              .of<ProviderTwentySeven>(context, listen: false)
              .twentySeven,
          Provider
              .of<ProviderTwentyEight>(context, listen: false)
              .twentyEight,
          Provider
              .of<ProviderTwentyNine>(context, listen: false)
              .twentyNine,
          Provider
              .of<ProviderThirty>(context, listen: false)
              .thirty,
          Provider
              .of<ProviderThirtyOne>(context, listen: false)
              .thirtyOne,
          Provider
              .of<ProviderThirtyTwo>(context, listen: false)
              .thirtyTwo,
          Provider
              .of<ProviderThirtyThree>(context, listen: false)
              .thirtyThree,
          Provider
              .of<ProviderThirtyFour>(context, listen: false)
              .thirtyFour,
          Provider
              .of<ProviderThirtyFive>(context, listen: false)
              .thirtyFive,
          Provider
              .of<ProviderThirtySix>(context, listen: false)
              .thirtySix,
          Provider
              .of<ProviderThirtySeven>(context, listen: false)
              .thirtySeven,
          Provider
              .of<ProviderThirtyEight>(context, listen: false)
              .thirtyEight,
          Provider
              .of<ProviderThirtyNine>(context, listen: false)
              .thirtyNine,
          Provider
              .of<ProviderForty>(context, listen: false)
              .forty,
          Provider
              .of<ProviderFortyOne>(context, listen: false)
              .fortyOne,
          // empty table Provider.of<ProviderFortyTwo>(context, listen: false).fortyTwo,
          Provider
              .of<ProviderFortyThree>(context, listen: false)
              .fortyThree,
          Provider
              .of<ProviderFortyFour>(context, listen: false)
              .fortyFour,
          Provider
              .of<ProviderFortyFive>(context, listen: false)
              .fortyFive,
          Provider
              .of<ProviderFortySix>(context, listen: false)
              .fortySix,
          Provider
              .of<ProviderFortySeven>(context, listen: false)
              .fortySeven,
          Provider
              .of<ProviderFortyEight>(context, listen: false)
              .fortyEight,
          Provider
              .of<ProviderFortyNine>(context, listen: false)
              .fortyNine,
          Provider
              .of<ProviderFifty>(context, listen: false)
              .fifty,
          Provider
              .of<ProviderFiftyOne>(context, listen: false)
              .fiftyOne,
          Provider
              .of<ProviderFiftyTwo>(context, listen: false)
              .fiftyTwo,
          Provider
              .of<ProviderFiftyThree>(context, listen: false)
              .fiftyThree,
          Provider
              .of<ProviderFiftyFour>(context, listen: false)
              .fiftyFour,
          Provider
              .of<ProviderFiftyFive>(context, listen: false)
              .fiftyFive,
          Provider
              .of<ProviderFiftySix>(context, listen: false)
              .fiftySix,
          Provider
              .of<ProviderFiftySeven>(context, listen: false)
              .fiftySeven,
          Provider
              .of<ProviderFiftyEight>(context, listen: false)
              .fiftyEight,
          Provider
              .of<ProviderFiftyNine>(context, listen: false)
              .fiftyNine,
          Provider
              .of<ProviderSixty>(context, listen: false)
              .sixty,
          Provider
              .of<ProviderSixtyOne>(context, listen: false)
              .sixtyOne,
          Provider
              .of<ProviderSixtyTwo>(context, listen: false)
              .sixtyTwo,
          Provider
              .of<ProviderSixtyThree>(context, listen: false)
              .sixtyThree,
          Provider
              .of<ProviderSixtyFour>(context, listen: false)
              .sixtyFour,
          Provider
              .of<ProviderSixtyFive>(context, listen: false)
              .sixtyFive,
          Provider
              .of<ProviderSixtySix>(context, listen: false)
              .sixtySix,
          Provider
              .of<ProviderSixtySeven>(context, listen: false)
              .sixtySeven,
          Provider
              .of<ProviderSixtyEight>(context, listen: false)
              .sixtyEight,
          Provider
              .of<ProviderSixtyNine>(context, listen: false)
              .sixtyNine,
          Provider
              .of<ProviderSeventy>(context, listen: false)
              .seventy,
          Provider
              .of<ProviderSeventyOne>(context, listen: false)
              .seventyOne,
          Provider
              .of<ProviderSeventyTwo>(context, listen: false)
              .seventyTwo,
          Provider
              .of<ProviderSeventyThree>(context, listen: false)
              .seventyThree,
          Provider
              .of<ProviderSeventyFour>(context, listen: false)
              .seventyFour,
          Provider
              .of<ProviderSeventyFive>(context, listen: false)
              .seventyFive,
          Provider
              .of<ProviderSeventySix>(context, listen: false)
              .seventySix


        ],
      );
      print("Done");
    }catch(error){
      print(error);
    }
  }

  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();
  TextEditingController controllerC = TextEditingController();
  TextEditingController controllerD = TextEditingController();
  TextEditingController controllerE = TextEditingController();
  TextEditingController controllerF = TextEditingController();

  String answerA = "";
  String answerB = "";
  String answerC = "";
  String answerD = "";
  String answerE = "";
  String answerF = "";



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1.0),
            child: Divider(color: Colors.black,),
          ),
          HeaderBlue(
            text: "AGRICULTURAL DAMAGE – PRELIMINARY SURVEY",
          ),
          const Padding(
            padding: EdgeInsets.only(top: 1.0),
            child: Divider(color: Colors.black,),
          ),
          SubTitle(
            title: "AGRICULTURAL DAMAGE",
          ),
          QuestionTextStrip(
            text: "A) Infrastructure",
            controller: controllerA,
          ),
          QuestionTextStrip(
            text: "B) Livestock",
            controller: controllerB,
          ),
          QuestionTextStrip(
            text: "C) Crop losses",
            controller: controllerC,
          ),
          QuestionTextStrip(
            text: "D) Saoil degredation",
            controller: controllerD,
          ),
          QuestionTextStrip(
            text: "E) Job opportunities",
            controller: controllerE,
          ),
          QuestionTextStrip(
            text: "F) Veld(Grazing burnt",
            controller: controllerF,
          ),
          SaveButton(
            onPressed: (){
              context
                  .read<ProviderSeventyTwo>()
                  .changeValue(newValue: controllerA.text);
              context
                  .read<ProviderSeventyThree>()
                  .changeValue(newValue: controllerB.text);
              context
                  .read<ProviderSeventyFour>()
                  .changeValue(newValue: controllerC.text);
              context
                  .read<ProviderSeventyFive>()
                  .changeValue(newValue: controllerD.text);
              context
                  .read<ProviderSeventySix>()
                  .changeValue(newValue: controllerE.text);
              context
                  .read<ProviderSeventySeven>()
                  .changeValue(newValue: controllerF.text);
            },
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                    child: const Text(
                      "Submit to PostgresSQL",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.red,
                    onPressed: () {

                      insertFull(context);

                      //Insert Method
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
