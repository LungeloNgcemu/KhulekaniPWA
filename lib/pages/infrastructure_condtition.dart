import 'package:flutter/material.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/list/lists.dart' as collection;
import 'package:khulekani_app/components/menu_list.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:provider/provider.dart';
import 'package:khulekani_app/providers/provider_answers.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:khulekani_app/providers/clear_function.dart';
import 'package:khulekani_app/providers/saved_pages.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


class InfrastructureCondition extends StatefulWidget {
  const InfrastructureCondition({super.key});

  @override
  State<InfrastructureCondition> createState() =>
      _InfrastructureConditionState();
}

class _InfrastructureConditionState extends State<InfrastructureCondition>
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
  String? selectedValue14;

  TextEditingController controllerA = TextEditingController();
  List<String> selected = [];

  void clear4() {
    controllerA.clear();
    print("cleared 4");
  }

  String answerA = "";

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  List<String> selectedItems = [];
  List<String> list = [];



  @override
  bool get wantKeepAlive => true;

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
            title: '5.1. Extent of structure damage type',
          ),

          // 46 provider
          MenuList(
            // On the end
            choice: context.watch<ProviderFortySix>().fortySix ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "A) Number of structures in a homestead/number of households",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue1 = value;
                context
                    .read<ProviderFortySix>()
                    .changeValue(newValue: selectedValue1!);
              });
              print(selectedValue1);
            },
          ),
//TODO
          MenuList(
            // On the end
            choice: context.watch<ProviderEighty>().eighty ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "B) Number of formal house/structure",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue14 = value;
                context
                    .read<ProviderEighty>()
                    .changeValue(newValue: selectedValue14!);
              });
              print(selectedValue14);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFortySeven>().fortySeven ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "C) Number of partially damaged structures",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue2 = value;
                context
                    .read<ProviderFortySeven>()
                    .changeValue(newValue: selectedValue2!);
              });
              print(selectedValue2);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFortyEight>().fortyEight ?? "",
            //first value
            selectedValue: "",
            listName: collection.yesOrNo,
            text: "D) Were there any homeless families? ",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue3 = value;
                context
                    .read<ProviderFortyEight>()
                    .changeValue(newValue: selectedValue3!);
              });
              print(selectedValue3);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFortyNine>().fortyNine ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "E) If yes, number of homeless families",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue4 = value;
                context
                    .read<ProviderFortyNine>()
                    .changeValue(newValue: selectedValue4!);
              });
              print(selectedValue4);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFifty>().fifty ?? "",
            //first value
            selectedValue:null,
            listName: collection.accomidation,
            text: "F) Where are they accommodated?",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue5 = value;
                context
                    .read<ProviderFifty>()
                    .changeValue(newValue: selectedValue5!);
              });
              print(selectedValue5);
            },
          ),

          QuestionTextStrip(
            text: "G)  Other Damage",
            controller: controllerA,
          ),
          SubTitle(
            title: 'Number of affected structural type',
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFiftyTwo>().fiftyTwo ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "H) Number of effected Mud houses",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue6 = value;
                context
                    .read<ProviderFiftyTwo>()
                    .changeValue(newValue: selectedValue6!);
              });
              print(selectedValue6);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFiftyThree>().fiftyThree ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "1) Number of effected Informal settement/shack",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue7 = value;
                context
                    .read<ProviderFiftyThree>()
                    .changeValue(newValue: selectedValue7!);
              });
              print(selectedValue7);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFiftyFour>().fiftyFour ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "J) Number of effected Formal Dwelling/Structure",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue8 = value;
                context
                    .read<ProviderFiftyFour>()
                    .changeValue(newValue: selectedValue8!);
              });
              print(selectedValue8);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFiftyFive>().fiftyFive ?? "",
            //first value
            selectedValue: "",
            listName: collection.numbers20,
            text: "K) Number of effected RDP",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue9 = value;
                context
                    .read<ProviderFiftyFive>()
                    .changeValue(newValue: selectedValue9!);
              });
              print(selectedValue9);
            },
          ),
          Divider(
            height: 30.0,
          ),

          SubTitle(
            title: '5.2. Description of partial damage(s)',
          ),

          MenuList(
            // On the end
            choice: context.watch<ProviderFiftySix>().fiftySix ?? "",
            //first value
            selectedValue: "",
            listName: collection.roofDamage,
            text: "A) Roof Damages",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue11 = value;
                context
                    .read<ProviderFiftySix>()
                    .changeValue(newValue: selectedValue11!);
              });
              print(selectedValue11);
            },
          ),
          MenuList(
            // On the end
            choice: context.watch<ProviderFiftySeven>().fiftySeven ?? "",
            //first value
            selectedValue: "",
            listName: collection.structuralDamage,
            text: "B) Structural Damage",
            //
            onChanged: (String? value) {
              setState(() {
                selectedValue12 = value;
                context
                    .read<ProviderFiftySeven>()
                    .changeValue(newValue: selectedValue12!);
              });
              print(selectedValue12);
            },
          ),
          //TODO !!!!!!!!!!!!!!!!!!!!!!!!!

          SubTitle(
            title: '5.3. Damage to essential service(s)',
          ),
          DropMenu(
            message: "A) Essential service damaged",
            display: list.join(','),
            onChanged:(value) {},
            value:selectedItems.isEmpty ? null : selectedItems.last,
            items: collection.essentialServicesDamaged.map((item) {
              return DropdownMenuItem(
                value: item,
          //disable default onTap to avoid closing menu when selecting an item
                enabled: false,
                child: StatefulBuilder(
                  builder: (context, menuSetState) {
                    final isSelected = selectedItems.contains(item);
                    return InkWell(
                      onTap: () {
                        isSelected
                            ? selectedItems.remove(item)
                            : selectedItems.add(item);
                        print(selectedItems);
                        context
                            .read<ProviderFiftyEight>()
                            .changeValue(newValue: selectedItems!);
                 list =       Provider.of<ProviderFiftyEight>(context, listen: false).fiftyEight;
          //This rebuilds the StatefulWidget to update the button's text
                        setState(() {});
          //This rebuilds the dropdownMenu Widget to update the check mark
                        menuSetState(() {});
                      },
                      child: Container(
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            if (isSelected)

                              const Icon(Icons.check_box_outlined)
                            else
                              const Icon(Icons.check_box_outline_blank),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
            selectedItemBuilder: (context) {
              return items.map((item) {
                  return Container(
                   // alignment: AlignmentDirectional.center,
                    child: Text(
                      selectedItems.join(', '),
                      style: const TextStyle(
          //Font Size
                        fontSize: 20,
                        color: Colors.black,

                        //overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  );
                },
              ).toList();
            },
          ),
          // MenuList(
          //   // On the end
          //   choice: context.watch<ProviderFiftyEight>().fiftyEight ?? "",
          //   //first value
          //   selectedValue: "",
          //   listName: collection.essentialServicesDamaged,
          //   text: "A) Essential service damaged",
          //   //
          //   onChanged: (String? value) {
          //     setState(() {
          //       selectedValue13 = value;
          //       context
          //           .read<ProviderFiftyEight>()
          //           .changeValue(newValue: selectedValue13!);
          //     });
          //     print(selectedValue13);
          //   },
          // ),

          SaveButton(
            color: context.watch<ProviderSavedFive>().five == false
                ? Colors.red
                : Colors.green[500],
            onPressed: () {
              context.read<ProviderClear4>().setMyFunction(newFunction: clear4);
              context.read<ProviderSavedFive>().changeValue(newValue: true);
              Future<bool?> saveData() {
                setState(() {
                  isSaved = true;
                });
                // items here
                context
                    .read<ProviderFiftyOne>()
                    .changeValue(newValue: controllerA.text);
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
