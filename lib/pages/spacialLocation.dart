import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:khulekani_app/list/lists.dart' as collect;
import 'package:khulekani_app/components/drop_down.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/components/menu_list.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:postgres/postgres.dart';
import 'package:khulekani_app/data_base.dart';
import 'package:provider/provider.dart';
import 'package:khulekani_app/providers/provider_answers.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:khulekani_app/providers/clear_function.dart';
import 'package:khulekani_app/providers/saved_pages.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:khulekani_app/create_table.dart';


//TODO is saved logo
class SpacialLocationPage extends StatefulWidget {
  const SpacialLocationPage({super.key});

  @override
  State<SpacialLocationPage> createState() => _SpacialLocationPageState();
}

class _SpacialLocationPageState extends State<SpacialLocationPage>
    with AutomaticKeepAliveClientMixin {
  //////////////////////////////////////////
  static const apiKey = 'a8e5d16218e64e879c5e1b78f9baa70e';

  Future<Map<String, double>> getLocationb() async {
    try {
      ////////////////////////////////////////////////////////////////////////

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          // Handle the case where the user denies location permissions.
          print('Location permission not granted');
          return {'latitude': 0.0, 'longitude': 0.0};
        }
      }

      ////////////////////////////////////////////////////////////////////////////
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      );

      double latitude = position.latitude;
      double longitude = position.longitude;

      // final response = await http.get(
      //   Uri.parse(
      //     'https://api.opencagedata.com/geocode/v1/json?q=$latitude%2C$longitude&key=$apiKey',
      //   ),
      // );
      //
      // if (response.statusCode == 200) {
      //   Map<String, dynamic> data = json.decode(response.body);
      //
      //   // Extracting latitude and longitude
      //   double lat = data['results'][0]['geometry']['lat'];
      //   double lng = data['results'][0]['geometry']['lng'];

      setState(() {
        // Update your state variables here with lat and lng
        context.read<ProviderFourteen>().changeValue(
            newValue: longitude.toString());
        context.read<ProviderFifteen>().changeValue(
            newValue: latitude.toString());
      });

      print('Latitude: $latitude, Longitude: $longitude');

      return {'latitude': latitude, 'longitude': longitude};
    } catch (e) {
      print('Error getting current location: $e');
      return {
        'latitude': 0.0,
        'longitude': 0.0
      }; // Return a default value or handle the error accordingly
    }
  }

////////////////////////////////////////////
  bool isSaved = false;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String? formattedTime;
  String? date;
  String? formattedTime1;
  String? formattedTime2;
  String? formattedTime3;
  String? date1;
  String? date2;
  String? date3;
  String? selectedValue1;
  String? selectedValue2 = collect.yesOrNo[1];
  String? selectedValue3;

  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();
  TextEditingController controllerC = TextEditingController();
  TextEditingController controllerD = TextEditingController();
  TextEditingController controllerE = TextEditingController();
  TextEditingController controllerF = TextEditingController();
  TextEditingController controllerG = TextEditingController();

  String answerA = "";
  String answerB = "";
  String answerC = "";
  String answerD = "";
  String answerE = "";
  String answerF = "";
  String answerG = "";

  void clear1() {
    controllerA.clear();
    controllerB.clear();
    controllerC.clear();
    controllerD.clear();
    controllerE.clear();
    controllerF.clear();
    controllerG.clear();
    print("cleared 1");
  }


  // void inputFunction() {
  //   context.read<ProviderClear1>().setMyFunction(newFunction: clear1);
  // }


  // void insert20(BuildContext context)async{
  //   final conn = await connectToDatabase();
  //   final result1 = await conn.execute(
  //     r'INSERT INTO wwinformation (districtMunicipality, localMunicipality, ward, areaLocation, streetAddress, wardCouncillor, wardCouncillorNumber, dateOfIncident, dateReported, dateResponded, timeOfIncident, timeReported, timeResponded, gpsCoordinatesLong, gpsCoordinatesLatt, earlyWarningReceived, typeOfIncident, otherIncident, causeOfIncident, otherCause, nameofFamily, headOfHousehold, identityNumber, contactNumber, alternitiveNumber, numberOfHouseholdMembers, numberOfPensioners, numberOfWomanEffected, numberOfMenEffected, numberOfChildrenEffected, numberOfDisabled, anyInjured, numberOfInjuries, emergencyAssistanceRequired, evacuatade, modeofTransport, anyFatalities, numberOfFatalities, fatalitiesConfirmed, anyScholarsEffeccted, textbookDamage, anyLostDocument, lostDocumentAmount,       anyHomeless, numberOfHomeless, temporalAccomidation, otherDamages, numberOfMudHouseStructures, numberOfShackStructures, numberOfRDP, roofDamages, structuralDamages, essentialServicesDamaged, assitanceIssued, TempShelter, soupKitchen, foodParcels, tents, blankets, sponges, plasticSheeting, stove, pots, Other, typeOfIntervention, infrastructure, livestock, croplosses, soilDegredation, jobOpportunities, Veld)'
  //     r'VALUES (                          $1,                  $2,           $3,      $4,           $5,            $6,                   $7,                $8,           $9,             $10,        $11,            $12,           $13,             $14,                 $15,                 $16,                $17,          $18,           $19,           $20,         $21,           $22,             $23,             $24,            $25,                  $26,                   $27,                    $28,              $29,                     $30,                 $31,            $32,            $33,                   $34,                $35,           $36,            $37,             $38,               $39,                   $40,                $41,           $42,                 $43,                  $44,        $45,                $46,              $47,              $48,                        $49,                $50,         $51,           $52,                  $53,                    $54,           $55,           $56,       $57,      $58,   $59,       $60,         $61,       $62,  $63,    $64,        $65,             $66,            $67,       $68,           $69,             $70,        $71 )',
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
  //       Provider.of<ProviderFortyTwo>(context, listen: false).fortyTwo,
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
  //       Provider.of<ProviderSeventyOne>(context, listen: false).seventyOne
  //       // Provider.of<ProviderSeventyTwo>(context, listen: false).seventyTwo,
  //       // Provider.of<ProviderSeventyThree>(context, listen: false).seventyThree,
  //       // Provider.of<ProviderSeventyFour>(context, listen: false).seventyFour,
  //       // Provider.of<ProviderSeventyFive>(context, listen: false).seventyFive,
  //       // Provider.of<ProviderSeventySix>(context, listen: false).seventySix,
  //       // Provider.of<ProviderSeventySeven>(context, listen: false).seventySeven
  //     ],
  //   );
  // }

  Future<String?> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        // Specify Widget? as the return type
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        formattedTime = pickedTime.format(context);
      });
      return formattedTime;
    }
  }

  Future<String?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        date = formattedDate;
      });
      return date;
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    //LocationPermission permission = await Geolocator.requestPermission();

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
      forceAndroidLocationManager: true,
      desiredAccuracy: LocationAccuracy.bestForNavigation,);
  }

  // void postgressUpload() async {
  //   final conn = await connectToDatabase();
  //   await conn.execute('CREATE TABLE Cars ('
  //       '  id TEXT NOT NULL, '
  //       '  totals INTEGER NOT NULL DEFAULT 0'
  //       ')');
  // }
  //
  // void postgressInsert() async {
  //   final conn = await connectToDatabase();
  //   final result1 = await conn.execute(
  //     r'INSERT INTO Cars (id,totals) VALUES ($1,$2)',
  //     parameters: ['rabit', '2'],
  //   );
  //   print('Inserted ${result1.affectedRows} rows');
  // }



  @override
  bool get wantKeepAlive => true;

  Widget build(BuildContext context) {
    // controllerA.text = "Zululand District Municipality";
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          HeaderBlue(
            text: "SPATIAL LOCATION",
          ),
          const Padding(
            padding: EdgeInsets.only(top: 1.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          SubTitle(
            title: "Details",
          ),

          QuestionTextStrip(
            text: "1. District municipality:",
            controller: controllerA,
          ),
          // QuestionTextStrip(
          //   text: "1.2. Local municipality: ",
          //   controller: controllerB,
          // ),

        
          ///////////////////////////////////////////////////////////
          MenuList(
            choice: context
                .watch<ProviderTwo>()
                .two ?? "",
            selectedValue: '',
            listName: collect.municipality,
            text:  "1.2. Local municipality: ",
            onChanged: (String? value) {
              setState(() {
                selectedValue3 = value;
                context
                    .read<ProviderTwo>()
                    .changeValue(newValue: selectedValue3!);
              });
              print(selectedValue3);
            },
          ),
          /////////////////////////////////////////////////////
          QuestionTextStrip(
            text: "1.3. Municipal ward number:",
            controller: controllerC,
          ),
          QuestionTextStrip(
            text:
            "1.4. Name of the area (Isigodi) where the incident occurred:",
            controller: controllerD,
          ),
          QuestionTextStrip(
            text: "1.5. Specify street address where possible:",
            controller: controllerE,
          ),
          QuestionTextStrip(
            text: "1.6. Name of the ward councillor:",
            controller: controllerF,
          ),
          QuestionTextStrip(
            text: "1.7. Contact number of the ward councillor",
            controller: controllerG,
          ),

          ////seven

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(),
          ),
          SubTitle(
            title: "1.8 Date and Time",
          ),
          MuliDateTime(
            textTime: context
                .watch<ProviderEight>()
                .eight ?? "",
            text: "A) Date of the incident",
            call: () async {
              String? datenow = await _selectDate(context);
              setState(() {
                context.read<ProviderEight>().changeValue(newValue: datenow!);
              });

              // Use formattedTime here or update the MuliDateTime widget
              // based on the selected time
            },
          ),
          MuliDateTime(
            textTime: context
                .watch<ProviderNine>()
                .nine ?? "",
            text: "B) Date of reporting",
            call: () async {
              String? datenow = await _selectDate(context);
              setState(() {
                context.read<ProviderNine>().changeValue(newValue: datenow!);
              });

              // Use formattedTime here or update the MuliDateTime widget
              // based on the selected time
            },
          ),
          MuliDateTime(
            textTime: context
                .watch<ProviderTen>()
                .ten ?? "",
            text: "C) Actual date of response",
            call: () async {
              String? datenow = await _selectDate(context);
              setState(() {
                context.read<ProviderTen>().changeValue(newValue: datenow!);
              });

              // Use formattedTime here or update the MuliDateTime widget
              // based on the selected time
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          MuliDateTime(
            textTime: context
                .watch<ProviderEleven>()
                .eleven ?? "",
            text: "D) Time of the incident",
            call: () async {
              String? time = await _selectTime(context);
              setState(() {
                context.read<ProviderEleven>().changeValue(newValue: time!);
              });

              // Use formattedTime here or update the MuliDateTime widget
              // based on the selected time
            },
          ),
          MuliDateTime(
            textTime: context
                .watch<ProviderTwelve>()
                .twelve ?? "",
            text: "E) Time of the reporting",
            call: () async {
              String? time = await _selectTime(context);
              setState(() {
                context.read<ProviderTwelve>().changeValue(newValue: time!);
              });

              // Use formattedTime here or update the MuliDateTime widget
              // based on the selected time
            },
          ),
          MuliDateTime(
            textTime: context
                .watch<ProviderThirteen>()
                .thirteen ?? "",
            text: "F) Actual time of response",
            call: () async {
              String? time = await _selectTime(context);
              setState(() {
                context.read<ProviderThirteen>().changeValue(newValue: time!);
              });

              // Use formattedTime here or update the MuliDateTime widget
              // based on the selected time

              //TODO 14 and 15 for gps
            },
          ),
          SubTitle(
            title: "1.9 Location",
          ),
          Locator(
            text:
            "${context
                .watch<ProviderFourteen>()
                .fourteen} ${context
                .read<ProviderFifteen>()
                .fifteen}",
            buttonText: "1.9 Get current GPS Location",
            get: () async {
              // final location = await _determinePosition();
              // print(location);
              print('Pressed');
              getLocationb();
              //   context
              //       .read<ProviderFourteen>()
              //       .changeValue(newValue: location!.toString());
              //   context
              //       .read<ProviderFifteen>()
              //       .changeValue(newValue: location!.toString());
              //   print(location);
            },
          ),
          MenuList(
            choice: context
                .watch<ProviderSixteen>()
                .sixteen ?? "",
            selectedValue: "",
            listName: collect.yesOrNo,
            text: "1.10 Early warning received: Yes/No",
            onChanged: (String? value) {
              setState(() {
                selectedValue1 = value;
                context
                    .read<ProviderSixteen>()
                    .changeValue(newValue: selectedValue1!);
              });
              print(selectedValue1);
            },
          ),

          SaveButton(
            color: context.watch<ProviderSavedOne>().one == false ? Colors.red : Colors.green[500],
            onPressed: () {
              context.read<ProviderClear1>().setMyFunction(newFunction: clear1);
              context.read<ProviderSavedOne>().changeValue(newValue: true);
              Future<bool?> saveData() {
                setState(() {
                  isSaved = true;
                });
                context
                    .read<ProviderOne>()
                    .changeValue(newValue: controllerA.text);
                // context
                //     .read<ProviderTwo>()
                //     .changeValue(newValue: controllerB.text);
                context
                    .read<ProviderThree>()
                    .changeValue(newValue: controllerC.text);
                context
                    .read<ProviderFour>()
                    .changeValue(newValue: controllerD.text);
                context
                    .read<ProviderFive>()
                    .changeValue(newValue: controllerE.text);
                context
                    .read<ProviderSix>()
                    .changeValue(newValue: controllerF.text);
                context
                    .read<ProviderSeven>()
                    .changeValue(newValue: controllerG.text);
                //  print('here : ${context.watch<ProviderOne>(listen: false).one}');
                print(
                    'ProviderOne value: ${Provider
                        .of<ProviderOne>(context, listen: false)
                        .one}');

                return Alert(
                  context: context,
                  type: AlertType.success,
                  title: "Saved",
                  desc: "Your Data has been Saved.",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ],
                ).show();
              }
              saveData();
            },

          ),
        ],
      ),
    );
  }
}

class MuliDateTime extends StatefulWidget {
  MuliDateTime({this.text, this.call, this.textTime, super.key});

  String? text;
  VoidCallback? call;
  String? textTime;

  @override
  State<MuliDateTime> createState() => _MuliDateTimeState();
}

class _MuliDateTimeState extends State<MuliDateTime> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 80.0,
        color: Colors.grey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.text ?? "",
                  // Use null-aware operator to provide an empty string if text is null
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MaterialButton(
                  child: Text(
                    widget.textTime ?? "",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.grey[300],
                  onPressed: widget.call! ?? () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Locator extends StatefulWidget {
  Locator({this.text, this.buttonText, this.get, key});

  String? text;
  String? buttonText;
  VoidCallback? get;

  @override
  State<Locator> createState() => _LocatorState();
}

class _LocatorState extends State<Locator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 80.0,
        color: Colors.grey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MaterialButton(
                  color: Colors.grey[300],
                  onPressed: widget.get ?? () {},
                  child: Text(
                    widget.buttonText ?? "",
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.text ?? "",
                      style: const TextStyle(
                          fontSize: 20.0, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
