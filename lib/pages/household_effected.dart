import 'package:flutter/material.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/menu_list.dart';
import 'package:khulekani_app/list/lists.dart' as collection;
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:provider/provider.dart';
import 'package:khulekani_app/provider_answers.dart';
class HouseholdEffected extends StatefulWidget {
  const HouseholdEffected({super.key});

  @override
  State<HouseholdEffected> createState() => _HouseholdEffectedState();
}

class _HouseholdEffectedState extends State<HouseholdEffected> {
 String? selectedValue1;
 String? selectedValue2;
 String? selectedValue3;
 String? selectedValue4;
 String? selectedValue5;
 String? selectedValue6;

 TextEditingController controllerA = TextEditingController();
 TextEditingController controllerB = TextEditingController();
 TextEditingController controllerC = TextEditingController();
 TextEditingController controllerD = TextEditingController();
 TextEditingController controllerE = TextEditingController();

 String answerA = "";
 String answerB = "";
 String answerC = "";
 String answerD = "";
 String answerE = "";

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Divider(color: Colors.black,),
          ),
          HeaderBlue(
            text: "DETAILS OF HOUSEHOLD AFFECTED",
          ),

          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Divider(color: Colors.black,),
          ),
          SubTitle(title: "3.1 Name of the Family",),
          QuestionTextStrip(
            text: "A) Name of the family",
            controller: controllerA,

          ),

          SubTitle(
            title: "3.2 Name of family representative",
          ),
          QuestionTextStrip(
            text: "A) Name of family representative",
            controller: controllerB,
          ),
          SubTitle(
            title: "3.3 family representative",
          ),
          QuestionTextStrip(
            text: "A) Identity number",
            controller: controllerC,
          ),
          QuestionTextStrip(
            text: "B) Cell phone number",
            controller: controllerD,
          ),
          QuestionTextStrip(
            text: "C) Alternitive number",
            controller: controllerE,
          ),
          SubTitle(
            title: "3.4 Number of Household Members",
          ),


          //provide 26
          MenuList(
            // On the end
            choice: selectedValue1 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${ context.watch<ProviderTwentySix>().twentySix ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "A) Number of household member(s) ",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue1 = value;
                context.read<ProviderTwentySix>().changeValue(newValue: selectedValue1!);

                if (selectedValue1 == "select") {
                  selectedValue1 = "nothing";
                }
              });
            },
          ),
          //start
          MenuList(
            // On the end
            choice: selectedValue2 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderTwentySeven>().twentySeven ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "B) Number of senior citizen affected (Pensioners)",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue2 = value;
                context.read<ProviderTwentySeven>().changeValue(newValue: selectedValue2!);

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
                : 'Selected: ${context.watch<ProviderTwentyEight>().twentyEight ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "C) Number of women affected ",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue3 = value;
                context.read<ProviderTwentyEight>().changeValue(newValue: selectedValue3!);

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
                : 'Selected: ${context.watch<ProviderTwentyNine>().twentyNine ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "D) Number of men affected",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue4 = value;
                context.read<ProviderTwentyNine>().changeValue(newValue: selectedValue4!);

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
                : 'Selected: ${context.watch<ProviderThirty>().thirty ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "E) Number of children affected (under 18 years)",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue5 = value;
                context.read<ProviderThirty>().changeValue(newValue: selectedValue5!);

                if (selectedValue5 == "select") {
                  selectedValue5 = "nothing";
                }
              });
              print(selectedValue5);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue6 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderThirtyOne>().thirtyOne ?? "Nothing"}',
            //provider to watch

            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "F) Number of people with disability affected",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue6 = value;
                context.read<ProviderThirtyOne>().changeValue(newValue: selectedValue6!);
                //provider to be here to read

                if (selectedValue6 == "select") {
                  selectedValue6 = "nothing";
                }
              });
              print(selectedValue6);
            },
          ),
          Divider(height: 30.0,),
          SaveButton(
            onPressed: (){
              context
                  .read<ProviderTwentyOne>()
                  .changeValue(newValue: controllerA.text);
              context
                  .read<ProviderTwentyTwo>()
                  .changeValue(newValue: controllerB.text);
              context
                  .read<ProviderTwentyThree>()
                  .changeValue(newValue: controllerC.text);
              context
                  .read<ProviderTwentyFour>()
                  .changeValue(newValue: controllerD.text);
              context
                  .read<ProviderTwentyFive>()
                  .changeValue(newValue: controllerE.text);
            },
          ),
        ],
      ),
    );
  }
}
