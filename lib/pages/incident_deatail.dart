import 'package:flutter/material.dart';
import 'package:khulekani_app/components/drop_down.dart ';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/list/lists.dart' as collection;
import 'package:khulekani_app/components/menu_list.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:khulekani_app/providers/provider_answers.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:khulekani_app/providers/clear_function.dart';
import 'package:khulekani_app/providers/saved_pages.dart';

class IncidentDetails extends StatefulWidget {
  const IncidentDetails({super.key});

  @override
  State<IncidentDetails> createState() => _IncidentDetailsState();
}

class _IncidentDetailsState extends State<IncidentDetails>
    with AutomaticKeepAliveClientMixin {
  bool isSaved = false;

  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();

  void clear2() {
    controllerA.clear();
    controllerB.clear();
    print("cleared 2");
  }
  String answerA = "";
  String answerB = "";

  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;

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
            text: "INCIDENT DETAILS",
          ),

          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          SubTitle(
            title: "2.1 Type of incident",
          ),

          //17 provider
          MenuList(
            // On the end
            choice:context.watch<ProviderSeventeen>().seventeen ?? "",
            //first value
            selectedValue: "",
            listName: collection.Incedents,
            text: "A) Type of incident",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue1 = value;
                context
                    .read<ProviderSeventeen>()
                    .changeValue(newValue: selectedValue1!);
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
            choice: context.watch<ProviderNineteen>().nineteen ?? "",
            //first value
            selectedValue: "",
            listName: collection.Incedents,
            text: "A) Cause of incident",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue2 = value;
                context
                    .read<ProviderNineteen>()
                    .changeValue(newValue: selectedValue2!);
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
            color: context.watch<ProviderSavedTwo>().two == false ? Colors.red : Colors.green[500],
            onPressed: () {
              context.read<ProviderClear2>().setMyFunction(newFunction: clear2);
              context.read<ProviderSavedTwo>().changeValue(newValue: true);
              Future<bool?> saveData() {
                context
                    .read<ProviderEighteen>()
                    .changeValue(newValue: controllerA.text);
                context
                    .read<ProviderTwenty>()
                    .changeValue(newValue: controllerB.text);
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
