import 'package:flutter/material.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:khulekani_app/providers/provider_answers.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:khulekani_app/providers/saved_pages.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:khulekani_app/providers/clear_function.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen>
    with AutomaticKeepAliveClientMixin {
  TextEditingController controller = TextEditingController();

  void clear8() {
    controller.clear();
    setState(() {
      text = '';
    });

    print("cleared 8");
  }

  String text = '';

  @override
  bool get wantKeepAlive => true;

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          HeaderBlue(
            text: 'Special Notes',
          ),
          SubTitle(
            title: "Notes",
          ),
          QuestionTextStrip(
            onChanged: (String value) {
              setState(() {
                text = controller.text;
              });
            },
            controller: controller,
            text: 'Enter Notes ',
          ),
          Container(
            height: h * 0.45,
            width: w * 0.7,
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 30.0),
                    softWrap: true,
                  ),
                ),
              ),
            ),
          ),
          SaveButton(
            color: context.watch<ProviderSavedEight>().eight == false
                ? Colors.red
                : Colors.green[500],
            onPressed: () {
              context.read<ProviderClear8>().setMyFunction(newFunction: clear8);
              context.read<ProviderSavedEight>().changeValue(newValue: true);
              context.read<ProviderNotes>().changeValue(newValue: text);
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
          )
        ],
      ),
    );
  }
}
