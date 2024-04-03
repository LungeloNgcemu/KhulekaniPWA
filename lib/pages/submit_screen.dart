import 'package:flutter/material.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:flutter/material.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/providers/provider_answers.dart';
import 'package:provider/provider.dart';
import 'package:khulekani_app/data_base.dart  ';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:khulekani_app/components/table.dart';
import 'package:khulekani_app/providers/clear_function.dart';
import 'package:khulekani_app/providers/ultimate_clear.dart';
import 'package:khulekani_app/providers/saved_pages.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({super.key});

  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  bool isLoading = false;
  /////////////////////////////////////////////////////////////////////////
  Future<void> checkSavedStatus(BuildContext context) async {
    final providerSavedOne = context.read<ProviderSavedOne>();
    final providerSavedTwo = context.read<ProviderSavedTwo>();
    final providerSavedThree = context.read<ProviderSavedThree>();
    final providerSavedFour = context.read<ProviderSavedFour>();
    final providerSavedFive = context.read<ProviderSavedFive>();
    final providerSavedSix = context.read<ProviderSavedSix>();
    final providerSavedSeven = context.read<ProviderSavedSeven>();
    final providerSavedeight = context.read<ProviderSavedEight>();
    final providerSavedNine = context.read<ProviderSavedNine>();

    if (providerSavedOne.one &&
        providerSavedTwo.two &&
        providerSavedThree.three &&
        providerSavedFour.four &&
        providerSavedFive.five &&
        providerSavedSix.six &&
        providerSavedSeven.seven &&
        providerSavedeight.eight &&
        providerSavedNine.nine
    ) {
      print("They are all saved.");

      // Save data
      await insertFull(context);

      // Other functions
      childTable(
        Provider.of<ProviderFortyTwo>(context, listen: false).fortyTwo,
        Provider.of<ProviderEightyFour>(context, listen: false).eightyFour,
      );

// Todo make sure its ten images...
      imageTable(Provider.of<ProviderPictuers>(context, listen: false).pictures, Provider.of<ProviderEightyFour>(context, listen: false).eightyFour);

      // Clear providers
      ultimateClear(context);
      context.read<ProviderSavedOne>().changeValue(newValue: false);
      context.read<ProviderSavedTwo>().changeValue(newValue: false);
      context.read<ProviderSavedThree>().changeValue(newValue: false);
      context.read<ProviderSavedFour>().changeValue(newValue: false);
      context.read<ProviderSavedFive>().changeValue(newValue: false);
      context.read<ProviderSavedSix>().changeValue(newValue: false);
      context.read<ProviderSavedSeven>().changeValue(newValue: false);
      context.read<ProviderSavedEight>().changeValue(newValue: false);
      context.read<ProviderSavedNine>().changeValue(newValue: false);



    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "ALERT",
        desc: "One or more pages are not saved",
        buttons: [
          DialogButton(
            child: Text(
              "Exit",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      print("At least one of them is not saved.");
    }
  }


  ////////////////////////////////////////////////////////////

  void imageTable(images, int id) async {
    final conn = await connectToDatabase();
    try {
      List<dynamic> param = [id, ...images];
      final result1 = await conn.execute(
        r'INSERT INTO "Pictures" ("Information Id",image1,image2, image3, image4, image5, image6, image7, image8, image9, image10)'
        r'VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11)',
        parameters: param,
      );

    } catch (error) {
      print(error);
    }
  }
  ////////////////////////////////////////////////////////
  Future<bool?> insertFull(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    final conn = await connectToDatabase();

    try {

      final List<String> list58 = Provider.of<ProviderFiftyEight>(context, listen: false).fiftyEight;
    final List <String> list71 = Provider.of<ProviderSeventyOne>(context, listen: false).seventyOne;

      final result1 = await conn.execute(
        r'INSERT INTO "Information" ("District Municipality", "Local Municipality", "Ward", "Name of Area/Location (House No./Isigodi)", "Specify street address where possible/applicable", "Ward Councillor", "Ward Councillor Number", "Date of Incident", "Date Reported", "Date Responded", "Time of Incident", "Time Reported", "Time Responded", "Longitude (E)", "Latitude (S)", "Early warning received (Yes/No)", "Type of Incident", "Other Incident", "Cause of Incident", "Other Cause", "Name of Family", "Head of Household", "Identity Number", "Contact Number", "Alternitive Number", "Number of household member(s)", "Senior Citizen (Pensioners)", "Woman", "Men", "Children (under 18 years)", "People with Disability", "Any Injured", "No. of injuries", "Emergency Assistance Required", "Evacuated To", "Mode of Transport", "Any Fatalities", "No. of Fatalities", "Fatalities Confirmed", "Any Scholars Effeccted", "Textbook Damage", "Any Lost Document", "Lost Document Amount", "Items Lost", "No. of structures in a household", "No. of partially damaged structures", "Any Homeless", "No. of Homeless", "Temporal Accomidation", "Other Damages", "No. of Mud house/structure", "No. of shack/ informal settlement structure", "No. of totally destroyed structures", "Number of RDP", "Roof Damages", "structuralDamages", "Essential Services Damaged", "Assistance Issued", "Temporal Shelter", "Soup Kitchen", "Food Parcels", "Tents", "Blankets", "Sponges", "Plastic Sheeting", "Stove", "Pots", "Other", "Type of Intervention", "Infrastructure", "Livestock", "Croplosses", "Soil Degradation", "Job Opportunities", "Veld", "Mattresses", "Repair", "Other Intervention", "Notes", "No. of formal house/structure")'
        r'VALUES (                          $1,                  $2,           $3,      $4,           $5,            $6,                   $7,                $8,           $9,             $10,        $11,            $12,           $13,             $14,                 $15,                 $16,                $17,          $18,           $19,           $20,         $21,           $22,             $23,             $24,            $25,                  $26,                   $27,                    $28,              $29,                     $30,                 $31,            $32,            $33,                   $34,                $35,           $36,            $37,             $38,               $39,                   $40,                $41,           $42,                 $43,                  $44,        $45,                $46,              $47,              $48,                        $49,                $50,         $51,           $52,                  $53,                    $54,           $55,           $56,       $57,      $58,   $59,       $60,$61,$62,$63,$64, $65,$66,$67,$68,$69,$70,$71, $72, $73, $74, $75,  $76, $77, $78, $79, $80 )'
        r'RETURNING "Information Id"',
        parameters: [
          // 'example_row_id',
          Provider.of<ProviderOne>(context, listen: false).one,
          Provider.of<ProviderTwo>(context, listen: false).two,
          Provider.of<ProviderThree>(context, listen: false).three,
          Provider.of<ProviderFour>(context, listen: false).four,
          Provider.of<ProviderFive>(context, listen: false).five,
          Provider.of<ProviderSix>(context, listen: false).six,
          Provider.of<ProviderSeven>(context, listen: false).seven,
          Provider.of<ProviderEight>(context, listen: false).eight,
          Provider.of<ProviderNine>(context, listen: false).nine,
          Provider.of<ProviderTen>(context, listen: false).ten,
          Provider.of<ProviderEleven>(context, listen: false).eleven,
          Provider.of<ProviderTwelve>(context, listen: false).twelve,
          Provider.of<ProviderThirteen>(context, listen: false).thirteen,
          Provider.of<ProviderFourteen>(context, listen: false).fourteen,
          Provider.of<ProviderFifteen>(context, listen: false).fifteen,
          Provider.of<ProviderSixteen>(context, listen: false).sixteen,
          Provider.of<ProviderSeventeen>(context, listen: false).seventeen,
          Provider.of<ProviderEighteen>(context, listen: false).eighteen,
          Provider.of<ProviderNineteen>(context, listen: false).nineteen,
          Provider.of<ProviderTwenty>(context, listen: false).twenty,
          Provider.of<ProviderTwentyOne>(context, listen: false).twentyOne,
          Provider.of<ProviderTwentyTwo>(context, listen: false).twentyTwo,
          Provider.of<ProviderTwentyThree>(context, listen: false).twentyThree,
          Provider.of<ProviderTwentyFour>(context, listen: false).twentyFour,
          Provider.of<ProviderTwentyFive>(context, listen: false).twentyFive,
          Provider.of<ProviderTwentySix>(context, listen: false).twentySix,
          Provider.of<ProviderTwentySeven>(context, listen: false).twentySeven,
          Provider.of<ProviderTwentyEight>(context, listen: false).twentyEight,
          Provider.of<ProviderTwentyNine>(context, listen: false).twentyNine,
          Provider.of<ProviderThirty>(context, listen: false).thirty,
          Provider.of<ProviderThirtyOne>(context, listen: false).thirtyOne,
          Provider.of<ProviderThirtyTwo>(context, listen: false).thirtyTwo,
          Provider.of<ProviderThirtyThree>(context, listen: false).thirtyThree,
          Provider.of<ProviderThirtyFour>(context, listen: false).thirtyFour,
          Provider.of<ProviderThirtyFive>(context, listen: false).thirtyFive,
          Provider.of<ProviderThirtySix>(context, listen: false).thirtySix,
          Provider.of<ProviderThirtySeven>(context, listen: false).thirtySeven,
          Provider.of<ProviderThirtyEight>(context, listen: false).thirtyEight,
          Provider.of<ProviderThirtyNine>(context, listen: false).thirtyNine,
          Provider.of<ProviderForty>(context, listen: false).forty,
          Provider.of<ProviderFortyOne>(context, listen: false).fortyOne,
          // empty table Provider.of<ProviderFortyTwo>(context, listen: false).fortyTwo,
          Provider.of<ProviderFortyThree>(context, listen: false).fortyThree,
          Provider.of<ProviderFortyFour>(context, listen: false).fortyFour,
          Provider.of<ProviderFortyFive>(context, listen: false).fortyFive,
          Provider.of<ProviderFortySix>(context, listen: false).fortySix,
          Provider.of<ProviderFortySeven>(context, listen: false).fortySeven,
          Provider.of<ProviderFortyEight>(context, listen: false).fortyEight,
          Provider.of<ProviderFortyNine>(context, listen: false).fortyNine,
          Provider.of<ProviderFifty>(context, listen: false).fifty,
          Provider.of<ProviderFiftyOne>(context, listen: false).fiftyOne,
          Provider.of<ProviderFiftyTwo>(context, listen: false).fiftyTwo,
          Provider.of<ProviderFiftyThree>(context, listen: false).fiftyThree,
          Provider.of<ProviderFiftyFour>(context, listen: false).fiftyFour,
          Provider.of<ProviderFiftyFive>(context, listen: false).fiftyFive,
          Provider.of<ProviderFiftySix>(context, listen: false).fiftySix,
          Provider.of<ProviderFiftySeven>(context, listen: false).fiftySeven,
          list58,
          // Provider.of<ProviderFiftyEight>(context, listen: false).fiftyEight,
          Provider.of<ProviderFiftyNine>(context, listen: false).fiftyNine,
          Provider.of<ProviderSixty>(context, listen: false).sixty,
          Provider.of<ProviderSixtyOne>(context, listen: false).sixtyOne,
          Provider.of<ProviderSixtyTwo>(context, listen: false).sixtyTwo,
          Provider.of<ProviderSixtyThree>(context, listen: false).sixtyThree,
          Provider.of<ProviderSixtyFour>(context, listen: false).sixtyFour,
          Provider.of<ProviderSixtyFive>(context, listen: false).sixtyFive,
          Provider.of<ProviderSixtySix>(context, listen: false).sixtySix,
          Provider.of<ProviderSixtySeven>(context, listen: false).sixtySeven,
          // Provider
          //     .of<ProviderSixtyEight>(context, listen: false)
          //     .sixtyEight,
          Provider.of<ProviderSixtyNine>(context, listen: false).sixtyNine,
          Provider.of<ProviderSeventy>(context, listen: false).seventy,
          list71,
          // Provider.of<ProviderSeventyOne>(context, listen: false).seventyOne,
          Provider.of<ProviderSeventyTwo>(context, listen: false).seventyTwo,
          Provider.of<ProviderSeventyThree>(context, listen: false)
              .seventyThree,
          Provider.of<ProviderSeventyFour>(context, listen: false).seventyFour,
          Provider.of<ProviderSeventyFive>(context, listen: false).seventyFive,
          Provider.of<ProviderSeventySix>(context, listen: false).seventySix,
          Provider.of<ProviderSeventySeven>(context, listen: false)
              .seventySeven,
          /////////////////////////////////////////////////////////
          Provider.of<ProviderEightyOne>(context, listen: false).eightyOne,
          Provider.of<ProviderEightyTwo>(context, listen: false).eightyTwo,
          Provider.of<ProviderEightyThree>(context, listen: false).eightyThree,
//////////////////////////////////////////////////////////////
          Provider.of<ProviderNotes>(context, listen: false).notes,
          Provider.of<ProviderEighty>(context, listen: false).eighty,


          /// added 77 then the 81 82 83
        ],
      );

      print(result1[0][0]);

      void updateInt() {
        context.read<ProviderEightyFour>().changeValue(newValue: result1[0][0]);
      }

      updateInt();

      conn.close();

      setState(() {
        isLoading = false;
      });

      return Alert(
        context: context,
        type: AlertType.success,
        title: "Well Done",
        desc: "Succesfull post",
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
      print("Done");
    } catch (error) {
      setState(() {
        isLoading = false;
      });

      print(error);
      return Alert(
        context: context,
        type: AlertType.error,
        title: "ALERT",
        desc: "Something Went Wrong proberly network : ${error}",
        buttons: [
          DialogButton(
            child: Text(
              "Exit",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
  }
  /////////////////////////////////////////////////////////
  //data in dataBase.skip(1)
  void childTable(dataBase, int id) async {
    final conn = await connectToDatabase();
    try {
      for (List<dynamic> data in dataBase) {
        final result1 = await conn.execute(
          r'INSERT INTO "Children" ("Information Id", "Name", "Birthdate", "Gender", "Age", "School", "Grade", "Shoe Size", "Uniform Size", "Additional Information")'
          r'VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)',
          parameters: [
            id,
            data[0],
            data[1],
            data[2],
            data[3],
            data[4],
            data[5],
            data[6],
            data[7],
            data[8]
          ],
        );
      }
      print("Done");
      conn.close();
    } catch (error) {
      print(error);
    }
  }

  //////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        HeaderBlue(
          text: 'Submit',
        ),
        Container(
          height: h * 0.75,
         // color: Colors.redAccent,
          child: SaveButton(
            text: 'Submit',
            onPressed: (){
              checkSavedStatus(context);
            },
          ),
        ),
      ],
    );
  }
}
