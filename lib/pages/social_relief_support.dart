import 'package:flutter/material.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/menu_list.dart';
import 'package:khulekani_app/list/lists.dart' as collection;
import 'package:khulekani_app/components/subtitle.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/provider_answers.dart';
import 'package:provider/provider.dart';


class SocialReliefSupport extends StatefulWidget {
  const SocialReliefSupport({super.key});

  @override
  State<SocialReliefSupport> createState() => _SocialReliefSupportState();
}

class _SocialReliefSupportState extends State<SocialReliefSupport> {

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

  TextEditingController controllerA = TextEditingController();

  String answerA = "";

  @override
  Widget build(BuildContext context) {
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
            text: "SOCIAL RELIEF SUPPORTSOCIAL RELIEF SUPPORT",
          ),
          const Padding(
            padding: EdgeInsets.only(top: 1.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          MenuList(
            // On the end
            choice: selectedValue1 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderFiftyNine>().fiftyNine ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.yesOrNo,
            text: "Was there any immediate relief assistance issued?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue1 = value;
                context.read<ProviderFiftyNine>().changeValue(newValue: selectedValue1!);

                if (selectedValue1 == "select") {
                  selectedValue1 = "nothing";
                }
              });
              print(selectedValue1);
            },
          ),
          SubTitle(
            title: "6.1. If yes, indicate critical immediate relief assistance issued",
          ),



          MenuList(
            // On the end
            choice: selectedValue2 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderSixty>().sixty ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.yesOrNo,
            text: "A) Temp Shelter",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue2 = value;
                context.read<ProviderSixty>().changeValue(newValue: selectedValue2!);

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
                : 'Selected: ${context.watch<ProviderSixtyOne>().sixtyOne ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.yesOrNo,
            text: "B) Soup Kitchen",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue3 = value;
                context.read<ProviderSixtyOne>().changeValue(newValue: selectedValue3!);

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
                : 'Selected: ${context.watch<ProviderSixtyTwo>().sixtyTwo ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "C) No. Food parcel ",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue4 = value;
                context.read<ProviderSixtyTwo>().changeValue(newValue: selectedValue4!);

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
                : 'Selected: ${context.watch<ProviderSixtyThree>().sixtyThree ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "D) No. of Tents",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue5 = value;
                context.read<ProviderSixtyThree>().changeValue(newValue: selectedValue5!);

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
                : 'Selected: ${context.watch<ProviderSixtyFour>().sixtyFour ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "E) No. of Blankets",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue6 = value;
                context.read<ProviderSixtyFour>().changeValue(newValue: selectedValue6!);

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
                : 'Selected: ${context.watch<ProviderSixtyFive>().sixtyFive ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "F) No. of Sponges",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue7 = value;
                context.read<ProviderSixtyFive>().changeValue(newValue: selectedValue7!);

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
                : 'Selected: ${context.watch<ProviderSixtySix>().sixtySix ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "G) No. of Plastic Sheeting",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue8 = value;
                context.read<ProviderSixtySix>().changeValue(newValue: selectedValue8!);

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
                : 'Selected: ${context.watch<ProviderSixtySeven>().sixtySeven ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "H) No. of Stove",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue9 = value;
                context.read<ProviderSixtySeven>().changeValue(newValue: selectedValue9!);

                if (selectedValue9 == "select") {
                  selectedValue9 = "nothing";
                }
              });
              print(selectedValue9);
            },
          ),
          MenuList(
            // On the end
            choice: selectedValue10 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderSixtyNine>().sixtyNine ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.numbers20,
            text: "I) No. of Pot set & Cutlery",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue10 = value;
                context.read<ProviderSixtyNine>().changeValue(newValue: selectedValue10!);

                if (selectedValue10 == "select") {
                  selectedValue10 = "nothing";
                }
              });
              print(selectedValue10);
            },
          ),



          //provider 70
          QuestionTextStrip(
            text: "J) Other",
            controller: controllerA,
          ),
          SubTitle(
            title: "6.2. Please indicate the kind of intervention that is required",
          ),
          MenuList(
            // On the end
            choice: selectedValue11 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderSeventyOne>().seventyOne ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.intervention,
            text: "A) kind of intervention that is required",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue11 = value;
                context.read<ProviderSeventyOne>().changeValue(newValue: selectedValue11!);

                if (selectedValue11 == "select") {
                  selectedValue11 = "nothing";
                }
              });
              print(selectedValue11);
            },
          ),
SaveButton(
  onPressed: (){
    context
        .read<ProviderSeventy>()
        .changeValue(newValue: controllerA.text);
  },
),
        ],
      ),
    );
  }
}
