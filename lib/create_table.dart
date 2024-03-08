import 'package:flutter/material.dart';
import 'data_base.dart';
import 'providers/provider_answers.dart';
import 'package:khulekani_app/providers/provider_answers.dart';

// await conn.execute('CREATE TABLE IF NOT EXISTS information ('
// '  id INT PRIMARY KEY AUTO_INCREMENT, '
//
// '  districtMunicipality VARCHAR(255), '
//
// '  localMunicipality VARCHAR(255), '
//
// '  ward VARCHAR(255), '
//
// '  areaLocation VARCHAR(255), '
//
// '  streetAddress VARCHAR(255), '
//
// '  wardCouncillor VARCHAR(255), '
//
// '  wardCouncillorNumber VARCHAR(255), '
//
//
//
// '  dateOfIncident DATE, '
// '  dateReported DATE, '
// '  dateResponded DATE, '
//
// '  timeOfIncident TIME, '
// '  timeReported TIME, '
// '  timeResponded TIME, '
//
// '  gpsCoordinates VARCHAR(255), '
// '  gpsCoordinates VARCHAR(255), '
//
// '  earlyWarningReceived VARCHAR(3), '
//
// '  typeOfIncident VARCHAR(255), '
// '  otherIncident VARCHAR(255), '
// '  causeOfIncident VARCHAR(255), '
// '  otherCause VARCHAR(255), '
//
//
//
// '  nameofFamily VARCHAR(255), '
//
// '  headOfHousehold VARCHAR(255), '
//
// '  identityNumber VARCHAR(20), '
// '  contactNumber VARCHAR(20), '
// '  alternitiveNumber VARCHAR(20), '
//
// '  numberOfHouseholdMembers INT, '
//
// '  numberOfPensioners INT, '
// '  numberOfWomanEffected INT, '
// '  numberOfMen effected INT, '
// '  numberOfChildrenEffected INT, '
// '  numberOfDisabled INT, '
//
// '  anyInjured VARCHAR(20), '
//
// '  numberOfInjuries INT, '
//
// '  emergencyAssistanceRequired VARCHAR(20), '
//
// '  evacuatade VARCHAR(20), '
//
// '  modeofTransport VARCHAR(20), '
//
// '  anyFatalities VARCHAR(20), '
//
// '  numberOfFatalities INT, '
//
// '  fatalitiesConfirmed VARCHAR(20), '
//
// '  anyScholarsEffeccted VARCHAR(20), '
//
// '  textbookDamage VARCHAR(20), '
//
// '  anyLostDocument VARCHAR(20), '
//
// '  lostDocumentAmount VARCHAR(20), '
//
// '  numberOfStructuresInHousehold INT, '
//
// '  numberOfPartiallyDamagedStructures INT, '
//
// '  anyHomeless VARCHAR(20), '
// '  numberOfHomeless INT, '
//
// '  temporalAccomidation VARCHAR(20), '
//
// '  otherDamages VARCHAR(20), '
//
// '  numberOfMudHouseStructures INT, '
//
// '  numberOfShackStructures INT, '
//
// '  numberOfRDP INT, '
//
// '  roofDamages VARCHAR(20), '
//
// '  structuralDamages VARCHAR(20), '
//
// '  essentialServicesDamaged VARCHAR(20), '
//
// '  assitanceIssued VARCHAR(20), '
//
// '  TempShelter VARCHAR(20), '
//
// '  soupKitchen VARCHAR(20), '
//
// '  foodParcels INT, '
//
// '  tents INT, '
//
// '  blankets INT, '
//
// '  sponges INT, '
//
// '  plasticSheeting INT, '
//
// '  stove INT, '
//
// '  pots INT, '
//
// '  Other VARCHAR(255), '
//
// '  typeOfIntervention VARCHAR(255), '
//
// '  infrastructure VARCHAR(255), '
//
// '  livestock VARCHAR(255), '
//
// '  croplosses VARCHAR(255), '
//
// '  soilDegredation VARCHAR(255), '
//
// '  jobOpportunities VARCHAR(255), '
//
// '  Veld VARCHAR(255), '
//
// ')');

void createBigTable() async {
  final conn = await connectToDatabase();

  try {
    await conn.execute('CREATE TABLE IF NOT EXISTS wwinformation ('
        '   id SERIAL PRIMARY KEY, '
        '  districtMunicipality VARCHAR(255), '
        '  localMunicipality VARCHAR(255), '
        '  ward VARCHAR(255), '
        '  areaLocation VARCHAR(255), '
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
        '  evacuatade VARCHAR(255), '
        '  modeofTransport VARCHAR(255), '
        '  anyFatalities VARCHAR(255), '
        '  numberOfFatalities VARCHAR(255), '
        '  fatalitiesConfirmed VARCHAR(255), '
        '  anyScholarsEffeccted VARCHAR(255), '
        '  textbookDamage VARCHAR(255), '
        '  anyLostDocument VARCHAR(255), '
        '  lostDocumentAmount VARCHAR(255), '
        '  numberOfStructuresInHousehold VARCHAR(255), '
        '  numberOfPartiallyDamagedStructures VARCHAR(255), '
        '  anyHomeless VARCHAR(255), '
        '  numberOfHomeless VARCHAR(255), '
        '  temporalAccomidation VARCHAR(255), '
        '  otherDamages VARCHAR(255), '
        '  numberOfMudHouseStructures VARCHAR(255), '
        '  numberOfShackStructures VARCHAR(255), '
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












// void insert20(context)async{
//   final conn = await connectToDatabase();
//   final result1 = await conn.execute(
//   r'INSERT INTO wwinformation (districtMunicipality, localMunicipality, ward, areaLocation, streetAddress, wardCouncillor, wardCouncillorNumber, dateOfIncident, dateReported, dateResponded, timeOfIncident, timeReported, timeResponded, gpsCoordinatesLong, gpsCoordinatesLatt, earlyWarningReceived, typeOfIncident, otherIncident, causeOfIncident, otherCause)'
//   r'VALUES (                          $1,                  $2,           $3,      $4,           $5,            $6,                   $7,                $8,           $9,             $10,        $11,            $12,           $13,             $14,                 $15,                 $16,                $17,          $18,           $19,           $20)',
//     parameters: [
//     // 'example_row_id',
//     context.watch<ProviderOne>().one,
//     'LocalValue',
//     'WardValue',
//     'AreaLocationValue',
//     'StreetAddressValue',
//     'WardCouncillorValue',
//     'WardCouncillorNumberValue',
//     '2024-01-25',
//     '2024-01-26',
//     '2024-01-27',
//     '12:30:00',
//     '13:45:00',
//     '14:30:00',
//     'GPS_Coordinates_Long_Value',
//     'GPS_Coordinates_Latt_Value',
//     'Yes',
//     'TypeOfIncidentValue',
//     'OtherIncidentValue',
//     'CauseOfIncidentValue',
//     'OtherCauseValue'
//     ],
//   );
// }

void insert40()async {

  final conn = await connectToDatabase();
  final result1 = await conn.execute(
  r'INSERT INTO wwinformation ( otherCause, nameofFamily, headOfHousehold, identityNumber, contactNumber, alternitiveNumber, numberOfHouseholdMembers, numberOfPensioners, numberOfWomanEffected, numberOfMenEffected, numberOfChildrenEffected, numberOfDisabled, anyInjured, numberOfInjuries, emergencyAssistanceRequired, evacuatade, modeofTransport, anyFatalities, numberOfFatalities, fatalitiesConfirmed, anyScholarsEffeccted)'
  r'VALUES (                          $1,                  $2,           $3,      $4,           $5,            $6,                   $7,                $8,           $9,             $10,        $11,            $12,           $13,             $14,                 $15,                 $16,                $17,          $18,           $19,           $20)',
    parameters: [
      // 'example_row_id',
      'DistrictValue',
      'LocalValue',
      'WardValue',
      'AreaLocationValue',
      'StreetAddressValue',
      'WardCouncillorValue',
      'WardCouncillorNumberValue',
      '2024-01-25',
      '2024-01-26',
      '2024-01-27',
      '12:30:00',
      '13:45:00',
      '14:30:00',
      'GPS_Coordinates_Long_Value',
      'GPS_Coordinates_Latt_Value',
      'Yes',
      'TypeOfIncidentValue',
      'OtherIncidentValue',
      'CauseOfIncidentValue',
      'OtherCauseValue'
    ],
  );

}




void insertBig() async {
  final conn = await connectToDatabase();
  final result1 = await conn.execute(
    r'INSERT INTO mminformation (districtMunicipality, localMunicipality, ward, areaLocation, streetAddress, wardCouncillor, wardCouncillorNumber, dateOfIncident, dateReported, dateResponded, timeOfIncident, timeReported, timeResponded, gpsCoordinatesLong, gpsCoordinatesLatt, earlyWarningReceived, typeOfIncident, otherIncident, causeOfIncident, otherCause, nameofFamily, headOfHousehold, identityNumber, contactNumber, alternitiveNumber, numberOfHouseholdMembers, numberOfPensioners, numberOfWomanEffected, numberOfMenEffected, numberOfChildrenEffected, numberOfDisabled, anyInjured, numberOfInjuries, emergencyAssistanceRequired, evacuatade, modeofTransport, anyFatalities, numberOfFatalities, fatalitiesConfirmed, anyScholarsEffeccted, textbookDamage, anyLostDocument, lostDocumentAmount, ,  anyHomeless, numberOfHomeless, temporalAccomidation, otherDamages, numberOfMudHouseStructures, numberOfShackStructures, numberOfRDP, roofDamages, structuralDamages, essentialServicesDamaged, assitanceIssued, TempShelter, soupKitchen, foodParcels, tents, blankets, sponges, plasticSheeting, stove, pots, Other, typeOfIntervention, infrastructure, livestock, croplosses, soilDegredation, jobOpportunities, Veld)'
    r'VALUES (                          $1,                  $2,           $3,      $4,           $5,            $6,                   $7,                $8,           $9,             $10,        $11,            $12,           $13,             $14,                 $15,                 $16,                $17,          $18,           $19,           $20,         $21,           $22,             $23,             $24,            $25,                  $26,                   $27,                    $28,              $29,                     $30,                 $31,            $32,            $33,                   $34,                $35,           $36,            $37,             $38,               $39,                   $40,                $41,           $42,                 $43,                  $44,        $45,                $46,              $47,              $48,                        $49,                $50,         $51,           $52,                  $53,                    $54,           $55,           $56,       $57,      $58,   $59,       $60,         $61,       $62,  $63,    $64,        $65,             $66,            $67,       $68,           $69,             $70,        $71 )',
    parameters: [
      // 'example_row_id',
      'DistrictValue',
      'LocalValue',
      'WardValue',
      'AreaLocationValue',
      'StreetAddressValue',
      'WardCouncillorValue',
      'WardCouncillorNumberValue',
      '2024-01-25',
      '2024-01-26',
      '2024-01-27',
      '12:30:00',
      '13:45:00',
      '14:30:00',
      'GPS_Coordinates_Long_Value',
      'GPS_Coordinates_Latt_Value',
      'Yes',
      'TypeOfIncidentValue',
      'OtherIncidentValue',
      'CauseOfIncidentValue',
      'OtherCauseValue',
      'NameOfFamilyValue',
      'HeadOfHouseholdValue',
      'IdentityNumberValue',
      'ContactNumberValue',
      'AlternitiveNumberValue',
      5,
      2,
      3,
      5,
      1,
      4,
      'Yes',
      2,
      'EmergencyAssistanceRequiredValue',
      'EvacuatadeValue',
      'ModeOfTransportValue',
      'Yes',
      2,
      'Yes',
      'TextbookDamageValue',
      'Yes',
      'LostDocumentAmountValue',
      3,
      1,
      'Yes',
      4,
      'TemporalAccomidationValue',
      'Yes',
      2,
      3,
      'Yes',
      4,
      5,
      2,
      3,
      1,
      4,
      5,
      2,
      3,
      1,
      4,
      5,
      2,
      3,
      1,
      4,
      5,
      2
    ],
  );
}




// void insertBig() async {
//   final conn = await connectToDatabase();
//   final result1 = await conn.execute(
//     r'INSERT INTO mminformation (districtMunicipality, localMunicipality, ward, areaLocation, streetAddress, wardCouncillor, wardCouncillorNumber, dateOfIncident, dateReported, dateResponded, timeOfIncident, timeReported, timeResponded, gpsCoordinatesLong, gpsCoordinatesLatt, earlyWarningReceived, typeOfIncident, otherIncident, causeOfIncident, otherCause, nameofFamily, headOfHousehold, identityNumber, contactNumber, alternitiveNumber, numberOfHouseholdMembers, numberOfPensioners, numberOfWomanEffected, numberOfMenEffected, numberOfChildrenEffected, numberOfDisabled, anyInjured, numberOfInjuries, emergencyAssistanceRequired, evacuatade, modeofTransport, anyFatalities, numberOfFatalities, fatalitiesConfirmed, anyScholarsEffeccted, textbookDamage, anyLostDocument, lostDocumentAmount, ,  anyHomeless, numberOfHomeless, temporalAccomidation, otherDamages, numberOfMudHouseStructures, numberOfShackStructures, numberOfRDP, roofDamages, structuralDamages, essentialServicesDamaged, assitanceIssued, TempShelter, soupKitchen, foodParcels, tents, blankets, sponges, plasticSheeting, stove, pots, Other, typeOfIntervention, infrastructure, livestock, croplosses, soilDegredation, jobOpportunities, Veld)'
//     r'VALUES (                          $1,                  $2,           $3,      $4,           $5,            $6,                   $7,                $8,           $9,             $10,        $11,            $12,           $13,             $14,                 $15,                 $16,                $17,          $18,           $19,           $20,         $21,           $22,             $23,             $24,            $25,                  $26,                   $27,                    $28,              $29,                     $30,                 $31,            $32,            $33,                   $34,                $35,           $36,            $37,             $38,               $39,                   $40,                $41,           $42,                 $43,                  $44,        $45,                $46,              $47,              $48,                        $49,                $50,         $51,           $52,                  $53,                    $54,           $55,           $56,       $57,      $58,   $59,       $60,         $61,       $62,  $63,    $64,        $65,             $66,            $67,       $68,           $69,             $70,        $71 )',
//     parameters: [
//       // 'example_row_id',
//       'DistrictValue',
//       'LocalValue',
//       'WardValue',
//       'AreaLocationValue',
//       'StreetAddressValue',
//       'WardCouncillorValue',
//       'WardCouncillorNumberValue',
//       '2024-01-25',
//       '2024-01-26',
//       '2024-01-27',
//       '12:30:00',
//       '13:45:00',
//       '14:30:00',
//       'GPS_Coordinates_Long_Value',
//       'GPS_Coordinates_Latt_Value',
//       'Yes',
//       'TypeOfIncidentValue',
//       'OtherIncidentValue',
//       'CauseOfIncidentValue',
//       'OtherCauseValue',
//       'NameOfFamilyValue',
//       'HeadOfHouseholdValue',
//       'IdentityNumberValue',
//       'ContactNumberValue',
//       'AlternitiveNumberValue',
//       5,
//       2,
//       3,
//       5,
//       1,
//       4,
//       'Yes',
//       2,
//       'EmergencyAssistanceRequiredValue',
//       'EvacuatadeValue',
//       'ModeOfTransportValue',
//       'Yes',
//       2,
//       'Yes',
//       'TextbookDamageValue',
//       'Yes',
//       'LostDocumentAmountValue',
//       3,
//       1,
//       'Yes',
//       4,
//       'TemporalAccomidationValue',
//       'Yes',
//       2,
//       3,
//       'Yes',
//       4,
//       5,
//       2,
//       3,
//       1,
//       4,
//       5,
//       2,
//       3,
//       1,
//       4,
//       5,
//       2,
//       3,
//       1,
//       4,
//       5,
//       2
//     ],
//   );
// }
