import 'package:flutter/material.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/menu_list.dart';
import 'package:khulekani_app/list/lists.dart' as collection;
import 'package:khulekani_app/components/subtitle.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/providers/provider_answers.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:khulekani_app/providers/clear_function.dart';
import 'package:khulekani_app/providers/saved_pages.dart';

class SocialReliefSupport extends StatefulWidget {
  const SocialReliefSupport({super.key});

  @override
  State<SocialReliefSupport> createState() => _SocialReliefSupportState();
}

class _SocialReliefSupportState extends State<SocialReliefSupport>
    with AutomaticKeepAliveClientMixin {
  bool isSaved = false;

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
  TextEditingController controllerB = TextEditingController();

  void clear5() {
    controllerA.clear();
    controllerB.clear();
    print("cleared 5");
  }


  String answerA = "";

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
            choice: context.watch<ProviderFiftyNine>().fiftyNine ?? "",
            //first value
            selectedValue: "",
            listName: collection.yesOrNo,
            text: "Was there any immediate relief assistance issued?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue1 = value;
                context
                    .read<ProviderFiftyNine>()
                    .changeValue(newValue: selectedValue1!);
              });
              print(selectedValue1);
            },
          ),
          SubTitle(
            title:
                "6.1. If yes, indicate critical immediate relief assistance issued",
          ),

          MenuList(
            // On the end
            choice: context.watch<ProviderSixty>().sixty ?? "",
            //first value
            selectedValue: "",
            listName: collection.yesOrNo,
            text: "A) Temp Shelter",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue2 = value;
                context
                    .read<ProviderSixty>()
                    .changeValue(newValue: selectedValue2!);
              });
              print(selectedValue2);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderSixtyOne>().sixtyOne ?? "",
            //first value
            selectedValue: "",
            listName: collection.yesOrNo,
            text: "B) Soup Kitchen",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue3 = value;
                context
                    .read<ProviderSixtyOne>()
                    .changeValue(newValue: selectedValue3!);
              });
              print(selectedValue3);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderSixtyTwo>().sixtyTwo ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "C) No. Food parcel ",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue4 = value;
                context
                    .read<ProviderSixtyTwo>()
                    .changeValue(newValue: selectedValue4!);
              });
              print(selectedValue4);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderSixtyThree>().sixtyThree ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "D) No. of Tents",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue5 = value;
                context
                    .read<ProviderSixtyThree>()
                    .changeValue(newValue: selectedValue5!);
              });
              print(selectedValue5);
            },
          ),

          MenuList(
            // On the end
            choice: context.watch<ProviderSixtyFour>().sixtyFour ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "E) No. of Blankets",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue6 = value;
                context
                    .read<ProviderSixtyFour>()
                    .changeValue(newValue: selectedValue6!);
              });
              print(selectedValue6);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderSixtyFive>().sixtyFive ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "F) No. of Sponges",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue7 = value;
                context
                    .read<ProviderSixtyFive>()
                    .changeValue(newValue: selectedValue7!);
              });
              print(selectedValue7);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderSixtySix>().sixtySix ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "G) No. of Plastic Sheeting",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue8 = value;
                context
                    .read<ProviderSixtySix>()
                    .changeValue(newValue: selectedValue8!);
              });
              print(selectedValue8);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderSixtySeven>().sixtySeven ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "H) No. of Stove",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue9 = value;
                context
                    .read<ProviderSixtySeven>()
                    .changeValue(newValue: selectedValue9!);
              });
              print(selectedValue9);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderSixtyNine>().sixtyNine ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "I) No. of Pot set & Cutlery",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue10 = value;
                context
                    .read<ProviderSixtyNine>()
                    .changeValue(newValue: selectedValue10!);
              });
              print(selectedValue10);
            },
          ),
          /////////////////////////////////////////////////////////////////////////////////////////////////////

          MenuList(
            // On the end
            choice: context.watch<ProviderEightyOne>().eightyOne ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "J) No. of Mattresses ",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue12 = value;
                context
                    .read<ProviderEightyOne>()
                    .changeValue(newValue: selectedValue12!);
              });
              print(selectedValue12);
            },
          ),
          MenuList(
            // On the end
             choice: context.watch<ProviderEightyTwo>().eightyTwo ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "K) No. of Lightning conductor ",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue13 = value;
                context
                    .read<ProviderEightyTwo>()
                    .changeValue(newValue: selectedValue13!);
              });
              print(selectedValue13);
            },
          ),



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          //provider 70
          QuestionTextStrip(
            text: "L) Other",
            controller: controllerA,
          ),
          SubTitle(
            title:
                "6.2. Please indicate the kind of intervention that is required",
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderSeventyOne>().seventyOne ?? "",
            //first value
            selectedValue: "",
            listName: collection.intervention,
            text: "A) kind of intervention that is required",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue11 = value;
                context
                    .read<ProviderSeventyOne>()
                    .changeValue(newValue: selectedValue11!);
              });
              print(selectedValue11);
            },
          ),
          QuestionTextStrip(
            text: "B) Other",
            controller: controllerB,
          ),
          SaveButton(
            color: context.watch<ProviderSavedSix>().six == false ? Colors.red : Colors.green[500],
            onPressed: () {
              context.read<ProviderClear5>().setMyFunction(newFunction: clear5);
              context.read<ProviderSavedSix>().changeValue(newValue: true);
              Future<bool?> saveData() {
                setState(() {
                  isSaved = true;
                });
                // items here

                context
                    .read<ProviderSeventy>()
                    .changeValue(newValue: controllerA.text);

                context
                    .read<ProviderEightyThree>()
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
            /////////////////////////////////////////////////////////////////////////////////////
          ),
        ],
      ),
    );
  }
}
