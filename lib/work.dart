// import 'package:khulekani_app/provider_answers.dart';
// import 'package:postgres/postgres.dart';
//
//
//
// void insertFull(BuildContext context)async{
//   final conn = await connectToDatabase();
//   final result1 = await conn.execute(
//     r'INSERT INTO information (districtMunicipality, localMunicipality, ward, areaLocation, streetAddress, wardCouncillor, wardCouncillorNumber, dateOfIncident, dateReported, dateResponded, timeOfIncident, timeReported, timeResponded, gpsCoordinatesLong, gpsCoordinatesLatt, earlyWarningReceived, typeOfIncident, otherIncident, causeOfIncident, otherCause, nameofFamily, headOfHousehold, identityNumber, contactNumber, alternitiveNumber, numberOfHouseholdMembers, numberOfPensioners, numberOfWomanEffected, numberOfMenEffected, numberOfChildrenEffected, numberOfDisabled, anyInjured, numberOfInjuries, emergencyAssistanceRequired, evacuatadeTo, modeofTransport, anyFatalities, numberOfFatalities, fatalitiesConfirmed, anyScholarsEffeccted, textbookDamage, anyLostDocument, lostDocumentAmount,itemsLost,  numberOfStructures, numberOfPartialDamage,       anyHomeless, numberOfHomeless, temporalAccomidation, otherDamages, numberOfMudHouseStructures, numberOfShackStructures,   numberOfEffectedDwellings numberOfRDP, roofDamages, structuralDamages, essentialServicesDamaged, assitanceIssued, TempShelter, soupKitchen, foodParcels, tents, blankets, sponges, plasticSheeting, stove, pots, Other, typeOfIntervention, infrastructure, livestock, croplosses, soilDegredation, jobOpportunities, Veld)'
//     r'VALUES (                          $1,                  $2,           $3,      $4,           $5,            $6,                   $7,                $8,           $9,             $10,        $11,            $12,           $13,             $14,                 $15,                 $16,                $17,          $18,           $19,           $20,         $21,           $22,             $23,             $24,            $25,                  $26,                   $27,                    $28,              $29,                     $30,                 $31,            $32,            $33,                   $34,                $35,           $36,            $37,             $38,               $39,                   $40,                $41,           $42,                 $43,                  $44,        $45,                $46,              $47,              $48,                        $49,                $50,         $51,           $52,                  $53,                    $54,           $55,           $56,       $57,      $58,   $59,       $60,         $61,       $62,  $63,    $64,        $65,             $66,            $67,       $68,           $69,             $70,        $71, $72, 73, $74, $75)',
//     parameters: [
//       // 'example_row_id',
//       Provider.of<ProviderOne>(context, listen: false).one,
//       Provider.of<ProviderTwo>(context, listen: false).two,
//       Provider.of<ProviderThree>(context, listen: false).three,
//       Provider.of<ProviderFour>(context, listen: false).four,
//       Provider.of<ProviderFive>(context, listen: false).five,
//       Provider.of<ProviderSix>(context, listen: false).six,
//       Provider.of<ProviderSeven>(context, listen: false).seven,
//       Provider.of<ProviderEight>(context, listen: false).eight,
//       Provider.of<ProviderNine>(context, listen: false).nine,
//       Provider.of<ProviderTen>(context, listen: false).ten,
//       Provider.of<ProviderEleven>(context, listen: false).eleven,
//       Provider.of<ProviderTwelve>(context, listen: false).twelve,
//       Provider.of<ProviderThirteen>(context, listen: false).thirteen,
//       Provider.of<ProviderFourteen>(context, listen: false).fourteen,
//       Provider.of<ProviderFifteen>(context, listen: false).fifteen,
//       Provider.of<ProviderSixteen>(context, listen: false).sixteen,
//       Provider.of<ProviderSeventeen>(context, listen: false).seventeen,
//       Provider.of<ProviderEighteen>(context, listen: false).eighteen,
//       Provider.of<ProviderNineteen>(context, listen: false).nineteen,
//       Provider.of<ProviderTwenty>(context, listen: false).twenty,
//       Provider.of<ProviderTwentyOne>(context, listen: false).twentyOne,
//       Provider.of<ProviderTwentyTwo>(context, listen: false).twentyTwo,
//       Provider.of<ProviderTwentyThree>(context, listen: false).twentyThree,
//       Provider.of<ProviderTwentyFour>(context, listen: false).twentyFour,
//       Provider.of<ProviderTwentyFive>(context, listen: false).twentyFive,
//       Provider.of<ProviderTwentySix>(context, listen: false).twentySix,
//       Provider.of<ProviderTwentySeven>(context, listen: false).twentySeven,
//       Provider.of<ProviderTwentyEight>(context, listen: false).twentyEight,
//       Provider.of<ProviderTwentyNine>(context, listen: false).twentyNine,
//       Provider.of<ProviderThirty>(context, listen: false).thirty,
//       Provider.of<ProviderThirtyOne>(context, listen: false).thirtyOne,
//       Provider.of<ProviderThirtyTwo>(context, listen: false).thirtyTwo,
//       Provider.of<ProviderThirtyThree>(context, listen: false).thirtyThree,
//       Provider.of<ProviderThirtyFour>(context, listen: false).thirtyFour,
//       Provider.of<ProviderThirtyFive>(context, listen: false).thirtyFive,
//       Provider.of<ProviderThirtySix>(context, listen: false).thirtySix,
//       Provider.of<ProviderThirtySeven>(context, listen: false).thirtySeven,
//       Provider.of<ProviderThirtyEight>(context, listen: false).thirtyEight,
//       Provider.of<ProviderThirtyNine>(context, listen: false).thirtyNine,
//       Provider.of<ProviderForty>(context, listen: false).forty,
//       Provider.of<ProviderFortyOne>(context, listen: false).fortyOne,
//     // empty table Provider.of<ProviderFortyTwo>(context, listen: false).fortyTwo,
//       Provider.of<ProviderFortyThree>(context, listen: false).fortyThree,
//       Provider.of<ProviderFortyFour>(context, listen: false).fortyFour,
//       Provider.of<ProviderFortyFive>(context, listen: false).fortyFive,
//       Provider.of<ProviderFortySix>(context, listen: false).fortySix,
//       Provider.of<ProviderFortySeven>(context, listen: false).fortySeven,
//       Provider.of<ProviderFortyEight>(context, listen: false).fortyEight,
//       Provider.of<ProviderFortyNine>(context, listen: false).fortyNine,
//       Provider.of<ProviderFifty>(context, listen: false).fifty,
//       Provider.of<ProviderFiftyOne>(context, listen: false).fiftyOne,
//       Provider.of<ProviderFiftyTwo>(context, listen: false).fiftyTwo,
//       Provider.of<ProviderFiftyThree>(context, listen: false).fiftyThree,
//       Provider.of<ProviderFiftyFour>(context, listen: false).fiftyFour,
//       Provider.of<ProviderFiftyFive>(context, listen: false).fiftyFive,
//       Provider.of<ProviderFiftySix>(context, listen: false).fiftySix,
//       Provider.of<ProviderFiftySeven>(context, listen: false).fiftySeven,
//       Provider.of<ProviderFiftyEight>(context, listen: false).fiftyEight,
//       Provider.of<ProviderFiftyNine>(context, listen: false).fiftyNine,
//       Provider.of<ProviderSixty>(context, listen: false).sixty,
//       Provider.of<ProviderSixtyOne>(context, listen: false).sixtyOne,
//       Provider.of<ProviderSixtyTwo>(context, listen: false).sixtyTwo,
//       Provider.of<ProviderSixtyThree>(context, listen: false).sixtyThree,
//       Provider.of<ProviderSixtyFour>(context, listen: false).sixtyFour,
//       Provider.of<ProviderSixtyFive>(context, listen: false).sixtyFive,
//       Provider.of<ProviderSixtySix>(context, listen: false).sixtySix,
//       Provider.of<ProviderSixtySeven>(context, listen: false).sixtySeven,
//       Provider.of<ProviderSixtyEight>(context, listen: false).sixtyEight,
//       Provider.of<ProviderSixtyNine>(context, listen: false).sixtyNine,
//       Provider.of<ProviderSeventy>(context, listen: false).seventy,
//       Provider.of<ProviderSeventyOne>(context, listen: false).seventyOne,
//       Provider.of<ProviderSeventyTwo>(context, listen: false).seventyTwo,
//       Provider.of<ProviderSeventyThree>(context, listen: false).seventyThree,
//       Provider.of<ProviderSeventyFour>(context, listen: false).seventyFour,
//       Provider.of<ProviderSeventyFive>(context, listen: false).seventyFive,
//       Provider.of<ProviderSeventySix>(context, listen: false).seventySix
//
//
//     ],
//   );
// }
//
// void createFull() async {
//   final conn = await connectToDatabase();
//
//   try {
//     await conn.execute('CREATE TABLE IF NOT EXISTS information ('
//         '   id SERIAL PRIMARY KEY, '
//         '  districtMunicipality VARCHAR(255), '
//         '  localMunicipality VARCHAR(255), '
//         '  ward VARCHAR(255), '
//         '  areaName VARCHAR(255), '
//         '  streetAddress VARCHAR(255), '
//         '  wardCouncillor VARCHAR(255), '
//         '  wardCouncillorNumber VARCHAR(255), '
//         '  dateOfIncident VARCHAR(255), '
//         '  dateReported VARCHAR(255), '
//         '  dateResponded VARCHAR(255), '
//         '  timeOfIncident VARCHAR(255), '
//         '  timeReported VARCHAR(255), '
//         '  timeResponded VARCHAR(255), '
//         '  gpsCoordinatesLong VARCHAR(255), '
//         '  gpsCoordinatesLatt VARCHAR(255), '
//         '  earlyWarningReceived VARCHAR(255), '
//         '  typeOfIncident VARCHAR(255), '
//         '  otherIncident VARCHAR(255), '
//         '  causeOfIncident VARCHAR(255), '
//         '  otherCause VARCHAR(255), '
//         '  nameofFamily VARCHAR(255), '
//         '  headOfHousehold VARCHAR(255), '
//         '  identityNumber VARCHAR(255), '
//         '  contactNumber VARCHAR(255), '
//         '  alternitiveNumber VARCHAR(255), '
//         '  numberOfHouseholdMembers VARCHAR(255), '
//         '  numberOfPensioners VARCHAR(255), '
//         '  numberOfWomanEffected VARCHAR(255), '
//         '  numberOfMenEffected VARCHAR(255), '
//         '  numberOfChildrenEffected VARCHAR(255), '
//         '  numberOfDisabled VARCHAR(255), '
//         '  anyInjured VARCHAR(255), '
//         '  numberOfInjuries VARCHAR(255), '
//         '  emergencyAssistanceRequired VARCHAR(255), '
//         '  evacuatadeTo VARCHAR(255), '
//         '  modeofTransport VARCHAR(255), '
//         '  anyFatalities VARCHAR(255), '
//         '  numberOfFatalities VARCHAR(255), '
//         '  fatalitiesConfirmed VARCHAR(255), '
//         '  anyScholarsEffeccted VARCHAR(255), '
//         '  textbookDamage VARCHAR(255), '
//         '  anyLostDocument VARCHAR(255), '
//         '  lostDocumentAmount VARCHAR(255), '
//
//         '  itemsLost VARCHAR(255), '
//
//         '  numberOfStructuresInHousehold VARCHAR(255), '
//         '  numberOfPartiallyDamagedStructures VARCHAR(255), '
//         '  anyHomeless VARCHAR(255), '
//         '  numberOfHomeless VARCHAR(255), '
//         '  temporalAccomidation VARCHAR(255), '
//         '  otherDamages VARCHAR(255), '
//         '  numberOfMudHouseStructures VARCHAR(255), '
//         '  numberOfShackStructures VARCHAR(255), '
//         '  numberOfRDP VARCHAR(255), '
//         '  roofDamages VARCHAR(255), '
//         '  structuralDamages VARCHAR(255), '
//         '  essentialServicesDamaged VARCHAR(255), '
//         '  assitanceIssued VARCHAR(255), '
//         '  TempShelter VARCHAR(255), '
//         '  soupKitchen VARCHAR(255), '
//         '  foodParcels VARCHAR(255), '
//         '  tents VARCHAR(255), '
//         '  blankets VARCHAR(255), '
//         '  sponges VARCHAR(255), '
//         '  plasticSheeting VARCHAR(255), '
//         '  stove VARCHAR(255), '
//         '  pots VARCHAR(255), '
//         '  Other VARCHAR(255), '
//         '  typeOfIntervention VARCHAR(255), '
//         '  infrastructure VARCHAR(255), '
//         '  livestock VARCHAR(255), '
//         '  croplosses VARCHAR(255), '
//         '  soilDegredation VARCHAR(255), '
//         '  jobOpportunities VARCHAR(255), '
//         '  Veld VARCHAR(255) '
//         ')');
//     print("successful");
//   } catch (error) {
//     print(error);
//   }
// }
