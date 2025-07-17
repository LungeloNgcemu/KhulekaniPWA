import 'package:flutter/material.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/providers/provider_answers.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:khulekani_app/providers/clear_function.dart';
import 'package:khulekani_app/providers/saved_pages.dart';

class AgriculturalDamages extends StatefulWidget {
  const AgriculturalDamages({super.key});

  @override
  State<AgriculturalDamages> createState() => _AgriculturalDamagesState();
}

class _AgriculturalDamagesState extends State<AgriculturalDamages>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = false;

  void save() {
    context.read<ProviderSeventyTwo>().changeValue(newValue: controllerA.text);
    context
        .read<ProviderSeventyThree>()
        .changeValue(newValue: controllerB.text);
    context.read<ProviderSeventyFour>().changeValue(newValue: controllerC.text);
    context.read<ProviderSeventyFive>().changeValue(newValue: controllerD.text);
    context.read<ProviderSeventySix>().changeValue(newValue: controllerE.text);
    context
        .read<ProviderSeventySeven>()
        .changeValue(newValue: controllerF.text);


  }

  ///////////////////////////////////

  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();
  TextEditingController controllerC = TextEditingController();
  TextEditingController controllerD = TextEditingController();
  TextEditingController controllerE = TextEditingController();
  TextEditingController controllerF = TextEditingController();

  void clear6() {
    controllerA.clear();
    controllerB.clear();
    controllerC.clear();
    controllerD.clear();
    controllerE.clear();
    controllerF.clear();
    print("cleared 6");
  }

  String answerA = "";
  String answerB = "";
  String answerC = "";
  String answerD = "";
  String answerE = "";
  String answerF = "";

  @override
  bool get wantKeepAlive => true;

  Widget build(BuildContext context) {
    return isLoading == true
        ? Builder(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: CircularProgressIndicator()),
              ],
            );
          })
        : SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 1.0),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                HeaderBlue(
                  text: "AGRICULTURAL DAMAGE – PRELIMINARY SURVEY",
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 1.0),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                SubTitle(
                  title: "AGRICULTURAL DAMAGE",
                ),
                QuestionTextStrip(
                  text: "A) Infrastructure",
                  controller: controllerA,
                ),
                QuestionTextStrip(
                  text: "B) Livestock",
                  controller: controllerB,
                ),
                QuestionTextStrip(
                  text: "C) Crop losses",
                  controller: controllerC,
                ),
                QuestionTextStrip(
                  text: "D) Soil degredation",
                  controller: controllerD,
                ),
                QuestionTextStrip(
                  text: "E) Job opportunities",
                  controller: controllerE,
                ),
                QuestionTextStrip(
                  text: "F) Veld(Grazing burnt)",
                  controller: controllerF,
                ),
                SaveButton(
                color: context.watch<ProviderSavedNine>().nine == false ? Colors.red : Colors.green[500],
                  onPressed: () async {
                    context.read<ProviderSavedNine>().changeValue(newValue: true);
                    context
                        .read<ProviderClear6>()
                        .setMyFunction(newFunction: clear6);

                    save();

                    Future<bool?> saveData() {
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
