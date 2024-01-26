import 'package:flutter/material.dart';
import 'package:khulekani_app/components/drop_down.dart ';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/list/lists.dart' as collection;
import 'package:khulekani_app/components/menu_list.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:khulekani_app/provider_answers.dart';
import 'package:provider/provider.dart';

class IncidentDetails extends StatefulWidget {
  const IncidentDetails({super.key});

  @override
  State<IncidentDetails> createState() => _IncidentDetailsState();
}

class _IncidentDetailsState extends State<IncidentDetails> {

  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();

  String answerA = "";
  String answerB = "";

  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Divider(color: Colors.black,),
          ),
          HeaderBlue(
            text:"INCIDENT DETAILS" ,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Divider(color: Colors.black,),
          ),
          SubTitle(
            title: "2.1 Type of incident",
          ),

          //17 provider
          MenuList(
            // On the end
            choice: selectedValue1 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderSeventeen>().seventeen ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.Incedents,
            text: "A) Type of incident",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue1 = value;
                context.read<ProviderSeventeen>().changeValue(newValue: selectedValue1!);

                if (selectedValue1 == "select") {
                  selectedValue1 = "nothing";
                }
              });

            },
          ),

          //provider 18
          QuestionTextStrip(
            text: "B) Other Type of incident",
            controller: controllerA,
          ),
          SubTitle(
            title: " Cause of incident",
          ),
          MenuList(
            // On the end
            choice: selectedValue2 == "Select"
                ? "Selectd Nothing"
                : 'Selected: ${context.watch<ProviderNineteen>() ?? "Nothing"}',
            //first value
            selectedValue: "Select",
            listName: collection.Incedents,
            text: "A) Cause of incident",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue2 = value;
                context.read<ProviderNineteen>().changeValue(newValue: selectedValue2!);

                if (selectedValue2 == "select") {
                  selectedValue2 = "nothing";
                }
              });
              print(selectedValue2);
            },
          ),
          QuestionTextStrip(
            text: "B) Other Cause of incident",
            controller: controllerB,
          ),
          Divider(
            height: 30,
          ),
          SaveButton(
            onPressed: (){
              context
                  .read<ProviderEighteen>()
                  .changeValue(newValue: controllerA.text);
              context
                  .read<ProviderTwenty>()
                  .changeValue(newValue: controllerB.text);
            },
          )
        ],
      ),
    );
  }
}
