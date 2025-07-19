import 'package:flutter/material.dart';
import 'package:khulekani_app/components/menu_list.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:khulekani_app/list/lists.dart' as collection;
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/providers/provider_answers.dart';
import '../components/table.dart' as fun;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:khulekani_app/providers/saved_pages.dart';

import 'package:khulekani_app/providers/provider_answers.dart';
import 'package:provider/provider.dart';

class WellbeingImpact extends StatefulWidget {
  const WellbeingImpact({super.key});

  @override
  State<WellbeingImpact> createState() => _WellbeingImpactState();
}

class _WellbeingImpactState extends State<WellbeingImpact>
    with AutomaticKeepAliveClientMixin {
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

  bool isSaved = false;

  @override
  bool get wantKeepAlive => true;

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
            text: "WELL-BEING IMPACT ON THE HOUSEHOLD MEMBERS",
          ),
          const Divider(
            color: Colors.black,
          ),
          SubTitle(
            title: "4.1  WELLBEING IMPACT ON THE HOUSEHOLD ",
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderThirtyTwo>().thirtyTwo ?? "",
            //first value
            selectedValue: "",
            listName: collection.yesOrNo,
            text: "A) Were there any injuries?",
            //

            // provider 32
            onChanged: (String? value) {
              setState(() {
                selectedValue1 = value;
                context
                    .read<ProviderThirtyTwo>()
                    .changeValue(newValue: selectedValue1!);
              });
              print(selectedValue1);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderThirtyThree>().thirtyThree ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "B) If yes, number of injuries",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue2 = value;
                context
                    .read<ProviderThirtyThree>()
                    .changeValue(newValue: selectedValue2!);
              });
              print(selectedValue2);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderThirtyFour>().thirtyFour ?? "",
            //first value
            selectedValue: "",
            listName: collection.yesOrNo,
            text: "C) Was emergency assistance required",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue3 = value;
                context
                    .read<ProviderThirtyFour>()
                    .changeValue(newValue: selectedValue3!);
              });
              print(selectedValue3);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderThirtyFive>().thirtyFive ?? "",
            //first value
            selectedValue: "",
            listName: collection.injuredEvacuated,
            text: "D) If yes, where were injuries evacuated to?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue4 = value;
                context
                    .read<ProviderThirtyFive>()
                    .changeValue(newValue: selectedValue4!);
              });
              print(selectedValue4);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderThirtySix>().thirtySix ?? "",
            //first value
            selectedValue: "",
            listName: collection.transportForInjured,
            text: "E) What mode of transport the injured transported by?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue5 = value;
                context
                    .read<ProviderThirtySix>()
                    .changeValue(newValue: selectedValue5!);
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
            choice: context.watch<ProviderThirtySeven>().thirtySeven ?? "",
            //first value
            selectedValue: "",
            listName: collection.yesOrNo,
            text: "A) Were there any fatalities?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue6 = value;
                context
                    .read<ProviderThirtySeven>()
                    .changeValue(newValue: selectedValue6!);
              });
              print(selectedValue6);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderThirtyEight>().thirtyEight ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "B) If yes, number of fatalities",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue7 = value;
                context
                    .read<ProviderThirtyEight>()
                    .changeValue(newValue: selectedValue7!);
              });
              print(selectedValue7);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderThirtyNine>().thirtyNine ?? "",
            //first value
            selectedValue: "",
            listName: collection.yesOrNo,
            text: "C) Were fatalities confirmed & certified by SAPS?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue8 = value;
                context
                    .read<ProviderThirtyNine>()
                    .changeValue(newValue: selectedValue8!);
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
            choice: context.watch<ProviderForty>().forty ?? "",

            ///first value
            selectedValue: "",
            listName: collection.yesOrNo,
            text: "A)  Were there any scholars affected?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue9 = value;
                context
                    .read<ProviderForty>()
                    .changeValue(newValue: selectedValue9!);
              });
              print(selectedValue9);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFortyOne>().fortyOne ?? "",
            //first value
            selectedValue: "",
            listName: collection.yesOrNo,
            text: "B) Was there stationery and text books damaged",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue10 = value;
                context
                    .read<ProviderFortyOne>()
                    .changeValue(newValue: selectedValue10!);
              });
              print(selectedValue10);
            },
          ),
          SubTitle(
            title: "C) Scholars Effected?",
          ),
// TODO 42 provider is empty
          fun.TableT(),

          SubTitle(
            title: "4.3 WELLBEING IMPACT ON THE HOUSEHOLD",
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFortyThree>().fortyThree ?? "",
            //first value
            selectedValue: "",
            listName: collection.yesOrNo,
            text: "A) Is there any official document lost?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue11 = value;
                context
                    .read<ProviderFortyThree>()
                    .changeValue(newValue: selectedValue11!);
              });
              print(selectedValue11);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFortyFour>().fortyFour ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text:
                "B) If yes, please indicate number of official documents lost?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue12 = value;
                context
                    .read<ProviderFortyFour>()
                    .changeValue(newValue: selectedValue12!);
              });
              print(selectedValue12);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFortyFive>().fortyFive ?? "",
            //first value
            selectedValue: "",
            listName: collection.lostItem,
            text: "C) Please indicate the items that have been lost?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue13 = value;
                context
                    .read<ProviderFortyFive>()
                    .changeValue(newValue: selectedValue13!);
              });
              print(selectedValue13);
            },
          ),
          ///////////////////////////////////////////////////////////////////////////
          SaveButton(
            color:context.watch<ProviderSavedFour>().four == false ? Colors.red : Colors.green[500],
            onPressed: () {
              context.read<ProviderSavedFour>().changeValue(newValue: true);
              Future<bool?> saveData() {
                setState(() {
                  isSaved = true;
                });
                // items here
                return Alert(
                  context: context,
                  type: AlertType.success,
                  title: "Saved",
                  desc: "Your Data has been Saved.",
                  buttons: [
                    DialogButton(
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                      child: const Text(
                        "Done",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ).show();
              }

              saveData();
            },
            /////////////////////////////////////////////////////////////////////////////////////
          ),
        ],
      ),
    );
  }
}
