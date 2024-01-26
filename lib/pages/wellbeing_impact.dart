import 'package:flutter/material.dart';
import 'package:khulekani_app/components/menu_list.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:khulekani_app/list/lists.dart' as collection;
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/provider_answers.dart';
import '../components/table.dart' as fun;
import 'package:khulekani_app/provider_answers.dart';
import 'package:provider/provider.dart';

class WellbeingImpact extends StatefulWidget {
  const WellbeingImpact({super.key});

  @override
  State<WellbeingImpact> createState() => _WellbeingImpactState();
}

class _WellbeingImpactState extends State<WellbeingImpact> {
  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;
  String? selectedValue5;
  String? selectedValue6;
  String? selectedValue7;
  String? selectedValue8;
  String? selectedValue9;
  String? selectedValue10;
  String? selectedValue11;
  String? selectedValue12;
  String? selectedValue13;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          HeaderBlue(
            text: "WELL-BEING IMPACT ON THE HOUSEHOLD MEMBERS",
          ),
          Divider(
            color: Colors.black,
          ),
          SubTitle(
            title: "4.1  WELLBEING IMPACT ON THE HOUSEHOLD ",
          ),
          MenuList(
            // On the end
            choice: selectedValue1 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderThirtyTwo>() .thirtyTwo ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.yesOrNo,
            text: "A) Were there any injuries?",
            //

            // provider 32
            onChanged: (String? value) {
              setState(() {
                selectedValue1 = value;
                context.read<ProviderThirtyTwo>().changeValue(newValue: selectedValue1!);

                if (selectedValue1 == "select") {
                  selectedValue1 = "nothing";
                }
              });
              print(selectedValue1);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue2 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderThirtyThree>().thirtyThree ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "B) If yes, number of injuries",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue2 = value;
                context.read<ProviderThirtyThree>().changeValue(newValue: selectedValue2!);

                if (selectedValue2 == "select") {
                  selectedValue2 = "nothing";
                }
              });
              print(selectedValue2);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue3 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderThirtyFour>().thirtyFour ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.yesOrNo,
            text: "C) Was emergency assistance required",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue3 = value;
                context.read<ProviderThirtyFour>().changeValue(newValue: selectedValue3!);

                if (selectedValue3 == "select") {
                  selectedValue3 = "nothing";
                }
              });
              print(selectedValue3);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue4 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderThirtyFive>().thirtyFive ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.injuredEvacuated,
            text: "D) If yes, where were injuries evacuated to?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue4 = value;
                context.read<ProviderThirtyFive>().changeValue(newValue: selectedValue4!);

                if (selectedValue4 == "select") {
                  selectedValue4 = "nothing";
                }
              });
              print(selectedValue4);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue5 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderThirtySix>().thirtySix ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.transportForInjured,
            text: "E) What mode of transport the injured transported by?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue5 = value;
                context.read<ProviderThirtySix>().changeValue(newValue: selectedValue5!);

                if (selectedValue5 == "select") {
                  selectedValue5 = "nothing";
                }
              });
              print(selectedValue5);
            },
          ),



          // section off here
SubTitle(
  title: "4.2 WELLBEING IMPACT ON THE HOUSEHOLD",
),
          MenuList(
            // On the end
            choice: selectedValue6 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderThirtySeven>().thirtySeven ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.yesOrNo,
            text: "A) Were there any fatalities?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue6 = value;
                context.read<ProviderThirtySeven>().changeValue(newValue: selectedValue6!);

                if (selectedValue6 == "select") {
                  selectedValue6 = "nothing";
                }
              });
              print(selectedValue6);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue7 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderThirtyEight>().thirtyEight ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "B) If yes, number of fatalities",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue7 = value;
                context.read<ProviderThirtyEight>().changeValue(newValue: selectedValue7!);

                if (selectedValue7 == "select") {
                  selectedValue6 = "nothing";
                }
              });
              print(selectedValue7);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue8 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderThirtyNine>().thirtyNine ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.yesOrNo,
            text: "C) Were fatalities confirmed & certified by SAPS?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue8 = value;
                context.read<ProviderThirtyNine>().changeValue(newValue: selectedValue8!);

                if (selectedValue8 == "select") {
                  selectedValue8 = "nothing";
                }
              });
              print(selectedValue8);
            },
          ),



          // Sectioning of here
SubTitle(
    title: "4.3 WELLBEING IMPACT ON THE HOUSEHOLD",
),
          MenuList(
            // On the end
            choice: selectedValue9 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderForty>().forty ?? "Nothing"}',

            ///first value
            selectedValue: "Select",
            listName: collection.yesOrNo,
            text: "A)  Were there any scholars affected?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue9 = value;
                context.read<ProviderForty>().changeValue(newValue: selectedValue9!);

                if (selectedValue9 == "select") {
                  selectedValue6 = "nothing";
                }
              });
              print(selectedValue9);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue10 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderFortyOne>().fortyOne ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.yesOrNo,
            text: "B) Was there stationery and text books damaged",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue10 = value;
                context.read<ProviderFortyOne>().changeValue(newValue: selectedValue10!);

                if (selectedValue10 == "select") {
                  selectedValue10 = "nothing";
                }
              });
              print(selectedValue10);
            },
          ),
        SubTitle(
          title: "C) Scholars Effected?",
        ),
// TODO 42 provider is empty
          fun.Table(

          ),

        SubTitle(
          title: "4.3 WELLBEING IMPACT ON THE HOUSEHOLD",
        ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFortyThree>().fortyThree == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${selectedValue11 ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.yesOrNo,
            text: "A) Is there any official document lost?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue11 = value;
                context.read<ProviderFortyThree>().changeValue(newValue: selectedValue11!);


                if (selectedValue10 == "select") {
                  selectedValue11 = "nothing";
                }
              });
              print(selectedValue11);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFortyFour>().fortyFour == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${selectedValue12 ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text:
                "B) If yes, please indicate number of official documents lost?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue12 = value;
                context.read<ProviderFortyFour>().changeValue(newValue: selectedValue12!);


                if (selectedValue12 == "select") {
                  selectedValue12 = "nothing";
                }
              });
              print(selectedValue12);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue13 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderFortyFive>().fortyFive ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.lostItem,
            text: "C) Please indicate the items that have been lost?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue13 = value;
                context.read<ProviderFortyFive>().changeValue(newValue: selectedValue13!);


                if (selectedValue13 == "select") {
                  selectedValue13 = "nothing";
                }
              });
              print(selectedValue13);
            },
          ),
          SaveButton(),
        ],
      ),
    );
  }
}
