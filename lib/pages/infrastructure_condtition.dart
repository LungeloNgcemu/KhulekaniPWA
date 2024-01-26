import 'package:flutter/material.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/list/lists.dart' as collection;
import 'package:khulekani_app/components/menu_list.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:provider/provider.dart';
import 'package:khulekani_app/provider_answers.dart';

class InfrastructureCondition extends StatefulWidget {
  const InfrastructureCondition({super.key});

  @override
  State<InfrastructureCondition> createState() =>
      _InfrastructureConditionState();
}

class _InfrastructureConditionState extends State<InfrastructureCondition> {

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

  TextEditingController controllerA = TextEditingController();

  String answerA = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          HeaderBlue(
            text: " CONDITION OF THE INFRASTRUCTURE",
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          SubTitle(
            title: '5.1. Extent of structure damage type' ,
          ),

          // 46 provider
          MenuList(
            // On the end
            choice: selectedValue1 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderFortySix>().fortySix ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "A) Number of structures in a homestead/number of households",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue1 = value;
                context.read<ProviderFortySix>().changeValue(newValue: selectedValue1!);

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
                : 'Selected: ${context.watch<ProviderFortySeven>().fortySeven ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "B) Number of partially damaged structures",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue2 = value;
                context.read<ProviderFortySeven>().changeValue(newValue: selectedValue2!);

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
                : 'Selected: ${context.watch<ProviderFortyEight>().fortyEight ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.yesOrNo,
            text: "C) Were there any homeless families? ",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue3 = value;
                context.read<ProviderFortyEight>().changeValue(newValue: selectedValue3!);

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
                : 'Selected: ${context.watch<ProviderFortyNine>().fortyNine ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "D) If yes, number of homeless families",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue4 = value;
                context.read<ProviderFortyNine>().changeValue(newValue: selectedValue4!);

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
                : 'Selected: ${context.watch<ProviderFifty>().fifty ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.accomidation,
            text: "E) Where are they accommodated?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue5 = value;
                context.read<ProviderFifty>().changeValue(newValue: selectedValue5!);

                if (selectedValue5 == "select") {
                  selectedValue5 = "nothing";
                }
              });
              print(selectedValue5);
            },
          ),

          QuestionTextStrip(
            text: "F) 1f Other Damage",
            controller: controllerA,
          ),
          SubTitle(
            title: 'Number of affected structural type' ,
          ),
          MenuList(
            // On the end
            choice: selectedValue6 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderFiftyTwo>().fiftyTwo ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.Incedents,
            text: "G) Number of effected Mud houses",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue6 = value;
                context.read<ProviderFiftyTwo>().changeValue(newValue: selectedValue6!);

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
                : 'Selected: ${context.watch<ProviderFiftyThree>().fiftyThree?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.Incedents,
            text: "H) Number of effected Informal settement/shack",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue7 = value;
                context.read<ProviderFiftyThree>().changeValue(newValue: selectedValue7!);

                if (selectedValue7 == "select") {
                  selectedValue7 = "nothing";
                }
              });
              print(selectedValue7);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue8 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderFiftyFour>().fiftyFour ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.Incedents,
            text: "I) Number of effected Formal Dwelling/Structure",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue8 = value;
              context.read<ProviderFiftyFour>().changeValue(newValue: selectedValue8!);

                if (selectedValue8 == "select") {
                  selectedValue8 = "nothing";
                }
              });
              print(selectedValue8);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue9 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderFiftyFive>().fiftyFive ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.Incedents,
            text: "J) Number of effected RDP",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue9 = value;
                context.read<ProviderFiftyFive>().changeValue(newValue: selectedValue9!);

                if (selectedValue9 == "select") {
                  selectedValue9 = "nothing";
                }
              });
              print(selectedValue9);
            },
          ),
          Divider(height: 30.0,),

          SubTitle(
            title: '5.2. Description of partial damage(s)' ,
          ),










          MenuList(
            // On the end
            choice: selectedValue11 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderFiftySix>().fiftySix ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.roofDamage,
            text: "A) Roof Damages",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue11 = value;
                context.read<ProviderFiftySix>().changeValue(newValue: selectedValue11!);

                if (selectedValue11 == "select") {
                  selectedValue11 = "nothing";
                }
              });
              print(selectedValue11);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue12 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderFiftySeven>().fiftySeven ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.structuralDamage,
            text: "B) Structural Damage",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue12 = value;
                context.read<ProviderFiftySeven>().changeValue(newValue: selectedValue12!);

                if (selectedValue12 == "select") {
                  selectedValue12 = "nothing";
                }
              });
              print(selectedValue12);
            },
          ),
          SubTitle(
            title: '5.3. Damage to essential service(s)' ,
          ),
          MenuList(
            // On the end
            choice: selectedValue13 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderFiftyEight>().fiftyEight ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.essentialServicesDamaged,
            text: "A) Essential service damaged",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue9 = value;
                context.read<ProviderFiftyEight>().changeValue(newValue: selectedValue13!);

                if (selectedValue13 == "select") {
                  selectedValue13 = "nothing";
                }
              });
              print(selectedValue13);
            },
          ),
          SaveButton(
            onPressed: (){
              context
                  .read<ProviderFiftyOne>()
                  .changeValue(newValue: controllerA.text);
            },
          ),
        ],
      ),
    );
  }
}

