import 'package:flutter/material.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/menu_list.dart';
import 'package:khulekani_app/list/lists.dart' as collection;
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:provider/provider.dart';
import 'package:khulekani_app/providers/provider_answers.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:khulekani_app/providers/clear_function.dart';
import 'package:khulekani_app/providers/saved_pages.dart';

class HouseholdEffected extends StatefulWidget {
  const HouseholdEffected({super.key});

  @override
  State<HouseholdEffected> createState() => _HouseholdEffectedState();
}

class _HouseholdEffectedState extends State<HouseholdEffected> with AutomaticKeepAliveClientMixin {
  bool isSaved = false;
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

  void clear3() {
    controllerA.clear();
    controllerB.clear();
    controllerC.clear();
    controllerD.clear();
    controllerE.clear();

    print("cleared 3");
  }


  String answerA = "";
  String answerB = "";
  String answerC = "";
  String answerD = "";
  String answerE = "";

  @override
  bool get wantKeepAlive => true;

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
            text: "DETAILS OF HOUSEHOLD AFFECTED",
          ),

          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          SubTitle(
            title: "3.1 Name of the Family",
          ),
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
            choice: context.watch<ProviderTwentySix>().twentySix ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "A) Number of household member(s) ",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue1 = value;
                context
                    .read<ProviderTwentySix>()
                    .changeValue(newValue: selectedValue1!);
              });
            },
          ),
          //start
          MenuList(
            // On the end
            choice: context.watch<ProviderTwentySeven>().twentySeven ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "B) Number of senior citizen affected (Pensioners)",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue2 = value;
                context
                    .read<ProviderTwentySeven>()
                    .changeValue(newValue: selectedValue2!);
              });
              print(selectedValue2);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderTwentyEight>().twentyEight ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "C) Number of women affected ",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue3 = value;
                context
                    .read<ProviderTwentyEight>()
                    .changeValue(newValue: selectedValue3!);
              });
              print(selectedValue3);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderTwentyNine>().twentyNine ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "D) Number of men affected",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue4 = value;
                context
                    .read<ProviderTwentyNine>()
                    .changeValue(newValue: selectedValue4!);
              });
              print(selectedValue4);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderThirty>().thirty ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "E) Number of children affected (under 18 years)",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue5 = value;
                context
                    .read<ProviderThirty>()
                    .changeValue(newValue: selectedValue5!);
              });
              print(selectedValue5);
            },
          ),
          MenuList(
            // On the end
            choice:context.watch<ProviderThirtyOne>().thirtyOne ?? "",
            //provider to watch

            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "F) Number of people with disability affected",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue6 = value;
                context
                    .read<ProviderThirtyOne>()
                    .changeValue(newValue: selectedValue6!);
                //provider to be here to read
              });
              print(selectedValue6);
            },
          ),
          Divider(
            height: 30.0,
          ),
          SaveButton(
            color: context.watch<ProviderSavedThree>().three == false ? Colors.red : Colors.green[500],
            onPressed: () {
              context.read<ProviderClear3>().setMyFunction(newFunction: clear3);
              context.read<ProviderSavedThree>().changeValue(newValue: true);
              Future<bool?> saveData() {
                // setState(() {
                //   isSaved = true;
                //
                // });
                // items here
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
